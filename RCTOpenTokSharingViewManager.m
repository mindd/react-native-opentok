#import "RCTOpenTokSharingViewManager.h"
#import "RCTOpenTokSharingView.h"

#import <React/RCTViewManager.h>

@implementation RCTOpenTokSharingViewManager : RCTViewManager

RCT_EXPORT_MODULE()

- (UIView *)view {
    return [[RCTOpenTokSharingView alloc] init];
}

@end
