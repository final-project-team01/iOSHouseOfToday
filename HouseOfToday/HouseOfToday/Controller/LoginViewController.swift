//
//  LoginViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

  // MARK: - Properties
  private lazy var mainImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.backgroundColor = .lightGray
    iv.alpha = 0
    view.addSubview(iv)
    return iv
  }()

  private lazy var buttonStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [ self.kakaoLoginButton,
                                             self.naverLoginButton,
                                             self.googleLoginButton,
                                             self.lookButton ])
    sv.axis = .vertical
    sv.alignment = .center
    //sv.distribution = .fillEqually
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

  private lazy var lookButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("둘러보기", for: .normal)
    bt.setTitleColor(.lightGray, for: .normal)
    return bt
  }()

  private lazy var signUpLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "3초만에 빠른 회원가입"
    lb.backgroundColor = .red
    view.addSubview(lb)
    return lb
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    makeConstraints()
  }

  private func makeConstraints() {

    // mainImageView
    mainImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
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

    signUpLabel.snp.makeConstraints {
      $0.bottom.equalTo(mainImageView.snp.bottom)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(kakaoLoginButton).multipliedBy(0.8)
    }

  }
}
