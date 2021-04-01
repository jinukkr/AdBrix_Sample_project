# AdBrix_Sample_project

 AdBrix Sample Project for help the developer to integrate AdBrix Remastered Project.

# Purpose of this project

This project is for help the developer to understand how AdBrix SDK integration is worked. 

All of Api that use in this project based on AdBrix Remasterd SDK integration guide. 

AdBrix SDK integration guide : https://help.adbrix.io/hc/en-us/categories/360000018393-Integration-Guide

You will learn these APIs on this project.

- AdBrix SDK installation.
- AdBrix SDK init.
- Custom event and purchase event.
- Deeplink and Deferred deeplink process.
- Android Applink and iOS Universal Link process.

# Project Detail

Currently we supprot two major sample project.

- Android (Java) 
- iOS (Swift)

And we will make more sample project on future.

- Web (Javascript)
- Flutter (Dart)
- Unity (C#)

# How to run test?



## Android

1. Download "AndroidSampleProjcet_android" folder from GitHub.
2. Open the project folder form Android Studio.
3. See the project code and Enjoy the testing.
4. To See the SDK log, Install the Sample project from Android Studio and open the LogCat and tag as "Adbrix_QA".



## iOS

1. Download "AndroidSampleProjcet_ios" folder from GitHub.
2. Open the project form Xcode.
3. See the project code and Enjoy the testing.



## Test Deferred Deeplink

To test Deferred Deeplink first you must delete this sample project on your test device.

1. Click the test tracking link.

   Test Tracking Link : https://3rvj2x4r7uieu9bc1hq8fq.adtouch.adbrix.io/api/v1/click/3RTV1nnqpkKquFSVfBdFgA?deeplink_custom_path=adbrixrm%3A%2F%2Fopen%3Fpage%3Ddeeplink_open

2. Install the AdBrix Sample Project to test device.

3. Open the App. 

4. If Deferred Deeplink work correctly, You will see Deeplink View on your test device.



## Test Deeplink (or Android Applink / iOS Universial Link)

To test Deeplink you must install this sample project on your test device.

1. Click the test tracking link.

   Test Tracking Link : https://3rvj2x4r7uieu9bc1hq8fq.adtouch.adbrix.io/api/v1/click/3RTV1nnqpkKquFSVfBdFgA?deeplink_custom_path=adbrixrm%3A%2F%2Fopen%3Fpage%3Ddeeplink_open

2. App will open automatically.

3. If Deeplink work correctly, You will see Deeplink View on your test device.

4. If you click the tracking link from Made by Google app like Gmail on android device, You may open as Android Applink.

5. If you click the tracking link form Made by Apple like Safari app on iOS device, You may open as iOS Univiersial Link.









