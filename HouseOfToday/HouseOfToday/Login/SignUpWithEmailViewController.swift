//
//  SignUpWithEmailViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class SignUpWithEmailViewController: UIViewController {

  // MARK: - My Peoperties
  var user: User?

  let houseOfTodayService = HouseOfTodayService()

  // MARK: - UI Properties
  private lazy var emailTextField: LoginTextField = {
    let tf = LoginTextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "이메일"
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

  private lazy var checkPasswordTextField: LoginTextField = {
    let tf = LoginTextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "비밀번호 확인"
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

  private lazy var nickNameTextField: LoginTextField = {
    let tf = LoginTextField(frame: .zero)
    tf.delegate = self.self
    tf.placeholder = "별명"
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.layer.borderWidth = 0.3
    tf.autocapitalizationType = .none
    tf.autocorrectionType = .no
    tf.spellCheckingType = .no
    tf.returnKeyType = .done
    view.addSubview(tf)
    return tf
  }()

  private lazy var signupButton: UIButton = {
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
  var checkPasswordTextFieldHeight: Constraint?

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

    self.nickNameTextField.snp.makeConstraints {
      $0.top.equalTo(checkPasswordTextField.snp.bottom).offset(15)
    }

    self.signupButton.snp.makeConstraints {
      $0.top.equalTo(nickNameTextField.snp.bottom).offset(30)
    }

    [emailTextField, passwordTextField, checkPasswordTextField, nickNameTextField, signupButton].forEach {
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.9)
        $0.height.equalToSuperview().multipliedBy(0.06)
      }
    }
  }

  var loginWithEmailVC: SigninWithEmailViewController?

  // MARK: - Network
  private func postSignUpUserData(withUserData user: User?) {

    guard let user = user else { return logger("user is nil") }
    guard let encodedTest = user.percentEscaped().data(using: .utf8) else {
      return logger("JSON Can't encode Data")
    }
    print("test : \(user.percentEscaped())")

    houseOfTodayService.postSignUpUserData(withBody: encodedTest) {
      result in
      switch result {
      case .success(let value):
        print("회원가입 완료", value)
        let alert = UIAlertController.show("회원가입이 완료되었습니다.", { (_) in
          self.navigationController?.pushViewController(self.loginWithEmailVC!, animated: true)
        })
        DispatchQueue.main.async {
          self.present(alert, animated: true, completion: nil)
        }
      case .failure(let error):
        logger(error)
        // 더 세세한 오류들을 알려줘야 한다. 이미 가입된 회원입니다. 라든지.
        let alert = UIAlertController.show("회원가입 오류", nil)
        DispatchQueue.main.async {
          self.present(alert, animated: true, completion: nil)
        }
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
        let username = self.nickNameTextField.text
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
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let emailText = emailTextField.text,
      let passwordText = passwordTextField.text,
      let checkPasswordText = checkPasswordTextField.text,
      let nickNameText = nickNameTextField.text
      else { logger("text of textFiled is nil "); return false }
    if !emailText.isEmpty && !passwordText.isEmpty && !checkPasswordText.isEmpty && !nickNameText.isEmpty {
      signupButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    } else {
      signupButton.backgroundColor = .lightGray
    }
    return true
  }
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let emailText = emailTextField.text,
      let passwordText = passwordTextField.text,
      let checkPasswordText = checkPasswordTextField.text,
      let nickNameText = nickNameTextField.text
      else { return logger("text of textFiled is nil ") }
    if textField.placeholder == "비밀번호 확인" {
      if passwordText != checkPasswordText {
        checkPasswordTextField.layer.borderColor = UIColor.red.cgColor
        // 텍스트 필드 레이아웃 다시 잡기 . UpdateConstraint 안먹네.
      } else {
        checkPasswordTextField.layer.borderColor = UIColor.lightGray.cgColor
      }
    }
  }
}
