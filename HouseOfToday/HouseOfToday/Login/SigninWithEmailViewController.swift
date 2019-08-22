//
//  LoginWithEmailViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class SigninWithEmailViewController: UIViewController {

  // MARK: - My Properties
  var user: User?

  let houseOfTodayService = HouseOfTodayService()

  // MARK: - UI Properties
  private lazy var emailTextField: LoginTextField = {
    let tf = LoginTextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "이메일"
    //tf.borderStyle = UITextField.BorderStyle.line
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.layer.borderWidth = 0.3

    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.returnKeyType = .next
    view.addSubview(tf)
    return tf
  }()

  private lazy var passwordTextField: LoginTextField = {
    let tf = LoginTextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "비밀번호"
    //tf.borderStyle = UITextField.BorderStyle.line
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.layer.borderWidth = 0.3
    tf.isSecureTextEntry = true
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.returnKeyType = .done
    view.addSubview(tf)
    return tf
  }()

  private lazy var signinButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("로그인하기", for: .normal)
    bt.setTitleColor(.white, for: .normal)
    bt.backgroundColor = .lightGray
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.addTarget(self, action: #selector(buttonsDidTapped(_:)), for: .touchUpInside)
    view.addSubview(bt)
    return bt
  }()

  private lazy var resetPasswordButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("비밀번호 재설정", for: .normal)
    bt.setTitleColor(.gray, for: .normal)
    bt.backgroundColor = .clear
    bt.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    bt.addTarget(self, action: #selector(buttonsDidTapped(_:)), for: .touchUpInside)
    view.addSubview(bt)
    return bt
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

      self.title = "이메일로 로그인"
      self.view.backgroundColor = .white

      configureBarButtonItems()
      makeContraints()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print(self.emailTextField.bounds)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
  }

  private func configureBarButtonItems() {
    let leftItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(leftBarButtonIsTapped(_:)))
    self.navigationItem.setLeftBarButton(leftItem, animated: true)

    guard let leftBarButtonItem = self.navigationItem.leftBarButtonItem else { return logger("LeftBarButtonItem can't be unwrapped")}
    leftBarButtonItem.tintColor = .gray
  }

  private func makeContraints() {

    let guide = view.safeAreaLayoutGuide
    self.emailTextField.snp.makeConstraints {
      $0.top.equalTo(guide.snp.top).offset(30)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }

    self.passwordTextField.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(15)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }

    self.signinButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }

    self.resetPasswordButton.snp.makeConstraints {
      $0.top.equalTo(signinButton.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }

  }

  // MARK: - Network

  private func postLoginData(withUserData user: User?) {

    guard let user = user else { return logger("user is nil") }
    guard let encodedTest = user.percentEscaped().data(using: .utf8) else {
      return logger("JSON Can't encode Data")
    }

    houseOfTodayService.postLoginDataForGetToKen(toPath: "/get_token/", withBody: encodedTest) {
      result in
      switch result {
      case .success(let value):
        logger("이메일 로그인 토근 받기 완료 / Token : \(value)")
        let tokenInfo: [String: String] = ["token": value, "type": "email"]
        UserDefaults.standard.set(tokenInfo, forKey: "tokenInfo")
        NotificationCenter.default.post(name: NSNotification.Name("LoginDidChange"),
                                        object: nil,
                                        userInfo: ["type": (tokenInfo["type"], "login")])
      case .failure(let error):
        print(error)
        // 더 세세한 오류들을 알려줘야 한다. 이미 가입된 회원입니다. 라든지.
        UIAlertController.showMessage("이메일 로그인 에러")
      }
    }
  }

}

// MARK: - Action Methods
extension SigninWithEmailViewController {

  @objc private func leftBarButtonIsTapped(_ sender: Any) {
    self.navigationController?.popToRootViewController(animated: true)
  }

  @objc private func buttonsDidTapped(_ sender: UIButton) {
    switch sender.titleLabel?.text {
    case "로그인하기":
      print("로그인하기 버튼 클릭됨")
      guard let email = self.emailTextField.text,
        let password = self.passwordTextField.text
      else { return logger("Text of TextFields is nil")}
      self.user = User(email: email, password: password, username: nil)
      // 여기에서 getToken 통신 필요하다.
      postLoginData(withUserData: self.user)

    case "비밀번호 재설정":
      print("비밀번호 재설정 버튼 클릭됨")
    default:
      break
    }
  }
}

// MARK: - UITextFieldDelegate
extension SigninWithEmailViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let emailText = emailTextField.text,
      let passwordText = passwordTextField.text
      else { logger("text of textFiled is nil "); return false }
    if !emailText.isEmpty && !passwordText.isEmpty {
      signinButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    } else {
      signinButton.backgroundColor = .lightGray
    }
    return true
  }
}
