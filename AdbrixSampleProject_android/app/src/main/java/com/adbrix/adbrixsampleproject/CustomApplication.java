package com.adbrix.adbrixsampleproject;

import android.app.Application;
import android.os.Build;

import com.igaworks.v2.core.application.AbxActivityHelper;
import com.igaworks.v2.core.application.AbxActivityLifecycleCallbacks;

public class CustomApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        AbxActivityHelper.initializeSdk(CustomApplication.this, "3rvJ2x4r7Uieu9BC1hq8fQ", "VjxaxXcrhkeYSEcRrBsNZA");

        registerActivityLifecycleCallbacks(new AbxActivityLifecycleCallbacks());


    }
}
