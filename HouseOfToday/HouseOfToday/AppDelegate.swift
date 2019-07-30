//
//  AppDelegate.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import GoogleSignIn
import NaverThirdPartyLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  lazy var mainNaviVC = UINavigationController(rootViewController: mainVC)
  let loginVC = LoginViewController()
  let mainVC = MainTabBarVC()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    // Data load
//    DataManager.shard.loadProductData()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()

    window?.rootViewController = mainNaviVC

    socialLoginSetting()
    reloadRootView(false, withType: ("", ""))

    // 로그인,로그아웃 상태 변경 이벤트 관리
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(loginDidChangeWithNotification),
                                           name: NSNotification.Name(rawValue: "LoginDidChange"),
                                           object: nil)

    return true
  }

  @objc func loginDidChangeWithNotification(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: (String, String)],
      let type = userInfo["type"] else { return logger("Notification sender Error") }

    switch type {
      // Kakao
    case ("kakao", "login"):
      logger("kakao login 준비 완료")
      reloadRootView(true, withType: type)
    case ("kakao", "logout"):
      logger("kakao logout 준비 완료")
      KOSession.shared()?.logoutAndClose { [weak self] (success, error) -> Void in
        guard let self = self else { return logger("weak reference error")}
        if success {
          logger("kakao Session logout 완료")
          self.reloadRootView(true, withType: type)
        } else {
          logger("Failed to Logout / reason : ", error)
          fatalError("Logout Error")
        }
      }
      checkTokenIsRemoved()

      // Naver
    case ("naver", "login"):
      logger("google login 준비 완료")
      reloadRootView(true, withType: type)
    case ("naver", "logout"):
      logger("google logout 준비 완료")
      NaverThirdPartyLoginConnection.getSharedInstance()?.resetToken()
      NaverThirdPartyLoginConnection.getSharedInstance()?.requestDeleteToken()
      reloadRootView(true, withType: type)
      checkTokenIsRemoved()

      // Google
    case ("google", "login"):
      logger("google login 준비 완료")
      reloadRootView(true, withType: type)
    case ("google", "logout"):
      logger("google logout 준비 완료")
      GIDSignIn.sharedInstance()?.signOut()
      reloadRootView(true, withType: type)
      checkTokenIsRemoved()

      // Email
    case ("email", "login"):
      reloadRootView(true, withType: type)
    case ("email", "logout"):
      reloadRootView(true, withType: type)
      checkTokenIsRemoved()

     // 둘러보기
    case ("lookAround", "login"):
      //loginNaviVC?.pushViewController(mainVC, animated: true)
      // 둘러보기로 와서 로그인 하고 싶을 때 구현 아직 안했다.
      print("둘러보기")
    default:
      break
    }
  }

  private func reloadRootView(_ isSocial: Bool, withType type: (String, String)) {

    if isSocial {
      DispatchQueue.main.async {
        if let _ = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String] {
          logger("오늘의 집 \(type.0)로 LogIn 완료")
          UIAlertController.showMessage("\(type.0) Login 완료!")
          self.loginVC.dismiss(animated: true, completion: nil)
        } else {
          logger("오늘의 집 \(type.0)로 LogOut 완료")
          UIAlertController.showMessage("\(type.0) Logout 완료!")
          self.mainNaviVC.present(self.loginVC, animated: true, completion: nil)
        }
      }
    } else {
      if let _ = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String] {
        logger("오늘의 집 email로 LogIn 완료")
        UIAlertController.showMessage("email Login 완료!")
        self.loginVC.dismiss(animated: true, completion: nil)
      } else {
        logger("오늘의 집 email로 LogOut 완료")
        UIAlertController.showMessage("email Logout 완료!")
        self.mainNaviVC.present(self.loginVC, animated: true, completion: nil)
      }
    }
