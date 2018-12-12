package io.callstack.react.opentok;

import com.opentok.android.Session;
import com.opentok.android.Stream;
import com.opentok.android.Subscriber;
import com.opentok.android.Publisher;


public class OpenTokSharedInfo {
    private static final OpenTokSharedInfo ourInstance = new OpenTokSharedInfo();

    public Session session;
    public Stream latestIncomingVideoStream;
    public Subscriber incomingVideoSubscriber;
    public Publisher outgoingVideoPublisher;

    public Subscriber incomingSharingSubscriber;
    public Stream incomingSharingStream;

    public boolean audioIsOn;
    public boolean videoIsOn;
    public String cameraPosition; //FRONT / BACK

//    @property AVCaptureDevicePosition cameraPosition;

    public static OpenTokSharedInfo getInstance() {
        return ourInstance;
    }

    private OpenTokSharedInfo() {
    }
}
