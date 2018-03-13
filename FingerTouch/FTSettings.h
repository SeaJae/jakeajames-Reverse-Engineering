@interface FTSettings : NSObject
{
    _Bool _vibrate;
    _Bool _vibrateUp;
    _Bool _enabled;
    int _dispatchTime;
    int _ontouch;
    int _onhold;
    int _ondoubletouch;
    int _ontripletouch;
    int _ontouchandhold;
    int _ontouchlocked;
    int _onholdlocked;
    int _ondoubletouchlocked;
    int _ontripletouchlocked;
    int _ontouchandholdlocked;
    int _maxUPs;
    double _vibintensity;
}

+ (void)terminateCurrentApplication;
+ (void)toggleNotificationCenter;
+ (void)bringUpControlCenter;
+ (void)toggleRotationLock;
+ (void)toggleVirtualAssistant;
+ (void)toggleFlashLight;
+ (void)switchToLastApp;
+ (void)simulateLockButton;
+ (void)simulateHomeButton;
+ (void)toggleSwitcher;
+ (void)makeScreenshot;
+ (void)toggleReachability;
+ (void)executeActionForCode:(int)arg1;
+ (id)sharedInstance;
@property int maxUPs; // @synthesize maxUPs=_maxUPs;
@property int ontouchandholdlocked; // @synthesize ontouchandholdlocked=_ontouchandholdlocked;
@property int ontripletouchlocked; // @synthesize ontripletouchlocked=_ontripletouchlocked;
@property int ondoubletouchlocked; // @synthesize ondoubletouchlocked=_ondoubletouchlocked;
@property int onholdlocked; // @synthesize onholdlocked=_onholdlocked;
@property int ontouchlocked; // @synthesize ontouchlocked=_ontouchlocked;
@property int ontouchandhold; // @synthesize ontouchandhold=_ontouchandhold;
@property int ontripletouch; // @synthesize ontripletouch=_ontripletouch;
@property int ondoubletouch; // @synthesize ondoubletouch=_ondoubletouch;
@property int onhold; // @synthesize onhold=_onhold;
@property int ontouch; // @synthesize ontouch=_ontouch;
@property double vibintensity; // @synthesize vibintensity=_vibintensity;
@property int dispatchTime; // @synthesize dispatchTime=_dispatchTime;
@property _Bool enabled; // @synthesize enabled=_enabled;
@property _Bool vibrateUp; // @synthesize vibrateUp=_vibrateUp;
@property _Bool vibrate; // @synthesize vibrate=_vibrate;
- (void)hapticFeedbackIfNeeded:(_Bool)arg1;
- (void)loadPlist;
- (id)init;

@end

