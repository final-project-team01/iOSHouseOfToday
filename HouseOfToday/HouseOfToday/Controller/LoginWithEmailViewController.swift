//
//  LoginWithEmailViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class LoginWithEmailViewController: UIViewController {

  // MARK: - My Properties
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

  private lazy var loginButton: UIButton = {
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

    self.loginButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.9)
      $0.height.equalToSuperview().multipliedBy(0.06)
    }

    self.resetPasswordButton.snp.makeConstraints {
      $0.top.equalTo(loginButton.snp.bottom).offset(10)
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

    houseOfTodayService.postLoginDataForGetToKen(withBody: encodedTest) {
      result in
      switch result {
      case .success(let value):
        print("로그인 완료 / Token : \(value)")
        UIAlertController.showMessage("로그인 성공")
        NotificationCenter.default.post(name: NSNotification.Name("LoginDidChange"), object: nil)
        UserDefaults.standard.set(value, forKey: "token")
      case .failure(let error):
        print(error)
        // 더 세세한 오류들을 알려줘야 한다. 이미 가입된 회원입니다. 라든지.
        UIAlertController.showMessage("로그인 에러")
      }
    }
  }

}

// MARK: - Action Methods
extension LoginWithEmailViewController {

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
extension LoginWithEmailViewController: UITextFieldDelegate {

}
