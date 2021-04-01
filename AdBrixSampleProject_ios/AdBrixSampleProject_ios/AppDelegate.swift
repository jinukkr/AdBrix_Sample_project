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
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // AdBrixRM instance
        let adBrix = AdBrixRM.getInstance
        
        // ATTrackingManager request for use IDFA
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

        // AdBrixRm init
        adBrix.initAdBrix(appKey: "3rvJ2x4r7Uieu9BC1hq8fQ", secretKey: "VjxaxXcrhkeYSEcRrBsNZA")
        
        // AdBrixRm DeferredDeeplink delegate init
        adBrix.delegateDeferredDeeplink = self
        
        return true
    }
    
    // DeferredDeeplink Method
    func didReceiveDeferredDeeplink(deeplink: String) {
        
        print ("AdBrix DeferredDeeplink ::::::" + deeplink)
        
    }

    // Use Open URL for track the deeplink
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let urlString = url.absoluteString
        
        print("AdBrix Deeplink :::::::" + urlString)
        
        // AdBrixRM instance
        let adBrix = AdBrixRM.getInstance
        
        // AdBrixRM Deeplink tracking API
        adBrix.deepLinkOpen(url: url)
        
        let componets = URLComponents(string: urlString)
        let items = componets?.queryItems
        let pageName = items?.filter({$0.name == "page"}).first
        let value = pageName?.value ?? ""
        
        if value == "deeplink_open" {

        }
        
    
        
        
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

