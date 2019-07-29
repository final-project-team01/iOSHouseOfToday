//
//  LoginViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit
import GoogleSignIn
import NaverThirdPartyLogin

class LoginViewController: UIViewController {

  // MARK: - My Properties
  let loginWithEmailVC = LoginWithEmailViewController()
  let signUpWithEmailVC = SignUpWithEmailViewController()

  let houseOfTodayService: HouseOfTodayServiceType = HouseOfTodayService()

  // MARK: - UI Properties
  private lazy var mainImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.image = UIImage(named: "homeTest2")
    iv.contentMode = UIImageView.ContentMode.scaleAspectFill
    iv.clipsToBounds = true
    view.addSubview(iv)
    return iv
  }()

  private lazy var logoImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.image = UIImage(named: "logo")
    mainImageView.addSubview(iv)
    return iv
  }()

  private lazy var gradientImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.image = UIImage(named: "gradient")
    view.addSubview(iv)
    return iv
  }()

  private lazy var bottomLayoutGuideView: UIView = {
    let v = UIView(frame: .zero)
    view.addSubview(v)
    return v
  }()

  private lazy var socialLoginButtonStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [ self.kakaoLoginButton,
                                             self.naverLoginButton,
                                             self.googleLoginButton ])
    sv.backgroundColor = .white
    sv.axis = .vertical
    sv.alignment = .center
    sv.distribution = .fillEqually
    sv.spacing = 10
    self.bottomLayoutGuideView.addSubview(sv)
    return sv
  }()

  private lazy var kakaoLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("카카오톡으로 시작하기", for: .normal)
    bt.setImage(UIImage(named: "kakao"), for: .normal)
    bt.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
    bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    bt.backgroundColor = #colorLiteral(red: 0.977997005, green: 0.8791384101, blue: 0, alpha: 1)
    bt.setTitleColor(.black, for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.layer.cornerRadius = 5
    bt.addTarget(self, action: #selector(otherServiceLoginButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var naverLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("네이버로 시작하기", for: .normal)
    bt.setImage(UIImage(named: "naver"), for: .normal)
    bt.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
    bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    bt.backgroundColor = #colorLiteral(red: 0.1769869626, green: 0.7050512433, blue: 0.001866223989, alpha: 1)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.layer.cornerRadius = 5
    bt.addTarget(self, action: #selector(otherServiceLoginButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var googleLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("구글로 시작하기", for: .normal)
    bt.setImage(UIImage(named: "google"), for: .normal)
    bt.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
    bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    bt.backgroundColor = #colorLiteral(red: 0.2593425214, green: 0.5222951174, blue: 0.9579148889, alpha: 1)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.layer.cornerRadius = 5
    bt.addTarget(self, action: #selector(otherServiceLoginButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var emailLoginButtonStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [ self.loginWithEamilButton,
                                             self.signUpWithEmailButton,
                                             self.lookButton])
    sv.backgroundColor = .white
    sv.axis = .horizontal
    sv.alignment = .center
    sv.spacing = 10
    sv.distribution = .equalSpacing
    self.bottomLayoutGuideView.addSubview(sv)
    return sv
  }()

  private lazy var loginWithEamilButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("이메일로 로그인", for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.setTitleColor(#colorLiteral(red: 0.334025979, green: 0.3334415555, blue: 0.3345029652, alpha: 1), for: .normal)
    bt.addTarget(self, action: #selector(emailButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var signUpWithEmailButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("이메일로 가입", for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.setTitleColor(#colorLiteral(red: 0.334025979, green: 0.3334415555, blue: 0.3345029652, alpha: 1), for: .normal)
    bt.addTarget(self, action: #selector(emailButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var lookButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("둘러보기", for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.setTitleColor(.lightGray, for: .normal)
    bt.addTarget(self, action: #selector(lookButtonDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

//  private lazy var popTip: PopTip = {
//    let pt = PopTip()
//    pt.shadowOpacity = 0.5
//    pt.shadowColor = .lightGray
//    pt.shadowRadius = .pi / 2
//    pt.shadowOffset = CGSize(width: 1, height: 1)
//    pt.borderWidth = 0.1
//    pt.borderColor = .lightGray
//    pt.edgeMargin = 5
//    pt.cornerRadius = 15
//    pt.actionAnimation = .bounce(4)
//    pt.bubbleColor = .white
//    pt.textColor = .black
//    pt.font = UIFont.preferredFont(forTextStyle: .body)
//    return pt
//  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    GIDSignIn.sharedInstance()?.delegate = self
    GIDSignIn.sharedInstance()?.uiDelegate = self

    NaverThirdPartyLoginConnection.getSharedInstance()?.delegate = self

    view.bringSubviewToFront(bottomLayoutGuideView)

    makeConstraints()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // 로그인 화면만 내비게이션 바 안보이게 하기 위함.
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }

  // MARK: - AutoLayout
  private func makeConstraints() {
    // mainImageView
    mainImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(view)
      $0.height.equalTo(view.snp.height).multipliedBy(0.70)
    }

    //gradient IamgeView
    gradientImageView.snp.makeConstraints {
      $0.bottom.equalTo(mainImageView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(mainImageView.snp.height).multipliedBy(0.2)
    }

    logoImageView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(50)
      $0.leading.equalToSuperview().offset(15)
    }

    bottomLayoutGuideView.snp.makeConstraints {
      $0.top.equalTo(mainImageView.snp.bottom)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    // social login buttonStackView
    socialLoginButtonStackView.snp.makeConstraints {
      $0.height.equalToSuperview().multipliedBy(0.75)
      $0.top.equalTo(mainImageView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
    }

    socialLoginButtonStackView.arrangedSubviews.forEach {
      $0.snp.makeConstraints {
        $0.width.equalToSuperview().multipliedBy(0.9)
        //$0.height.equalToSuperview().multipliedBy(0.22)
      }
    }
    // email login buttonStackView
    emailLoginButtonStackView.snp.makeConstraints {
      $0.height.equalToSuperview().multipliedBy(0.25)
      $0.width.equalToSuperview().multipliedBy(0.8)
      $0.top.equalTo(socialLoginButtonStackView.snp.bottom)
      $0.centerX.equalToSuperview()
    }

  }
}

// MARK: - Action Methods
extension LoginViewController {
  @objc private func otherServiceLoginButtonsDidTapped(_ sender: UIButton) {

    switch sender.backgroundColor {
    case #colorLiteral(red: 0.977997005, green: 0.8791384101, blue: 0, alpha: 1):
      print("카카오 버튼 클릭")
      configureKakaoLogin()
    case #colorLiteral(red: 0.1769869626, green: 0.7050512433, blue: 0.001866223989, alpha: 1):
      print("네이버 버튼 클릭")
      NaverThirdPartyLoginConnection.getSharedInstance()?.requestThirdPartyLogin()
    case #colorLiteral(red: 0.2593425214, green: 0.5222951174, blue: 0.9579148889, alpha: 1):
      print("구글 버튼 클릭")
      GIDSignIn.sharedInstance()?.signIn()
    default:
      break
    }
  }

  @objc private func emailButtonsDidTapped(_ sender: UIButton) {
    guard let buttonTitle = sender.titleLabel?.text else { return logger("button can't be unwrapped")}
    switch buttonTitle {
    case "이메일로 로그인":
      print("이메일로 로그인 버튼 클릭")
      self.navigationController?.pushViewController(loginWithEmailVC, animated: true)
    case "이메일로 가입":
      print("이메일로 가입 버튼 클릭")
      signUpWithEmailVC.loginWithEmailVC = loginWithEmailVC
      self.navigationController?.pushViewController(signUpWithEmailVC, animated: true)
    default:
      break
    }
  }

  @objc private func lookButtonDidTapped(_ sender: UIButton) {
    print("둘러보기 버튼 클릭")
    NotificationCenter.default.post(name: Notification.Name("LoginDidChange"), object: nil, userInfo: ["type": ("lookAround", "login")])
  }

}

// MARK: - Social Login Configurations
extension LoginViewController: GIDSignInDelegate, GIDSignInUIDelegate, NaverThirdPartyLoginConnectionDelegate {

  // kakao Login
  private func configureKakaoLogin() {

    guard let session = KOSession.shared() else {
      return logger("KOSession.shared() is nil")
    }

    if session.isOpen() {
      session.close()
    }

    session.open(completionHandler: { (error) -> Void in

      // 에러처리
      if !session.isOpen() {
        if let error = error as NSError? {
          switch error.code {
          case Int(KOErrorCancelled.rawValue):
            break
          default:
            logger(error.description)
            UIAlertController.showMessage("kakao Login Error")
          }
        }
      }

      /// 사용자 정보 요청하기
      KOSessionTask.userMeTask { [weak self] (error, me) in
        guard let self = self else { return logger("weak reference error")}

        var kakaoUserInfo: [String: String] = ["type": ""]

        if let error = error as NSError? {
          UIAlertController.showMessage(error.description)

        } else if let me = me as KOUserMe? {

          kakaoUserInfo["type"] = "카카오"

          guard let id = me.id else { return logger("id가 없습니다. SignUp 필요!")}
          print("id : \(id)")
          kakaoUserInfo["unique_user_id"] = id

          print("== 카카오계정 정보 ==")
          if let account = me.account {
            if let email = account.email {
              kakaoUserInfo["email"] = email
            } else if account.emailNeedsAgreement == true {
              print("email : 사용자 동의가 필요함")
            } else {
              print("email : 없음")
            }
          }
          print("== 사용자 속성 정보 ==")
          if let properties = me.properties {
            kakaoUserInfo["username"] = properties["nickname"]
            kakaoUserInfo["social_profile"] = properties["thumbnail_image"]
          }
        }

        let encodedData = kakaoUserInfo.percentEscaped().data(using: .utf8)
        self.houseOfTodayService.postLoginDataForGetToKen(toPath: "/get_token/social/", withBody: encodedData) {
          (result) in
          switch result {
          case .success(let value):
            print("카카오 로그인 네트워크 작업 완료 / Token : \(value)")
            UIAlertController.showMessage("카카오 로그인 성공")
            let tokenInfo: [String: String] = ["token": value, "type": "kakao"]
            UserDefaults.standard.set(tokenInfo, forKey: "tokenInfo")
            NotificationCenter.default.post(name: Notification.Name("LoginDidChange"), object: nil, userInfo: ["type": (tokenInfo["type"], "login")])
          case .failure(let error):
            print(error)
            UIAlertController.showMessage("카카오 로그인 에러")
          }
        }

        /// 카카오 토근 정보 얻어오기
        KOSessionTask.accessTokenInfoTask(completionHandler: { (token, _) in
          guard let tokenInfo = token,
            let token = tokenInfo.id,
            let expires = tokenInfo.expiresInMillis
            else { return logger("token is nil") }
          print("== token 정보 ==")
          print("tokenID : \(token)")
          print("유효기간 : \(expires)")
        })
      }
    })
  }

  // google Login
  func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {

    if let error = error {
      print("구글 로그인 에러 : \(error.localizedDescription)")
    } else {
      // Perform any operations on signed in user here.
      var googleUserInfo: [String: String] = ["type": "구글"]

      guard let user = user,
        let userID = user.userID,
        let email = user.profile.email,
        let username = user.profile.givenName
        else { return logger("Google UserInfo Errror")}
      googleUserInfo["unique_user_id"] = userID
      googleUserInfo["email"] = email
      googleUserInfo["username"] = username
      // 프로필 이미지가 없으면 nil 이 아니라 빈 문자열
      googleUserInfo["social_profile"] = user.profile.imageURL(withDimension: 110)?.description ?? ""

      /// Networking
      let encodedData = googleUserInfo.percentEscaped().data(using: .utf8)
      self.houseOfTodayService.postLoginDataForGetToKen(toPath: "/get_token/social/", withBody: encodedData) { (result) in
        switch result {
        case .success(let value):
          logger("구글 로그인 네트워크 작업 완료 / Token : \(value)")
          let tokenInfo: [String: String] = ["token": value, "type": "google"]
          UserDefaults.standard.set(tokenInfo, forKey: "tokenInfo")
          NotificationCenter.default.post(name: Notification.Name("LoginDidChange"), object: nil, userInfo: ["type": (tokenInfo["type"], "login")])
        case .failure(let error):
          logger(error)
          UIAlertController.showMessage("구글 로그인 에러")
        }
      }
    }
  }

  // naver Login
  func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
    // 로그인 성공 (로그인된 상태에서 requestThirdPartyLogin()를 호출하면 이 메서드는 불리지 않는다.)
    self.naverDataFetch()
  }
  func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
    // 로그인된 상태(로그아웃이나 연동해제 하지않은 상태)에서 로그인 재시도
    self.naverDataFetch()
  }

  func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
    //  접근 토큰, 갱신 토큰, 연동 해제등이 실패

  }

  func oauth20ConnectionDidFinishDeleteToken() {
    // 연동해제 콜백

  }

  func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
    self.present(NLoginThirdPartyOAuth20InAppBrowserViewController(request: request), animated: true, completion: nil)
  }

  func naverDataFetch() {
    var naverUserInfo: [String: String] = ["type": "네이버"]
    guard let naverConnection = NaverThirdPartyLoginConnection.getSharedInstance() else { return }
    guard let accessToken = naverConnection.accessToken else { return }
    let authorization = "Bearer \(accessToken)"

    if let url = URL(string: "https://openapi.naver.com/v1/nid/me") {
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      request.setValue(authorization, forHTTPHeaderField: "Authorization")
      URLSession.shared.dataTask(with: request) { (data, response, _) in
        guard let data = data else { return logger("Network Error when fetch UserInfo of Naver") }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return logger("Error at Decoding Data to JSON") }
        guard let response = json["response"] as? [String: AnyObject],
          let id = response["id"] as? String,
          let email = response["email"] as? String,
          let nickname = response["nickname"] as? String
        else { return logger("Parsing Error - Naver UserInfo")}
        let profileImage = response["profile_image"] as? String ?? ""

        naverUserInfo["unique_user_id"] = id
        naverUserInfo["email"] = email
        naverUserInfo["username"] = nickname
        naverUserInfo["social_profile"] = profileImage

        /// Networking
        let encodedData = naverUserInfo.percentEscaped().data(using: .utf8)
        self.houseOfTodayService.postLoginDataForGetToKen(toPath: "/get_token/social/", withBody: encodedData) { (result) in
          switch result {
          case .success(let value):
            logger("네이버 로그인 네트워크 작업 완료 / Token : \(value)")
            let tokenInfo: [String: String] = ["token": value, "type": "naver"]
            UserDefaults.standard.set(tokenInfo, forKey: "tokenInfo")
            NotificationCenter.default.post(name: Notification.Name("LoginDidChange"), object: nil, userInfo: ["type": (tokenInfo["type"], "login")])
          case .failure(let error):
            logger(error)
            UIAlertController.showMessage("네이버 로그인 에러")
          }
        }
      }.resume()

    }
  }

}
