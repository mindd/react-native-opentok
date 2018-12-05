#import "RCTOpenTokSharedInfo.h"

@implementation RCTOpenTokSharedInfo

@synthesize session;
@synthesize latestIncomingVideoStream;
@synthesize incomingVideoSubscriber;
@synthesize outgoingVideoPublisher;
@synthesize outgoingVideoStream;

#pragma mark Singleton Methods

+ (id)sharedInstance {
  static RCTOpenTokSharedInfo *singleSharedInstance = nil;

//  if (singleSharedInstance == nil) {
//    singleSharedInstance = [[self alloc] init];
//  }
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    singleSharedInstance = [[self alloc] init];
    //default settings
    singleSharedInstance.audioIsOn = true;
    singleSharedInstance.videoIsOn = true;
    singleSharedInstance.cameraPosition = AVCaptureDevicePositionFront;
  });
  return singleSharedInstance;
}

- (id)init {
  if (self = [super init]) {
    session = nil;
    latestIncomingVideoStream = nil;
    incomingVideoSubscriber = nil;
    outgoingVideoPublisher = nil;
    outgoingVideoStream = nil;

  }
  return self;
}

- (void)dealloc {
  // Should never be called, but just here for clarity really.
}

@end
