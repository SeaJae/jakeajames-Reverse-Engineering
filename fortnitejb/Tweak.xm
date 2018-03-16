#include <Foundation/Foundation.h>
#include <mach-o/dyld.h>

char *notablst[] = {"/bin/bash", "/Applications/Cydia.app", "/bin/sh", "/bin", "/Applications", ".safeMode"}; //if I use a NSArray* the entire app breaks, what??

%hook NSFileManager
-(BOOL)fileExistsAtPath:(NSString *)path {
    //NSLog(@"FORTNITE: filexsistsatpath: %@", path);
    if ([path isEqualToString:@"/Applications/Cydia.app"] || [path isEqualToString:@"/bin/bash"] || [path isEqualToString:@"/bin/sh"]) { //same thing if I use the array here, the app just breaks, at least for me, it broke
        NSLog(@"FORTNITE: BLOCKED %@", path);
        return NO;
    }
    return %orig;
}
%end

MSHook(FILE *, fopen, const char* path, const char* mode) {
    for (int i = 0; i < 6; i++) {
        if (strstr(path, notablst[i])) {
            NSLog(@"FORTNITE: blocked %s", path);
            return NULL;
        }
    }
    return _fopen(path, mode);
}

//didn't see a call to fork() on the logs nor I think this is possible with the current Electra sandbox patches, but it's never bad to add it. who knows
MSHook(pid_t, fork) {
    NSLog(@"FORTNITE: fork()");
    return -1;
}

//taken from NoSub/Palbreak https://github.com/Skylerk99/PalBreak
static void ppfix_image_added(const struct mach_header *mh, intptr_t slide) {
    Dl_info image_info;
    int result = dladdr(mh, &image_info);
    if (result == 0) {
        return;
    }
    const char *image_name = image_info.dli_fname;
    if (strstr(image_name, "/Library/MobileSubstrate") != NULL || strstr(image_name, "/Library/Frameworks/CydiaSubstrate.framework") != NULL || strstr(image_name, "/usr/lib/libsubstrate.dylib") != NULL || strstr(image_name, "/usr/lib/TweakInject") != NULL) {
        NSLog(@"FORTNITE: FOUND IMAGE %s", image_name);
        void *handle = dlopen(image_name, RTLD_NOLOAD);
        if (handle) {
            dlclose(handle);
        }
    }
    setenv("_SafeMode", "0", true); //this doesn't work, which according to what coolstar said and what I understood, it should've. Nevertheless manually going to safe mode and loading only this dylib also ain't enough, so I won't bother fixing this for now
}
__attribute__((constructor)) static void initialize() {
    NSLog(@"FORTNITE: LOADED");
    MSHookFunction(fopen, MSHake(fopen));
    MSHookFunction(fork, MSHake(fork));
    _dyld_register_func_for_add_image(&ppfix_image_added);
}
