//
//  DeliveryPolicyVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class DeliveryPolicyVC: UIViewController {

  // MARK: - Property

  private lazy var scrollView: UIScrollView = {
    let scroll = UIScrollView(frame: CGRect.zero)
    scroll.contentSize.width = UIScreen.main.bounds.width
    scroll.alwaysBounceHorizontal = false
    scroll.alwaysBounceVertical = true
//    scroll.contentSize.width = UIScreen.main.bounds.width
//    scroll.contentSize.height = UIScreen.main.bounds.height * 2
//    scroll.delegate = self
    view.addSubview(scroll)
    return scroll
  }()

  private lazy var policyImageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "deliveryPolicy"))
//    iv.contentMode = .scaleAspectFit

//    scrollView.addSubview(iv)
    return iv
  }()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    policyImageViewAutolayout()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

  }

  // MARK: - configure
  private func policyImageViewAutolayout() {
    scrollView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }

    let scale = UIScreen.main.bounds.width / (policyImageView.image?.size.width ?? 1)

    print(policyImageView.image?.size)

    policyImageView.snp.makeConstraints {
      $0.leading.trailing.equalTo(view)
      $0.top.bottom.equalTo(scrollView)
      $0.width.equalTo(UIScreen.main.bounds.width)
//      $0.height.equalTo((policyImageView.image?.size.width ?? 1)*scale)
    }
  }

}
