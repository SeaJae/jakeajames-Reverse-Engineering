%hook SBAnimationSettings
-(double)damping {
    return 56.0;
}
-(double)stiffness {
    return 1666.0;
}
-(double)epsilon {
    return 0.0;
}
-(double)mass {
    return 2.5;
}
%end

%hook SBReachabilitySettings
-(double)damping {
    return 56.0;
}
-(double)stiffness {
    return 1333.0;
}
-(double)epsilon {
    return 0.0;
}
-(double)mass {
    return 2.5;
}
%end

%hook SBAppSwitcherSettings
-(double)insertDamping {
    return 46.0;
}
-(double)insertStiffness {
    return 1333.0;
}
-(double)insertMass {
    return 2.5;
}
-(double)dismissAnimationDamping {
    return 56.0;
}
-(double)dismissAnimationStiffness {
    return 1333.0;
}
-(double)dismissAnimationEpsilon {
    return 0.0;
}
-(double)dismissAnimationMass {
    return 2.5;
}
-(double)presentAnimationDamping {
    return 56.0;
}
-(double)presentAnimationStiffness {
    return 1333.0;
}
-(double)presentAnimationMass {
    return 2.5;
}

%end