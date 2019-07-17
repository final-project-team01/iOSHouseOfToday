//
//  StoreHomeHeaderView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class StoreHomeHeaderView: UIView {

  private lazy var swipeView: SwipeView = {
    let view = SwipeView()
    view.pageNumber = 10
    print("swipeView")
    return view
  }()

  private lazy var categoryListView: CategoryListView = {
    let view = CategoryListView()
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(swipeView)
    addSubview(categoryListView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews")

    swipeViewAutolayout()

    categoryListViewAutolayout()
  }

  private func swipeViewAutolayout() {

    if swipeView.translatesAutoresizingMaskIntoConstraints {
      swipeView.snp.makeConstraints {
        $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.2)
      }
    }
  }

  private func categoryListViewAutolayout() {

    if categoryListView.translatesAutoresizingMaskIntoConstraints {
      categoryListView.snp.makeConstraints {
        $0.top.equalTo(swipeView.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(categoryListView.snp.width)
      }
    }
  }
}