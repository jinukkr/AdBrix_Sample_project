package com.adbrix.adbrixsampleproject;

import android.app.Application;
import android.os.Build;

import com.igaworks.v2.core.application.AbxActivityHelper;
import com.igaworks.v2.core.application.AbxActivityLifecycleCallbacks;

public class CustomApplication extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        AbxActivityHelper.initializeSdk(CustomApplication.this, "x3Qz9T9JrESWCIuoXnun0A", "oJozKmiERUOZQ4DK7JtbeQ");

        registerActivityLifecycleCallbacks(new AbxActivityLifecycleCallbacks());


    }
}
