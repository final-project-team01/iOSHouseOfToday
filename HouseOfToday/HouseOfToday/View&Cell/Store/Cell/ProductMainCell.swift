//
//  ProductMainCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ProductMainCell: UICollectionViewCell {

  // MARK: - Property

  static let height = (SwipeImageview.height + DetailProductFirstView.height) * 2 //UsersStylingShotView.h\//UIScreen.main.bounds.width * 2

  private let swipeImageView = SwipeImageview()

  private let firstView = DetailProductFirstView()

  private let userStylingView = UsersStylingShotView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

    addSubview(swipeImageView)
    addSubview(firstView)
    addSubview(userStylingView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    autolayoutViews()

//    print("userStylingView:", userStylingView.frame.height)
  }

  // MARK: - configure
  private func autolayoutViews() {
//    let marginX = 15
//    let marginY = 15

    if swipeImageView.translatesAutoresizingMaskIntoConstraints {
      swipeImageView.snp.makeConstraints {
        $0.top.leading.trailing.equalToSuperview()
        $0.height.equalTo(SwipeImageview.height)
      }
    }

    if firstView.translatesAutoresizingMaskIntoConstraints {
      firstView.snp.makeConstraints {
        $0.top.equalTo(swipeImageView.snp.bottom)//.offset(marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(DetailProductFirstView.height)
      }
    }

    if userStylingView.translatesAutoresizingMaskIntoConstraints {
      userStylingView.snp.makeConstraints {
        $0.top.equalTo(firstView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()

        $0.height.equalTo(UIScreen.main.bounds.height)
      }
    }

  }

}
