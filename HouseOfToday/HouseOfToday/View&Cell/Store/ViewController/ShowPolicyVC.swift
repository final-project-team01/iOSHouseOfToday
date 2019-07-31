//
//  ShowPolicyVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ShowPolicyVC: UIViewController {

  // MARK: - Property
  private lazy var policyImageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "showPolicy"))

    view.addSubview(iv)
    return iv
  }()

  private lazy var confirmButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.backgroundColor = UIColor(red: 0, green: 0, blue: 50, alpha: 0.5)
    btn.addTarget(self.self, action: #selector(touchConfirm(_:)), for: .touchUpInside)
    view.addSubview(btn)
    return btn
  }()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {
    policyImageView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide).inset(Metric.marginX * 2)
    }

    confirmButton.snp.makeConstraints {
      $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-Metric.marginY*2)
      $0.leading.equalTo(view.safeAreaLayoutGuide).offset(Metric.marginX*2)
      $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-Metric.marginX*2)
      $0.height.equalTo(50)
    }
  }

  @objc private func touchConfirm(_ sender: UIButton) {

    presentingViewController?.dismiss(animated: false, completion: nil)
  }

}
