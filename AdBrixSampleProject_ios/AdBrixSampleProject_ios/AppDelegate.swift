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
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // AdBrixRM instance
        let adBrix = AdBrixRM.getInstance
        
        // ATTrackingManager request for use IDFA
        // IDFA only be allowed on when ATTrackingManager is Authorized
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
    // This method receive and handle the Deferred Deeplink.
    func didReceiveDeferredDeeplink(deeplink: String) {
        
        print ("AdBrix DeferredDeeplink ::::::" + deeplink)
        
        // parcing Deferreddeeplink
        let componets = URLComponents(string: deeplink)
        let items = componets?.queryItems
        let pageName = items?.filter({$0.name == "page"}).first
        let value = pageName?.value ?? ""

        if value == "deeplink_open" {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initView = storyboard.instantiateViewController(withIdentifier: "DeeplinkView")
            
            self.window?.rootViewController = initView
            self.window?.makeKeyAndVisible()



        }
        
    }

    // Use openURL method for handle the deeplink
    // This openURL method only works at iOS 13 under. If you use SceneDelegate, it will handle deeplink.
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let urlString = url.absoluteString
        
        print("AdBrix Deeplink :::::::" + urlString)
        
        // AdBrixRM instance
        let adBrix = AdBrixRM.getInstance
        
        // AdBrixRM Deeplink tracking API
        adBrix.deepLinkOpen(url: url)
        

        // parcing deeplink
        let componets = URLComponents(string: urlString)
        let items = componets?.queryItems
        let pageName = items?.filter({$0.name == "page"}).first
        let value = pageName?.value ?? ""

        if value == "deeplink_open" {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let DeeplinkView : ViewController = storyboard.instantiateViewController(withIdentifier: "DeeplinkVeiw") as! ViewController
            
            self.window?.rootViewController = DeeplinkView

        }
        
        return true
    }
    
    // This method for handle the Universial link.
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
            guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
                let incomingURL = userActivity.webpageURL
                else {
                    return false
            }
            print("UNIVERSAL LINK :: UniversialLink was clicked !! incomingURL - \(incomingURL)")
            let adBrix = AdBrixRM.getInstance
            adBrix.deepLinkOpen(url: incomingURL)
        
        
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

