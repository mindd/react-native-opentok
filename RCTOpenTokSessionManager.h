#import "React/RCTBridgeModule.h"
#import "React/RCTEventDispatcher.h"
#import "RCTOpenTokSharedInfo.h"

@interface RCTOpenTokSessionManager : NSObject <RCTBridgeModule, OTSessionDelegate, OTPublisherDelegate, OTSubscriberDelegate>

@property RCTOpenTokSharedInfo *sharedInfo;

@end