//    if isSocial {
//      DispatchQueue.main.async {
//        if let _ = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String] {
//          logger("오늘의 집 \(type.0)로 LogIn 완료")
//          UIAlertController.showMessage("\(type.0) Login 완료!")
//          self.loginNaviVC?.pushViewController(self.mainVC, animated: true)
//        } else {
//          logger("오늘의 집 \(type.0)로 LogOut 완료")
//          UIAlertController.showMessage("\(type.0) Logout 완료!")
//          self.loginNaviVC?.popToViewController(self.loginVC, animated: true)
//        }
//      }
//    } else {
//      if let _ = UserDefaults.standard.object(forKey: "token") as? [String: String] {
//        loginNaviVC?.pushViewController(mainVC, animated: true)
//      } else {
//        self.loginNaviVC?.popToRootViewController(animated: false)
//        loginNaviVC?.pushViewController(loginVC, animated: true)
//      }
//    }
  }

  /// 토근 잘 제거됬는지 체크
  private func checkTokenIsRemoved() {
    if let tokenInfo = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String] {
      logger(" tokenInfo 제거 안됨!!  심각한 에러!!")
    } else {
      logger(" tokenInfo 정상 제거")
    }
  }

  // MARK: - kakao
  /// 미리 정의한 Redirection URI을 통해, 인증 과정이 올바로 진행되도록 AppDelegate에 아래와 같은 코드를 추가합니다. 해당 코드를 추가함으로서 Kakao SDK는 사용자 토큰을 취득하게 됩니다.
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    /// iOS 8 이나 그 이하 버전들은 이 메소드도 필요하다.
    guard let scheme = url.scheme else { logger("scheme is nil"); return false }
    if scheme.contains("com.googleusercontent.apps") {
      return GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication, annotation: annotation)
    }

    if KOSession.handleOpen(url) {
      return true
    }
    return false
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {

    /// 구글은 iOS 9이상부터는 이 메소드 필요하다.
    ///The method should call the handleURL method of the GIDSignIn instance, which will properly handle the URL that your application receives at the end of the authentication process.
    guard let scheme = url.scheme else { logger("scheme is nil"); return false }

    if scheme.contains("com.googleusercontent.apps") {
      if #available(iOS 9.0, *) {
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplication.OpenURLOptionsKey.annotation])
      }
    } else if scheme.contains("naver") {
      let result = NaverThirdPartyLoginConnection.getSharedInstance().receiveAccessToken(url)
      if result == CANCELBYUSER {
        print("result: \(result)")
      }
      return true
    } else if KOSession.handleOpen(url) {
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

  // MARK: - Social Login Setting
  private func socialLoginSetting() {
    // 카카오 클라이언트 시크릿 설정
    KOSession.shared()?.clientSecret = "l9kIT68sZIDpRsw6vCp68q0ZWHPIqlcn"

    // 구글 클라이언트 ID 설정
    GIDSignIn.sharedInstance().clientID = "652460223461-c85bdoq6ik9c62vef734ubjcmmijvmou.apps.googleusercontent.com"

    // 네이버 로그인 설정들
    let naverThirdPartyLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    // 네이버 앱으로 인증하는 방식을 활성화
    naverThirdPartyLoginInstance?.isNaverAppOauthEnable = true
    // SafariViewContoller에서 인증하는 방식을 활성화
    naverThirdPartyLoginInstance?.isInAppOauthEnable = true
    // 인증 화면을 iPhone의 세로 모드에서만 사용하려면
    naverThirdPartyLoginInstance?.setOnlyPortraitSupportInIphone(true)
    // 애플리케이션 이름
    naverThirdPartyLoginInstance?.appName = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String) ?? ""
    // 콜백을 받을 URL Scheme
    naverThirdPartyLoginInstance?.serviceUrlScheme = "naver"
    // 애플리케이션에서 사용하는 클라이언트 아이디
    naverThirdPartyLoginInstance?.consumerKey = "HVldOr1UoUy7AeDKeDFj"
    // 애플리케이션에서 사용하는 클라이언트 시크릿
    naverThirdPartyLoginInstance?.consumerSecret = "V3jp9QwMBT"
  }
}
