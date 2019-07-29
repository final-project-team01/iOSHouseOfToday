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
    makeContraints()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
  }

  // MARK: - Autolayout
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

  var loginWithEmailVC: LoginWithEmailViewController?

  // MARK: - Network
  private func postSignUpUserData(withUserData user: User?) {

    guard let user = user else { return logger("user is nil") }
    guard let encodedTest = user.percentEscaped().data(using: .utf8) else {
      return logger("JSON Can't encode Data")
    }

    houseOfTodayService.postSignUpUserData(withBody: encodedTest) {
      result in
      switch result {
      case .success(let value):
        print("회원가입 완료", value)
        let action = UIAlertAction(title: "확인", style: .default, handler: { (_) in
          self.navigationController?.pushViewController(self.loginWithEmailVC!, animated: true)
        })
        UIAlertController.showAlert(title: nil, message: "회원가입이 완료되었습니다.", actions: [action])
      case .failure(let error):
        print(error)
        // 더 세세한 오류들을 알려줘야 한다. 이미 가입된 회원입니다. 라든지.
        UIAlertController.showMessage("회원가입 실패")
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
        let username = self.userNameTextField.text
        else { return logger("Text of TextFields is nil")}

      self.user = User(email: email,
                       password: password,
                       username: username)

      postSignUpUserData(withUserData: self.user)

    default:
      break
    }
  }
}

extension SignUpWithEmailViewController: UITextFieldDelegate {

}
