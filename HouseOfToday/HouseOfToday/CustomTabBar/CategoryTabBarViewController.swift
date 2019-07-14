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

class CategoryTabBarViewController: UIViewController {

  // MARK: - CategoryTabBarViewController 를 초기화할때 설정 값들 (초기화 한 후로는 변경하지 못하게 private )
  /// 카테고리를 설정할 때 얘를 설정한다.
  private var categoryTitles: [String]!

  /// 카테고리가 일정 수 넘어가면 true 로 설정해서 카테고리를 움직일 수 있게 한다.
  private var categoryTabBarScrollIsEnabled: Bool!

  private var categoryViews: [UIView]!

  init(_ categoryTitles: [String], _ categoryViews: [UIView], withScrollOption tabBarScrollIsEnabled: Bool ) {
    super.init(nibName: nil, bundle: nil)
    self.categoryTitles = categoryTitles
    self.categoryViews = categoryViews
    self.categoryTabBarScrollIsEnabled = tabBarScrollIsEnabled
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  // MARK: - 변수선언
  private lazy var categoryTabBarView: CategoryTabBarView = {
    let ctv = CategoryTabBarView()
    ctv.isScrollEnabled = self.categoryTabBarScrollIsEnabled
    ctv.categoryTitles = categoryTitles
    view.addSubview(ctv)
    return ctv
  }()

  private lazy var indicatorBarView: IndicatorBarView = {
    let v = IndicatorBarView()
    view.addSubview(v)
    v.categoryTitles = categoryTitles
    return v
  }()

  private lazy var categoryView: CategoryView = {
    let cv = CategoryView()
    cv.categoryViews = self.categoryViews
    view.addSubview(cv)
    return cv
  }()

  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    makeConstraints()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

  }

  // 시점문제를 해결해서 값을 한번만 할당하려는 flag
  private var firstCallFlagForAssignment = true
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if firstCallFlagForAssignment {
      //indicatorBarView.frameWidth = self.indicatorBarView.frame.width
//      indicatorBarView.setNeedsUpdateConstraints()
//      indicatorBarView.setNeedsLayout()
      firstCallFlagForAssignment.toggle()
    }
  }

  private func makeConstraints() {
    categoryTabBarView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(view.snp.height).multipliedBy(0.045)
    }

    indicatorBarView.snp.makeConstraints {
      $0.top.equalTo(categoryTabBarView.snp.bottom)
      $0.leading.equalToSuperview()
      //$0.width.equalTo(40)
      $0.height.equalTo(categoryTabBarView.snp.height).multipliedBy(0.1)
    }

    categoryView.snp.makeConstraints {
      $0.top.equalTo(indicatorBarView.snp.bottom)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }

}
