@import UIKit;
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

- (void)initSubscriberView {
  NSLog(@"RCTOpenTokSubscriberView.initSubscriberView");
  if (!self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.incomingVideoSubscriber) {
      NSLog(@"incoming bounds %f,%f",self.bounds.size.width,self.bounds.size.height);

      //TODO: THIS IS HARDCODED HERE, BECAUSE CANT SEEM TO GET IT FIXED ATM.
      //SOMEHOW THE BOUNDS ARE 0,0, should be set through the RCT binding
      CGFloat width = [UIScreen mainScreen].bounds.size.width;
      CGFloat height = [UIScreen mainScreen].bounds.size.height;

      [sharedInfo.incomingVideoSubscriber.view setFrame:CGRectMake(0, 0, width, height)];
      [self addSubview:sharedInfo.incomingVideoSubscriber.view];
      self.initialized = true;
      NSLog(@"RCTOpenTokSubscriberView.initSubscriberView initialized");
    } else {
      NSLog(@"RCTOpenTokSubscriberView.initSubscriberView no subscriber");
    }
  } else {
    NSLog(@"RCTOpenTokSubscriberView.initSubscriberView already initialized");
  }
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
