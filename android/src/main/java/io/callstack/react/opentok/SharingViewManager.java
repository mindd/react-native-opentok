package io.callstack.react.opentok;

import android.support.annotation.Nullable;

import com.facebook.react.common.MapBuilder;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import java.util.Map;

public class SharingViewManager extends SimpleViewManager {

    public String getName() {
        return "RCTOpenTokSharingView";
    }

    protected SharingView createViewInstance(ThemedReactContext reactContext) {
        return new SharingView(reactContext);
    }

    @Override
    @Nullable
    public Map getExportedCustomDirectEventTypeConstants() {
        MapBuilder.Builder builder = MapBuilder.builder();
        for (Events event : Events.values()) {
            builder.put(event.toString(), MapBuilder.of("registrationName", event.toString()));
        }
        return builder.build();
    }
}
