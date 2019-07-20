//
//  CategoryListView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class CategoryListView: UIView {

  // MARK: - Property
  static var height = (UIScreen.main.bounds.width / 4) * 3

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  let buttonCount = 10

  private var categoryList: [CategoryList] = [] {
    didSet {
      print("categoryList didSet")

      DispatchQueue.main.async {
        self.getCategoryInfo(category: self.categoryList)
      }
    }
  }

  private lazy var categoryButtonArray: [UIButton] = {
    var btnArray = Array<UIButton>()

    for index in 0..<buttonCount {
      btnArray.append(UIButton())
      if let last = btnArray.last {
        last.setTitleColor(.darkGray, for: .normal)
        last.layer.borderColor = UIColor.lightGray.cgColor
        last.layer.borderWidth = 0.3
        last.imageView?.backgroundColor = .blue
        addSubview(last)
      }
    }
    print("btnArray.count", btnArray.count)
    return btnArray
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    print("init: CategoryListView")
    fetchCategoryList()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    categoryListButtonsAutolayout()
  }

  override func updateConstraints() {
    super.updateConstraints()
  }

  // MARK: - configure
  private func categoryListButtonsAutolayout() {
    //if let categoryButtonArray = categoryButtonArray {
      print("start Autolayout iner")
      logger()

      let divide = 4.0
      for index in 0..<categoryButtonArray.count {

        if categoryButtonArray[index].translatesAutoresizingMaskIntoConstraints {
          categoryButtonArray[index].snp.makeConstraints {
            let snp = index < Int(divide) ? self.snp.top : categoryButtonArray[index - Int(divide)].snp.bottom

            $0.top.equalTo(snp)
            $0.width.equalToSuperview().multipliedBy(1.0 / divide)
            $0.height.equalTo(categoryButtonArray[index].snp.width)

            if index % Int(divide) == 0 {
              $0.leading.equalToSuperview()
            } else if index % Int(divide) == 1 {
              $0.leading.equalTo(categoryButtonArray[index - 1].snp.trailing)
            } else if index % Int(divide) == 2 {
              $0.leading.equalTo(categoryButtonArray[index - 1].snp.trailing)
            } else if  index % Int(divide) == 3 {
              $0.leading.equalTo(categoryButtonArray[index - 1].snp.trailing)
              $0.trailing.equalToSuperview()
            }
          }
        }
    //  }
    }

  }

  private func getCategoryInfo(category list: [CategoryList]) {

    for index in 0..<categoryButtonArray.count {
      DispatchQueue.global().async { [weak self] in
        do {
          if let url = URL(string: list[index].imageURL) {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
              guard let `self` = self else { return logger()}
//              self.categoryButtonArray[index].setImage(UIImage(data: data), for: .normal)
              self.categoryButtonArray[index].setBackgroundImage(UIImage(data: data), for: .normal)

//              categoryButtonArray[index].imageEdgeInsets
            }
          }
        } catch {
          print("makeCategoryButton id: \(list[index].id), Error: \(error.localizedDescription)")
        }
      }

      categoryButtonArray[index].setTitle(list[index].name, for: .normal)
//      categoryButtonArray[index]

      let width = UIScreen.main.bounds.width / 4.0
      categoryButtonArray[index].imageEdgeInsets = UIEdgeInsets(top: width / 10, left: width / 5, bottom: width / 5 + width / 10, right: width / 5)
//      categoryButtonArray[index].imageView?.backgroundColor = .blue
      categoryButtonArray[index].titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -60, right: 0)
    }
  }

  // MARK: - Fetch Category List
  private func fetchCategoryList() {
    print("fetchCategoryList Start")
    service.fetchCategoryList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")

        self.categoryList = list
      case .failure(let error):

        print("fetchCategoryList Error: \(error.localizedDescription)")
      }
    }
  }
}
