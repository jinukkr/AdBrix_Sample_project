//
//  AppDelegate.swift
//  AdBrixSampleProject_ios
//
//  Created by Jin-uk Park on 2021/03/09.
//

import UIKit
import AdBrixRM
import AppTrackingTransparency


@main
class AppDelegate: UIResponder, UIApplicationDelegate, AdBrixRMDeferredDeeplinkDelegate {
    
    
    func didReceiveDeferredDeeplink(deeplink: String) {
        
        print ("DeferredDeeplink ::::::" + deeplink)
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // AdBrixRM 인스턴스 생성
            let adBrix = AdBrixRM.getInstance
        
        ATTrackingManager.requestTrackingAuthorization {(status) in
            
            switch status{
            
            case.authorized:
                adBrix.startGettingIDFA()
                
            case.denied:
                adBrix.stopGettingIDFA()
                
            case.notDetermined :
                adBrix.stopGettingIDFA()
                
            case.restricted:
                adBrix.stopGettingIDFA()
                
            default:
                adBrix.stopGettingIDFA()
                
            }
        }

            // adbrix 앱키&시크릿키 설정
            adBrix.initAdBrix(appKey: "x3Qz9T9JrESWCIuoXnun0A", secretKey: "oJozKmiERUOZQ4DK7JtbeQ")
        
        adBrix.delegateDeferredDeeplink = self
        
        return true
    }

    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // AdBrixRM 인스턴스 생성
        let adBrix = AdBrixRM.getInstance
        // 딥링크 오픈 트래킹 코드 호출
        adBrix.deepLinkOpen(url: url)
        
        return true
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

