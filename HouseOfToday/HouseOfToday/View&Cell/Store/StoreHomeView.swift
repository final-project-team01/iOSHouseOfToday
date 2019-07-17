//
//  StoreHomeView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class StoreHomeView: UIView {

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private lazy var categoryButtonArray: [UIButton] = {
    var btnArray = Array<UIButton>()
    for _ in 0..<(categoryList?.count ?? 0) {
      btnArray.append(UIButton(type: .custom))
      if let last = btnArray.last {
        last.setImage(UIImage(named: "interiorQuestion"), for: .normal)
        last.setTitle("test", for: .normal)
        last.setTitleColor(.darkGray, for: .normal)
        last.layer.borderColor = UIColor.lightGray.cgColor
        last.layer.borderWidth = 0.5
        addSubview(last)
      }
    }
    return btnArray
  }()

  private lazy var swipeView: SwipeView = {
    let view = SwipeView()
    view.pageNumber = 10

    return view
  }()

  private var categoryList: [CategoryList]?

  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(swipeView)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }

  private func fetchProductCategoryList() {
    service.fetchProductCategoryList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")
        self.categoryList = list
      case .failure(let error):
        print("fetchProductCategoryList Error: \(error.localizedDescription)")
      }
    }
  }

  override func updateConstraints() {
    super.updateConstraints()
    print("updateConstraints")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews")

    swipeViewAutolayout()

    categoryListButtonsAutolayout()

  }

  private func swipeViewAutolayout() {

    if swipeView.translatesAutoresizingMaskIntoConstraints {
      swipeView.snp.makeConstraints {
        $0.top.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.2)

      }
    }
  }

  private func categoryListButtonsAutolayout() {

    for categoryButton in categoryButtonArray {
      categoryButton.snp.makeConstraints {
        $0.top.equalTo(swipeView.snp.bottom)
        $0.leading.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.33)
        $0.height.equalTo(categoryButton.snp.width)
      }
    }

    setupCategoryListButtonImageTitleEdgeInset()
  }

  private func setupCategoryListButtonImageTitleEdgeInset() {
    let spacing: CGFloat = 6.0
//    if let imageSize = categoryButton.imageView?.frame.size {
//      categoryButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
//    }
//    if let titleSize = categoryButton.titleLabel?.frame.size {
//      categoryButton.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
//    }
  }
}
