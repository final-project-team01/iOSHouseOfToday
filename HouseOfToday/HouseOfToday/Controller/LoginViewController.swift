//
//  LoginViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit
import AMPopTip

class LoginViewController: UIViewController {

  // MARK: - Properties
  private lazy var mainImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.backgroundColor = .gray
    iv.alpha = 0.5
    view.addSubview(iv)
    return iv
  }()

//  private lazy var gradientView: UIView = {
//    let v = UIView(frame: .zero)
//    v.alpha = 0
//    v.backgroundColor = .red
//    view.addSubview(v)
//    return v
//  }()

  private lazy var bottomLayoutGuideView: UIView = {
    let v = UIView(frame: .zero)
    view.addSubview(v)
    return v
  }()

  private lazy var loginButtonStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [ self.kakaoLoginButton,
                                             self.naverLoginButton,
                                             self.googleLoginButton ])
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
    bt.backgroundColor = #colorLiteral(red: 0.977997005, green: 0.8791384101, blue: 0, alpha: 1)
    bt.setTitleColor(.black, for: .normal)
    bt.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
    bt.layer.cornerRadius = 10
    bt.addTarget(self, action: #selector(otherServiceLoginButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var naverLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("네이버로 시작하기", for: .normal)
    bt.backgroundColor = #colorLiteral(red: 0.1769869626, green: 0.7050512433, blue: 0.001866223989, alpha: 1)
    bt.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
    bt.layer.cornerRadius = 10
    bt.addTarget(self, action: #selector(otherServiceLoginButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var googleLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("구글로 시작하기", for: .normal)
    bt.backgroundColor = #colorLiteral(red: 0.2593425214, green: 0.5222951174, blue: 0.9579148889, alpha: 1)
    bt.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
    bt.layer.cornerRadius = 10
    bt.addTarget(self, action: #selector(otherServiceLoginButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var emailStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [ self.loginWithEamilButton,
                                             self.signUpWithEmailButton,
                                             self.lookButton])
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
    bt.setTitleColor(#colorLiteral(red: 0.334025979, green: 0.3334415555, blue: 0.3345029652, alpha: 1), for: .normal)
    bt.addTarget(self, action: #selector(emailButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var signUpWithEmailButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("이메일로 가입", for: .normal)
    bt.setTitleColor(#colorLiteral(red: 0.334025979, green: 0.3334415555, blue: 0.3345029652, alpha: 1), for: .normal)
    bt.addTarget(self, action: #selector(emailButtonsDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var lookButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("둘러보기", for: .normal)
    bt.setTitleColor(.lightGray, for: .normal)
    bt.addTarget(self, action: #selector(lookButtonDidTapped(_:)), for: .touchUpInside)
    return bt
  }()

  private lazy var popTip: PopTip = {
    let pt = PopTip()
    pt.shadowOpacity = 0.5
    pt.shadowColor = .lightGray
    pt.shadowRadius = .pi / 2
    pt.shadowOffset = CGSize(width: 1, height: 1)
    pt.borderWidth = 0.1
    pt.borderColor = .lightGray
    pt.edgeMargin = 5
    pt.cornerRadius = 15
    pt.actionAnimation = .bounce(4)
    pt.bubbleColor = .white
    pt.textColor = .black
    pt.font = UIFont.preferredFont(forTextStyle: .body)
    return pt
  }()

  private var firstCallFlag = false
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if !firstCallFlag {
      popTip.show(text: "  ⚡️ 3초만에 빠른 회원가입  ", direction: .up, maxWidth: 400, in: bottomLayoutGuideView, from: kakaoLoginButton.frame)
      popTip.frame.origin.y -= 15

      firstCallFlag = true
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    makeConstraints()
  }

  private func makeConstraints() {

    // mainImageView
    mainImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(view)
      $0.height.equalTo(view.snp.height).multipliedBy(0.66)
    }

    bottomLayoutGuideView.snp.makeConstraints {
      $0.top.equalTo(mainImageView.snp.bottom)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    // buttonStackView
    loginButtonStackView.snp.makeConstraints {
      $0.height.equalToSuperview().multipliedBy(0.75)
      $0.top.equalTo(mainImageView.snp.bottom)
      $0.leading.trailing.equalToSuperview()
    }

    loginButtonStackView.arrangedSubviews.forEach {
      $0.snp.makeConstraints {
        $0.width.equalToSuperview().multipliedBy(0.9)
        //$0.height.equalToSuperview().multipliedBy(0.22)
      }
    }

    emailStackView.snp.makeConstraints {
      $0.height.equalToSuperview().multipliedBy(0.25)
      $0.width.equalToSuperview().multipliedBy(0.8)
      $0.top.equalTo(loginButtonStackView.snp.bottom)
      $0.centerX.equalToSuperview()
    }

    // gradient View
//    gradientView.snp.makeConstraints {
//      $0.bottom.equalTo(mainImageView.snp.bottom)
//      $0.leading.trailing.equalToSuperview()
//      $0.height.equalTo(mainImageView.snp.height).multipliedBy(0.2)
//    }

  }
}

extension LoginViewController {
  @objc private func otherServiceLoginButtonsDidTapped(_ sender: UIButton) {

    switch sender.backgroundColor {
    case #colorLiteral(red: 0.977997005, green: 0.8791384101, blue: 0, alpha: 1):
      logger("카카오")
    case #colorLiteral(red: 0.1769869626, green: 0.7050512433, blue: 0.001866223989, alpha: 1):
      logger("네이버")
    case #colorLiteral(red: 0.2593425214, green: 0.5222951174, blue: 0.9579148889, alpha: 1):
      logger("구글")
    default:
      break
    }
  }

  @objc private func emailButtonsDidTapped(_ sender: UIButton) {
    guard let buttonTitle = sender.titleLabel?.text else { return logger("button can't be unwrapped")}
    switch buttonTitle {
    case "이메일로 로그인":
      logger("이메일로 로그인")
    case "이메일로 가입":
      logger("이메일로 가입")
    default:
      break
    }
  }

  @objc private func lookButtonDidTapped(_ sender: UIButton) {
    logger("둘러보기")
  }

}
