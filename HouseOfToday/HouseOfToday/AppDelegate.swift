//
//  AppDelegate.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
<<<<<<< HEAD
    // window?.rootViewController = ViewController()
    window?.rootViewController = MainTabBarVC()
=======
//    window?.rootViewController = MainTabBarVC()
    window?.rootViewController = MypageVC()
>>>>>>> 88e29df93c803c54c474bbd37d6c3c80aa6be898

    return true
  }

}
