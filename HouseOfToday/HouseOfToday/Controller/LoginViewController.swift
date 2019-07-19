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
    iv.alpha = 1
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

  private lazy var buttonStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [ self.kakaoLoginButton,
                                             self.naverLoginButton,
                                             self.googleLoginButton,
                                             self.emailStackView ])
    sv.axis = .vertical
    sv.alignment = .center
    sv.spacing = 10
    view.addSubview(sv)
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
    return bt
  }()

  private lazy var naverLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("네이버로 시작하기", for: .normal)
    bt.backgroundColor = #colorLiteral(red: 0.1769869626, green: 0.7050512433, blue: 0.001866223989, alpha: 1)
    bt.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
    bt.layer.cornerRadius = 10
    return bt
  }()

  private lazy var googleLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("구글로 시작하기", for: .normal)
    bt.backgroundColor = #colorLiteral(red: 0.2593425214, green: 0.5222951174, blue: 0.9579148889, alpha: 1)
    //bt.setTitleColor(.white, for: .normal)
    bt.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
    bt.layer.cornerRadius = 10
    return bt
  }()

  private lazy var emailStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [ self.loginWithEamilButton,
                                             self.signUpWithEmailButton,
                                             self.lookButton])
    sv.axis = .horizontal
    sv.alignment = .center
    sv.spacing = 5
    sv.distribution = .fillProportionally
    view.addSubview(sv)
    return sv
  }()

  private lazy var loginWithEamilButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("이메일로 로그인", for: .normal)
    bt.setTitleColor(#colorLiteral(red: 0.334025979, green: 0.3334415555, blue: 0.3345029652, alpha: 1), for: .normal)
    return bt
  }()

  private lazy var signUpWithEmailButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("이메일로 가입", for: .normal)
    bt.setTitleColor(#colorLiteral(red: 0.334025979, green: 0.3334415555, blue: 0.3345029652, alpha: 1), for: .normal)
    return bt
  }()

  private lazy var lookButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("둘러보기", for: .normal)
    bt.setTitleColor(.lightGray, for: .normal)
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
      popTip.show(text: "  ⚡️ 3초만에 빠른 회원가입  ", direction: .up, maxWidth: 400, in: view, from: buttonStackView.frame)
      popTip.frame.origin.y -= 15

      firstCallFlag = true
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    //mainImageView.addGradientLayerInBackground(frame: view.bounds, colors: [.clear, .white])
    print(self.mainImageView.frame)
    makeConstraints()
  }

  private func makeConstraints() {

    // mainImageView
    mainImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(view)
      $0.height.equalTo(view.snp.height).multipliedBy(0.66)
    }
    // buttonStackView
    buttonStackView.snp.makeConstraints {
      $0.top.equalTo(mainImageView.snp.bottom).offset(20)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }

    buttonStackView.arrangedSubviews.forEach {
      $0.snp.makeConstraints {
        $0.width.equalToSuperview().multipliedBy(0.9)
        $0.height.equalToSuperview().multipliedBy(0.22)
      }
    }

    // gradient View
//    gradientView.snp.makeConstraints {
//      $0.bottom.equalTo(mainImageView.snp.bottom)
//      $0.leading.trailing.equalToSuperview()
//      $0.height.equalTo(mainImageView.snp.height).multipliedBy(0.2)
//    }

  }
}
