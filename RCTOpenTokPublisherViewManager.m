#import "RCTOpenTokPublisherViewManager.h"
#import "RCTOpenTokPublisherView.h"

#import <React/RCTViewManager.h>

@implementation RCTOpenTokPublisherViewManager: RCTViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[RCTOpenTokPublisherView alloc] init];
}



@end
