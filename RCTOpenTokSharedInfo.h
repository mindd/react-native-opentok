#import <foundation/Foundation.h>
#import <OpenTok/OpenTok.h>

@interface RCTOpenTokSharedInfo : NSObject

@property OTSession *session;
@property OTStream *latestIncomingVideoStream;
@property OTSubscriber *incomingVideoSubscriber;
@property OTPublisher *outgoingVideoPublisher;
@property OTStream *outgoingVideoStream;
@property AVCaptureDevicePosition cameraPosition;
@property BOOL audioIsOn;
@property BOOL videoIsOn;

+ (id)sharedInstance;

@end
