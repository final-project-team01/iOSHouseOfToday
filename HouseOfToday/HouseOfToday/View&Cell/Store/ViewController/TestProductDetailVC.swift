//
//  TestProductDetailVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class TestProductDetailVC: UIViewController {

  // MARK: - Property
  private lazy var scrollView: UIScrollView = {
    let sv = UIScrollView(frame: CGRect.zero)
    sv.backgroundColor = .white
    view.addSubview(sv)
    return sv
  }()

  private lazy var contentView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = .lightGray
    scrollView.addSubview(view)
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
      $0.leading.trailing.bottom.equalToSuperview()
    }

  }

}
