#import "RCTOpenTokSubscriberViewManager.h"
#import "RCTOpenTokSubscriberView.h"

#import <React/RCTViewManager.h>

@implementation RCTOpenTokSubscriberViewManager : RCTViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[RCTOpenTokSubscriberView alloc] init];
}

@end
