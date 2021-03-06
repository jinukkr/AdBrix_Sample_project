//
//  SceneDelegate.swift
//  AdBrixSampleProject_ios
//
//  Created by Jin-uk Park on 2021/03/09.
//

import UIKit
import AdBrixRM

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // AdBrixRM 인스턴스 생성
        let adBrix = AdBrixRM.getInstance
        
        if connectionOptions.urlContexts.first?.url != nil {
           
          let urlinfo = connectionOptions.urlContexts.first?.url

          // 딥링크 오픈 트래킹 코드 호출
          adBrix.deepLinkOpen(url:urlinfo!)
          
        }
        
        if let userActivity = connectionOptions.userActivities.first,
           userActivity.activityType == NSUserActivityTypeBrowsingWeb,
           let urlinfo = userActivity.webpageURL{
            print ("Universial Link Open on SecneDelegate wiillConnectTo")
            adBrix.deepLinkOpen(url:urlinfo)
        }
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        
        let url = URLContexts.first!.url as NSURL
        
         // AdBrixRM 인스턴스 생성
        let adBrix = AdBrixRM.getInstance
        
        // 딥링크 오픈 트래킹 코드 호출
        adBrix.deepLinkOpen(url:url as URL)
        
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
           let adBrix = AdBrixRM.getInstance
           if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let urlinfo = userActivity.webpageURL{
               adBrix.deepLinkOpen(url:urlinfo)
           }
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

