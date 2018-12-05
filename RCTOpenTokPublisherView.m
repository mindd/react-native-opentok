@import UIKit;
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

- (void)initPublisherView {
  NSLog(@"RCTOpenTokSubscriberView.initPublisherView");
  if (!self.initialized) {
    RCTOpenTokSharedInfo *sharedInfo = [RCTOpenTokSharedInfo sharedInstance];
    if (sharedInfo.outgoingVideoPublisher) {

      NSLog(@"outgoing bounds %f,%f",self.bounds.size.width,self.bounds.size.height);

      //TODO: THIS IS HARDCODED HERE, BECAUSE CANT SEEM TO GET IT FIXED ATM.
      //SOMEHOW THE BOUNDS ARE 0,0, should be set through the RCT binding
      CGFloat width = 100.0f;
      CGFloat height = width * 4 / 3;

      [sharedInfo.outgoingVideoPublisher.view setFrame:CGRectMake(0, 0, width, height)];
      [self addSubview:sharedInfo.outgoingVideoPublisher.view];
      self.initialized = true;
      NSLog(@"RCTOpenTokSubscriberView.initPublisherView initialized");
    } else {
      NSLog(@"RCTOpenTokSubscriberView.initPublisherView no subscriber");
    }
  } else {
    NSLog(@"RCTOpenTokSubscriberView.initPublisherView already initialized");
  }
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
