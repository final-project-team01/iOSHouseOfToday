//
//  CategoryListView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryListView: UIView {

  let service: HouseOfTodayServiceType = HouseOfTodayService()

  private var categoryList: [CategoryList] = [] {
    didSet {
      print("categoryList didSet")
      categoryButtonArray = self.makeCategoryButton(category: categoryList)
    }
  }

  private var categoryButtonArray: [UIButton]?

  override init(frame: CGRect) {
    super.init(frame: frame)
//    backgroundColor = .bluex
    fetchProductCategoryList()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    categoryListButtonsAutolayout()

//    categoryButtonArray.first?.frame.width
    print("width: \(categoryButtonArray?.first?.frame.width)")
  }

  override func updateConstraints() {
    super.updateConstraints()

    print("width: \(categoryButtonArray?.first?.frame.width)")
  }

  private func categoryListButtonsAutolayout() {
    print("start Autolayout: \(categoryButtonArray?.count)")
    if let categoryButtonArray = categoryButtonArray {
      print("start Autolayout iner")

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
      }
    }

    setupCategoryListButtonImageTitleEdgeInset()
  }

  private func setupCategoryListButtonImageTitleEdgeInset() {

    if let categoryButtonArray = categoryButtonArray {
      let width = UIScreen.main.bounds.width / 4.0
      for categoryButton in categoryButtonArray {
        if let imageSize = categoryButton.imageView?.frame.size {
          categoryButton.imageEdgeInsets = UIEdgeInsets(top: width / 10, left: width / 5, bottom: width / 5 + width / 10, right: width / 5)
          categoryButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -(width/5 + 50), right: 0)
//          categoryButton.bringSubviewToFront(categoryButton)
        }
      }
    }
  }

  private func makeCategoryButton(category list: [CategoryList]) -> [UIButton] {
    var btnArray = Array<UIButton>()

    for categoryList in list {
      btnArray.append(UIButton(type: .custom))
      if let last = btnArray.last {

        DispatchQueue.global().async {
          do {
            if let url = URL(string: categoryList.imageURL) {
              let data = try Data(contentsOf: url)
              DispatchQueue.main.async {
                last.setImage(UIImage(data: data), for: .normal)

              }
            }
          } catch {
            print("makeCategoryButton id: \(categoryList.id), Error: \(error.localizedDescription)")
          }
        }

        last.setTitle(categoryList.name, for: .normal)
        last.setTitleColor(.darkGray, for: .normal)
        last.layer.borderColor = UIColor.lightGray.cgColor
        last.layer.borderWidth = 0.5
        addSubview(last)
      }
    }

    print("makeCategoryButton end, Button Count: \(btnArray.count)")
    return btnArray
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
}
