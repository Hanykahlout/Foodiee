//
//  AppDelegate.swift
//  Foodiee
//
//  Created by Hany Kh on 13/09/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // انا وقفت permation في info.plist عشان تزبط هاي الخطوات
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        self.window?.makeKeyAndVisible()
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        if UserDefaults.standard.string(forKey: "firstTime") != nil {
//            if UserDefaults.standard.string(forKey: "thereIsAUser") != nil {
//                let navigationController = storyboard.instantiateViewController(withIdentifier: "NCView2") as! UINavigationController
//                self.window?.rootViewController = navigationController
//
//            }else{
//                let navigationController = storyboard.instantiateViewController(withIdentifier: "NCView") as! UINavigationController
//                self.window?.rootViewController = navigationController
//            }
//        }else{
//            let firstView = storyboard.instantiateViewController(withIdentifier: "ThreeWelcomesViewController") as! ThreeWelcomesViewController
//            self.window?.rootViewController = firstView
//            UserDefaults.standard.set("yes", forKey: "firstTime")
//        }
        FirebaseApp.configure()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    //
    //        func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    //            // Called when a new scene session is being created.
    //            // Use this method to select a configuration to create the new scene with.
    //            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //        }
    //
    //        func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    //            // Called when the user discards a scene session.
    //            // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    //            // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    //        }
    
    
}

