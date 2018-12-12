@import UIKit;
#import "UIView+React.h"
#import "RCTOpenTokPublisherView.h"
#import "RCTOpenTokSharedInfo.h"

@implementation RCTOpenTokPublisherView

- (void)didMoveToWindow {
  [super didMoveToSuperview];

  if (self.window) {
    [self initPublisherView];
  } else {
    [self deinitPublisherView];
  }
}

- (void)adjustViewToScreenSize {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.outgoingVideoPublisher) {
        NSLog(@"RCTOpenTokPublisherView.adjustViewToScreenSize");
//        CGFloat width = [UIScreen mainScreen].bounds.size.width;
//        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        CGFloat width = 100.0f;
        CGFloat height = width * 4 / 3;

        [sharedInfo.outgoingVideoPublisher.view setFrame:CGRectMake(0, 0, width, height)];
    } else {
        NSLog(@"RCTOpenTokPublisherView.adjustViewToScreenSize no outgoingVideoPublisher");
    }
}

- (void)initPublisherView {
  NSLog(@"RCTOpenTokSubscriberView.initPublisherView");
  if (!self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.outgoingVideoPublisher) {
      [self addSubview:sharedInfo.outgoingVideoPublisher.view];
      self.initialized = true;
      [self adjustViewToScreenSize];
      NSLog(@"RCTOpenTokSubscriberView.initPublisherView initialized");
    } else {
      NSLog(@"RCTOpenTokSubscriberView.initPublisherView no subscriber");
    }
  } else {
    NSLog(@"RCTOpenTokSubscriberView.initPublisherView already initialized");
  }
}

- (void)reactSetFrame:(CGRect)frame
{
    [self adjustViewToScreenSize];
}

- (void)deinitPublisherView {
  NSLog(@"RCTOpenTokSubscriberView.deinitPublisherView");
  if (self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.outgoingVideoPublisher) {
      [sharedInfo.outgoingVideoPublisher.view removeFromSuperview];
      self.initialized = false;
    } else {
      NSLog(@"RCTOpenTokSubscriberView.deinitPublisherView no subscriber");
    }
  } else {
    NSLog(@"RCTOpenTokSubscriberView.deinitPublisherView already deinitialized");
  }

}

- (void)dealloc {
  [self deinitPublisherView];
}

@end
