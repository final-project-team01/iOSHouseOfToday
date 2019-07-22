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
  private var loginVC: UIViewController?

  private var naviVC: UINavigationController?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white

    self.loginVC = LoginViewController()
    let mainVC = MainTabBarVC()
    self.naviVC = UINavigationController(rootViewController: mainVC)

    // 로그인,로그아웃 상태 변경 이벤트 관리
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(AppDelegate.kakaoSessionDidChangeWithNotification),
                                           name: NSNotification.Name.KOSessionDidChange,
                                           object: nil)

    // 클라이언트 시크릿 설정
    KOSession.shared()?.clientSecret = "l9kIT68sZIDpRsw6vCp68q0ZWHPIqlcn"

    reloadRootViewController()

    return true
  }

  fileprivate func reloadRootViewController() {
    guard let isOpened = KOSession.shared()?.isOpen() else {
      return logger()
    }

    if !isOpened { /// 로그인 되어있지 않다면 naviVC 에서 첫 화면을 rootView 로 이동시켜 놓자.
      naviVC?.popToRootViewController(animated: true)
    }

    self.window?.rootViewController = isOpened ? self.naviVC : self.loginVC
    self.window?.makeKeyAndVisible()
  }

  @objc func kakaoSessionDidChangeWithNotification() {
    reloadRootViewController()
  }

  // MARK: - 미리 정의한 Redirection URI을 통해, 인증 과정이 올바로 진행되도록 AppDelegate에 아래와 같은 코드를 추가합니다. 해당 코드를 추가함으로서 Kakao SDK는 사용자 토큰을 취득하게 됩니다.
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    if KOSession.handleOpen(url) {
      return true
    }
    return false
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
    if KOSession.handleOpen(url) {
      return true
    }
    return false
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    KOSession.handleDidEnterBackground()
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    KOSession.handleDidBecomeActive()
  }

}
