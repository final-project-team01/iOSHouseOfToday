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
final class MainTabBarVC: UITabBarController {

  let homeVC = HomeVC()
  let storeVC = StoreVC()
  let expertVC = ExpertVC()
  let myPageVC = MyPageVC()
  let addUserActivityVC = AddUserActivityVC()

  lazy var addUserActivityButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "addPostsSeleted"), for: .normal)
    button.showsTouchWhenHighlighted = true
    button.addTarget(self, action: #selector(clickedUserActivityButton(_:)), for: .touchUpInside)
    button.isHighlighted = false
    view.insertSubview(button, aboveSubview: self.tabBar)
    return button
  }()

  lazy var animateView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = .red

//    self
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
    tabBar.backgroundColor = .white
    setupTabBarItems()
  }

  // setupTabBarItems: tabbarItem Image 연결
  func setupTabBarItems() {

    homeVC.tabBarItem.image = UIImage(named: "home")
    homeVC.tabBarItem.selectedImage = UIImage(named: "homeSeleted")

    storeVC.tabBarItem.image = UIImage(named: "shop")
    storeVC.tabBarItem.selectedImage = UIImage(named: "shopSeleted")

    expertVC.tabBarItem.image = UIImage(named: "expert")
    expertVC.tabBarItem.selectedImage = UIImage(named: "expertSeleted")

    myPageVC.tabBarItem.image = UIImage(named: "user")
    myPageVC.tabBarItem.selectedImage = UIImage(named: "userSeleted")

    addUserActivityVC.tabBarItem.image = UIImage(named: "1addPostsSeleted")

    viewControllers = [homeVC, storeVC, expertVC, myPageVC, addUserActivityVC]

    
  }

  // viewDidLayoutSubviews: Layout이 다 잡힌후에 호출되는 function
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    if tabBar.subviews.count == 5, addUserActivityButton.translatesAutoresizingMaskIntoConstraints {
      print("viewDidLayoutSubviews")
      addUserActivityButton.translatesAutoresizingMaskIntoConstraints = false
      addUserActivityButton.centerXAnchor.constraint(equalTo: tabBar.subviews[4].centerXAnchor).isActive = true
      addUserActivityButton.centerYAnchor.constraint(equalTo: tabBar.subviews[4].centerYAnchor).isActive = true
    }
  }

  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    print("didSelect: \(tabBar.items?.firstIndex(of: item)), selected: \(selectedIndex)")
    hideActivityVC()
  }

  // clickedUserActivityButton: tabbar button 클릭시 호출
  @objc private func clickedUserActivityButton(_ sender: UIButton) {

    if addUserActivityButton.transform == .identity {
      showActivityVC()
    } else {
      hideActivityVC()
    }
  }

  private func showActivityVC() {
    UIView.animate(withDuration: 0.5) {
      self.addUserActivityButton.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4.0))
    }
    // show
    viewControllers?[selectedIndex].showAnimateVC()
  }

  private func hideActivityVC() {
    UIView.animate(withDuration: 0.1) {
      self.addUserActivityButton.transform = .identity
    }
    // hide
    viewControllers?[selectedIndex].presentedViewController?.dismiss(animated: true, completion: nil)
  }

}

extension MainTabBarVC: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

    print("shouldSelect")
    return true
  }
}

extension UIViewController {
  func showAnimateVC() {
    let vc = AddUserActivityVC()
    self.definesPresentationContext = true
    vc.modalPresentationStyle = .overCurrentContext
    self.present(vc, animated: false)
  }
}
