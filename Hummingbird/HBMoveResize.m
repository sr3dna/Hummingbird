#import "HBMoveResize.h"

@implementation HBMoveResize
@synthesize eventTap = _eventTap;
@synthesize resizeSection = _resizeSection;
@synthesize tracking = _tracking;
@synthesize wndPosition = _wndPosition;
@synthesize wndSize = _wndSize;
@synthesize alwaysResizeBottomRight = _alwaysResizeBottomRight;

+ (HBMoveResize*)instance {
    static HBMoveResize *instance = nil;

    if (instance == nil) {
        instance = [[HBMoveResize alloc] init];
    }

    return instance;
}

- init {
    _window = nil;
    _runLoopSource = nil;
    return self;
}

- (AXUIElementRef)window {
    return _window;
}

- (void)setWindow:(AXUIElementRef)window {
    if (_window != nil) CFRelease(_window);
    if (window != nil) CFRetain(window);
    _window = window;
}

- (CFRunLoopSourceRef) runLoopSource {
    return _runLoopSource;
}

- (void)setRunLoopSource:(CFRunLoopSourceRef)runLoopSource {
    if (_runLoopSource != nil) CFRelease(_runLoopSource);
    if (runLoopSource != nil) CFRetain(runLoopSource);
    _runLoopSource = runLoopSource;
}

- (void)dealloc {
    if (_window != nil) CFRelease(_window);
}

@end