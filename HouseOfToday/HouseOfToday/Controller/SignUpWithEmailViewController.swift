//
//  SignUpWithEmailViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SignUpWithEmailViewController: UIViewController {

  // MARK: - My Peoperties
  var user: User?
  var userTest: [String: Any] = ["email": "", "password": "", "username": ""]

  let houseOfTodayService: HouseOfTodayServiceType = HouseOfTodayService()

  // MARK: - UI Properties
  private lazy var emailTextField: UITextField = {
    let tf = UITextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "  이메일"
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

  private lazy var passwordTextField: UITextField = {
    let tf = UITextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "  비밀번호"
    //tf.borderStyle = UITextField.BorderStyle.line
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.layer.borderWidth = 0.3
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.returnKeyType = .done
    view.addSubview(tf)
    return tf
  }()

  private lazy var checkPasswordTextField: UITextField = {
    let tf = UITextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "  비밀번호 확인"
    //tf.borderStyle = UITextField.BorderStyle.line
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.layer.borderWidth = 0.3
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.returnKeyType = .done
    view.addSubview(tf)
    return tf
  }()

  private lazy var userNameTextField: UITextField = {
    let tf = UITextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "  별명"
    //tf.borderStyle = UITextField.BorderStyle.line
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.layer.borderWidth = 0.3
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.returnKeyType = .done
    view.addSubview(tf)
    return tf
  }()

  private lazy var loginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("가입하기", for: .normal)
    bt.setTitleColor(.white, for: .normal)
    bt.backgroundColor = .lightGray
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.addTarget(self, action: #selector(buttonsDidTapped(_:)), for: .touchUpInside)
    view.addSubview(bt)
    return bt
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "이메일로 초간단 가입"
    self.view.backgroundColor = .white
    postLoginUserInfoTest()
    makeContraints()
  }

  private func postLoginUserInfoTest() {
//    let test = User(email: "signuptest10@gmail.com", password: "ckdtlr12", userName: "signuptest10")
//
//    guard let encodedTest = try? JSONEncoder().encode(test) else {
//      return logger("JSON Can't encode Data")
//    }

    let test = ["email": "signuptest1011@gmail.com", "password": "ckdtlr12", "username": "signuptest1011"]

//    guard let encodedTest = try? JSONSerialization.data(withJSONObject: test, options: .prettyPrinted) else {
//       return logger("JSON Can't encode Data")
//    }

    guard let encodedTest = test.percentEscaped().data(using: .utf8) else {
      return logger("JSON Can't encode Data")
    }

//    let encodedTest = """
//{
//  "email" : "signuptest50@gmail.com",
//  "password" : "ckdtlr12",
//  "username" : "signuptest50"
//}
//""".data(using: .utf8)

//    let encodedTest = "email=signuptest56@gmail.com&password=ckdtlr12&username=Sicc".data(using: .utf8)

    houseOfTodayService.postLoginUserInfo(withBody: encodedTest) {
      result in
      switch result {
      case .success(let value):
        print(value)
      case .failure(let error):
        print(error)
      }
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
  }

  private func makeContraints() {

    let guide = view.safeAreaLayoutGuide
    self.emailTextField.snp.makeConstraints {
      $0.top.equalTo(guide.snp.top).offset(30)
    }

    self.passwordTextField.snp.makeConstraints {
      $0.top.equalTo(emailTextField.snp.bottom).offset(15)
    }

    self.checkPasswordTextField.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
    }

    self.userNameTextField.snp.makeConstraints {
      $0.top.equalTo(checkPasswordTextField.snp.bottom).offset(15)
    }

    self.loginButton.snp.makeConstraints {
      $0.top.equalTo(userNameTextField.snp.bottom).offset(30)
    }

    [emailTextField, passwordTextField, checkPasswordTextField, userNameTextField, loginButton].forEach {
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.9)
        $0.height.equalToSuperview().multipliedBy(0.06)
      }
    }
  }
}

// MARK: - Action Methods
extension SignUpWithEmailViewController {

  @objc private func leftBarButtonIsTapped(_ sender: Any) {
    self.navigationController?.popToRootViewController(animated: true)
  }

  @objc private func buttonsDidTapped(_ sender: UIButton) {
    switch sender.titleLabel?.text {
    case "가입하기":
      print("가입하기 버튼 클릭됨")
      guard let email = self.emailTextField.text,
        let password = self.checkPasswordTextField.text,
        let userName = self.userNameTextField.text
        else { return logger("Text of TextFields is nil")}

      self.userTest["email"] = email
      self.userTest["password"] = password
      self.userTest["username"] = userName

      print("데이터 잘 들어가나 : ", self.userTest)
    default:
      break
    }
  }
}

extension SignUpWithEmailViewController: UITextFieldDelegate {

}

