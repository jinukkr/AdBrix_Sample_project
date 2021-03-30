package com.adbrix.adbrixsampleproject;

import android.app.Application;
import android.os.Build;

import com.igaworks.v2.core.application.AbxActivityHelper;
import com.igaworks.v2.core.application.AbxActivityLifecycleCallbacks;

public class CustomApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        AbxActivityHelper.initializeSdk(CustomApplication.this, "fnbFMvaGgkGVcajnoIeUTw", "mj2kvH7FL0Gdv15yaX2Cuw");

        registerActivityLifecycleCallbacks(new AbxActivityLifecycleCallbacks());


    }
}
