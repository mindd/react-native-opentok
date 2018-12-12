@import UIKit;
#import "UIView+React.h"
#import "RCTOpenTokSubscriberView.h"
#import "RCTOpenTokSharedInfo.h"

@implementation RCTOpenTokSubscriberView

- (void)didMoveToWindow {
  [super didMoveToSuperview];

  if (self.window) {
    [self initSubscriberView];
  } else {
    [self deinitSubscriberView];
  }
}

- (void)adjustViewToScreenSize {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.incomingVideoSubscriber) {
        NSLog(@"RCTOpenTokSubscriberView.adjustViewToScreenSize");
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        [sharedInfo.incomingVideoSubscriber.view setFrame:CGRectMake(0, 0, width, height)];
    } else {
        NSLog(@"RCTOpenTokSubscriberView.adjustViewToScreenSize no incomingVideoSubscriber");
    }
}

- (void)initSubscriberView {
  NSLog(@"RCTOpenTokSubscriberView.initSubscriberView");
  if (!self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.incomingVideoSubscriber) {
      sharedInfo.incomingVideoSubscriber.viewScaleBehavior = OTVideoViewScaleBehaviorFit;
      [self addSubview:sharedInfo.incomingVideoSubscriber.view];
      self.initialized = true;
      [self adjustViewToScreenSize];
      NSLog(@"RCTOpenTokSubscriberView.initSubscriberView initialized");
    } else {
      NSLog(@"RCTOpenTokSubscriberView.initSubscriberView no subscriber");
    }
  } else {
    NSLog(@"RCTOpenTokSubscriberView.initSubscriberView already initialized");
  }
}

- (void)reactSetFrame:(CGRect)frame
{
    [self adjustViewToScreenSize];
}

- (void)deinitSubscriberView {
  NSLog(@"RCTOpenTokSubscriberView.deinitSubscriberView");
  if (self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.incomingVideoSubscriber) {
      [sharedInfo.incomingVideoSubscriber.view removeFromSuperview];
      self.initialized = false;
    } else {
      NSLog(@"RCTOpenTokSubscriberView.deinitSubscriberView no subscriber");
    }
  } else {
    NSLog(@"RCTOpenTokSubscriberView.deinitSubscriberView already deinitialized");
  }

}

- (void)dealloc {
    [self deinitSubscriberView];
}

@end
