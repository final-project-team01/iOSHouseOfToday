//
//  CategoryTabBarViewController.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit
/// 목표
/// 카테고리의 개수를 설정하고, 그 개수에 따라 유동적으로 카테고리를 만들어야 한다.

let menuTitles = ["프로필", "나의 쇼핑"]

class CategoryTabBarViewController: UIViewController {

  let categoryView = CategoryView()
  let categoryTabBarView = CategoryTabBarView()

  lazy var testLabel: UILabel = {
    let lb = UILabel()
    lb.text = "text"
    lb.backgroundColor = .yellow
    view.addSubview(lb)
    return lb
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(categoryTabBarView)
    view.addSubview(categoryView)

    categoryTabBarView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(view.snp.height).multipliedBy(0.05)
    }

    categoryView.snp.makeConstraints {
      $0.top.equalTo(categoryTabBarView.snp.bottom)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }

    testLabel.snp.makeConstraints {
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }

}
