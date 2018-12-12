@import UIKit;
#import "UIView+React.h"
#import "RCTOpenTokSharingView.h"
#import "RCTOpenTokSharedInfo.h"

@implementation RCTOpenTokSharingView

- (void)didMoveToWindow {
  [super didMoveToSuperview];

  if (self.window) {
    [self initSharingView];
  } else {
    [self deinitSharingView];
  }
}


- (void)adjustViewToScreenSize {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.incomingSharingSubscriber) {
        NSLog(@"RCTOpenTokSharingView.adjustViewToScreenSize");
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        [sharedInfo.incomingSharingSubscriber.view setFrame:CGRectMake(0, 0, width, height)];
    } else {
        NSLog(@"RCTOpenTokSharingView.adjustViewToScreenSize no incomingSharingSubscriber");
    }
}


- (void)initSharingView {
  NSLog(@"RCTOpenTokSharingView.initSharingView");
  if (!self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.incomingSharingSubscriber) {
      sharedInfo.incomingSharingSubscriber.viewScaleBehavior = OTVideoViewScaleBehaviorFit;
      [self addSubview:sharedInfo.incomingSharingSubscriber.view];
      self.initialized = true;
      [self adjustViewToScreenSize];
      NSLog(@"RCTOpenTokSharingView.initSharingView initialized");
    } else {
      NSLog(@"RCTOpenTokSharingView.initSharingView no sharing");
    }
  } else {
    NSLog(@"RCTOpenTokSharingView.initSharingView already initialized");
  }
}

- (void)reactSetFrame:(CGRect)frame
{
    [self adjustViewToScreenSize];
}

- (void)deinitSharingView {
  NSLog(@"RCTOpenTokSharingView.deinitSharingView");
  if (self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.incomingSharingSubscriber) {
      [sharedInfo.incomingSharingSubscriber.view removeFromSuperview];
      self.initialized = false;
    } else {
      NSLog(@"RCTOpenTokSharingView.deinitSharingView no sharing");
    }
  } else {
    NSLog(@"RCTOpenTokSharingView.deinitSharingView already deinitialized");
  }

}

- (void)dealloc {
    [self deinitSharingView];
}

@end
