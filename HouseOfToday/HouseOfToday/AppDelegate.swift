//
//  AppDelegate.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private var loginVC: UINavigationController?

  private var mainVC: UINavigationController?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white

    self.loginVC = UINavigationController(rootViewController: LoginViewController())
    let mainVC = MainTabBarVC()
    self.mainVC = UINavigationController(rootViewController: mainVC)

    // 로그인,로그아웃 상태 변경 이벤트 관리
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(loginDidChangeWithNotification),
                                           name: NSNotification.Name(rawValue: "LoginDidChange"),
                                           object: nil)

    // 카카오 클라이언트 시크릿 설정
    KOSession.shared()?.clientSecret = "l9kIT68sZIDpRsw6vCp68q0ZWHPIqlcn"

    // 구글 클라이언트 ID 설정
    GIDSignIn.sharedInstance().clientID = "652460223461-c85bdoq6ik9c62vef734ubjcmmijvmou.apps.googleusercontent.com"


    self.window?.makeKeyAndVisible()
    if let _ = UserDefaults.standard.object(forKey: "token") as? [String: String] {
      self.window?.rootViewController = self.mainVC
    } else {
      self.loginVC?.popToRootViewController(animated: false)
      self.window?.rootViewController = self.loginVC
    }

    return true
  }

  @objc func loginDidChangeWithNotification(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: (String, String)],
      let type = userInfo["type"] else { return logger("Notification sender Error") }

    defer {
      reloadRootView(withType: type)
    }
    switch type {
    case ("kakao", "login"):
      logger("kakao login 성공")
//      reloadRootView(withType: type)
    case ("kakao", "logout"):
      logger("kakao logout 성공")
//      reloadRootView(withType: type)
    case ("naver", ""):
      reloadRootView(withType: type)
    case ("google", "login"):
      logger("google login 성공")
//      reloadRootView(withType: type)
    case ("google", "logout"):
      logger("google logout 성공")
//      reloadRootView(withType: type)
    case ("email", ""):
      reloadRootView(withType: type)

    default:
      break
    }

    /// 토근 잘 제거됬는지 확인해보자
    if let tokenInfo = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String] {
      logger(" tokenInfo 제거 안됨!!  심각한 에러!!")
    } else {
      logger(" tokenInfo 정상 제거")
    }
  }

  private func reloadRootView(withType type: (String, String)) {
    DispatchQueue.main.async {
      if let _ = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String] {
        print("\(type.0) LogIn 완료")
        self.window?.rootViewController = self.mainVC
      } else {
        print("\(type.0) LogOut 완료")
        UIAlertController.showMessage(type.0 + " Logout 완료!")
        self.loginVC?.popToRootViewController(animated: false)
        self.mainVC?.popToRootViewController(animated: false)
        self.window?.rootViewController = self.loginVC
      }
    }
  }

  // MARK: - kakao
  /// 미리 정의한 Redirection URI을 통해, 인증 과정이 올바로 진행되도록 AppDelegate에 아래와 같은 코드를 추가합니다. 해당 코드를 추가함으로서 Kakao SDK는 사용자 토큰을 취득하게 됩니다.
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

    print("test1", url.scheme)
    if KOSession.handleOpen(url) {
      return true
    }
    return false
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
    print("test2", url.scheme)
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

  // MARK: - Google

}

//extension AppDelegate: GIDSignInDelegate {
//  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//    print("")
//  }
//
//}
