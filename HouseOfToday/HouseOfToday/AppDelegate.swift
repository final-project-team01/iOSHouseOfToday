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
    //window?.rootViewController = ViewController()

    /// 창식 테스트
    let tabBarController = UITabBarController()
    tabBarController.setViewControllers([CategoryTabBarViewController()], animated: true)
    window?.rootViewController = tabBarController

    return true
  }

}
