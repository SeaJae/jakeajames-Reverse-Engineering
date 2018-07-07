addr_t find_trustcache(void) {
    addr_t call, func;
    addr_t ref = find_strref("%s: only allowed process can check the trust cache", 1, 1);
    if (!ref) {
        return 0;
    }
    ref -= kerndumpbase;
    call = step64_back(kernel, ref, 44, INSN_CALL);
    if (!call) {
        return 0;
    }
    func = follow_call64(kernel, call);
    if (!func) {
        return 0;
    }
    call = step64(kernel, func, 32, INSN_CALL);
    if (!call) {
        return 0;
    }
    func = follow_call64(kernel, call);
    if (!func) {
        return 0;
    }
    call = step64(kernel, func, 32, INSN_CALL);
    if (!call) {
        return 0;
    }
    call = step64(kernel, call + 4, 32, INSN_CALL);
    if (!call) {
        return 0;
    }
    func = follow_call64(kernel, call);
    if (!func) {
        return 0;
    }
    call = step64(kernel, func, 48, INSN_CALL);
    if (!call) {
        return 0;
    }
    return calc64(kernel, call, call + 24, 21) + kerndumpbase;
}
