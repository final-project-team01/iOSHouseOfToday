//
//  LoginViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  private lazy var mainImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)

    view.addSubview(iv)
    return iv
  }()

  private lazy var kakaoLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    return bt
  }()

  private lazy var naverLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    return bt
  }()

  private lazy var googleLoginButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    return bt
  }()

  private lazy var signUpLabel: UILabel = {
    let lb = UILabel(frame: .zero)

    return lb
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
