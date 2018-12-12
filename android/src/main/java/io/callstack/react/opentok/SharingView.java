package io.callstack.react.opentok;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;

import com.facebook.react.uimanager.ThemedReactContext;

public class SharingView extends FrameLayout {

    private boolean initialized;

    public SharingView(ThemedReactContext reactContext) {
        super(reactContext);
        initialized = false;
    }

    @Override
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        initSharingView();
    }

    @Override
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        deinitSharingView();
    }

    private void initSharingView() {
        if (!initialized) {
            OpenTokSharedInfo sharedInfo = OpenTokSharedInfo.getInstance();
            if (sharedInfo.incomingSharingSubscriber != null) {
                //attach frame to my view
                View view = sharedInfo.incomingSharingSubscriber.getView();
                addView(view, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
                requestLayout();
                initialized = true;
                Log.d("OPENTOK","OpenTokPublisherView.initSharingView initialized");
            } else {
                Log.d("OPENTOK","OpenTokPublisherView.initSharingView no subscriber");
            }
        } else {
            Log.d("OPENTOK","OpenTokPublisherView.initSharingView already initialized");
        }
    }

    private void deinitSharingView() {
        if (initialized) {

            OpenTokSharedInfo sharedInfo = OpenTokSharedInfo.getInstance();
            if (sharedInfo.incomingSharingSubscriber != null) {
                removeView(sharedInfo.incomingSharingSubscriber.getView());
                initialized = false;
                Log.d("OPENTOK","OpenTokPublisherView.deinitSharingView deinitialized");
            } else {
                Log.d("OPENTOK","OpenTokPublisherView.deinitSharingView no subscriber");
            }
        } else {
            Log.d("OPENTOK","OpenTokPublisherView.deinitSharingView already deinitialized");
        }
    }

}
