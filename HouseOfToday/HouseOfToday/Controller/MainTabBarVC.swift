//
//  MainTabBarVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

/*
 Custom Tab bar 
*/
class MainTabBarVC: UITabBarController {

  let homeVC = HomeVC()
  let storeVC = StoreVC()
  let expertVC = ExpertVC()
  let myPageVC = MyPageVC()
  let addUserActivityVC = AddUserActivityVC()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    setupTabBarItems()
  }

  func setupTabBarItems() {
    homeVC.tabBarItem.image = UIImage(named: "home")
    homeVC.tabBarItem.selectedImage = UIImage(named: "homeSeleted")

    storeVC.tabBarItem.image = UIImage(named: "shop")
    storeVC.tabBarItem.selectedImage = UIImage(named: "shopSeleted")

    expertVC.tabBarItem.image = UIImage(named: "expert")
    expertVC.tabBarItem.selectedImage = UIImage(named: "expertSeleted")

    myPageVC.tabBarItem.image = UIImage(named: "user")
    myPageVC.tabBarItem.selectedImage = UIImage(named: "userSeleted")

    addUserActivityVC.tabBarItem.image = UIImage(named: "addPosts")
    addUserActivityVC.tabBarItem.selectedImage = UIImage(named: "addPostsSeleted")

    viewControllers = [homeVC, storeVC, expertVC, myPageVC, addUserActivityVC]

    if let items = tabBar.items {
      for tabBarItem in items {
        tabBarItem.title = ""
        tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
      }
    }
  }
}

extension MainTabBarVC: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    if viewController.isKind(of: AddUserActivityVC.self) {

      print("fa")
      return false
    }

    return true
  }
}
