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
  static var identifier: String = "ProductMainCell"

  static let height = SwipeImageview.height + DetailProductFirstView.height + UsersStylingShotView.height

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
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(SwipeImageview.height)
        $0.top.equalToSuperview()

        $0.bottom.equalTo(firstView.snp.top).offset(0)
      }
    }

    if firstView.translatesAutoresizingMaskIntoConstraints {
      firstView.snp.makeConstraints {
        $0.top.equalToSuperview().offset(SwipeImageview.height)
//        $0.top.equalTo(swipeImageView.snp.bottom)//offset(marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(DetailProductFirstView.height)
      }
    }

    if userStylingView.translatesAutoresizingMaskIntoConstraints {
      userStylingView.snp.makeConstraints {
        $0.top.equalTo(firstView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()

        $0.height.equalTo(UsersStylingShotView.height)//.priority(500)
      }
    }

  }

  public func updateSwipeImageViewPosition(positionY: CGFloat) {

//    guard positionY > 0 else { return print("positionY: \(positionY)")}

    if 0..<swipeImageView.frame.height ~= positionY {
      print("positionY: \(positionY)")
      swipeImageView.snp.updateConstraints {
        $0.top.equalToSuperview().offset(positionY)
        $0.bottom.equalTo(firstView.snp.top).offset(positionY)
      }

    } else {
      swipeImageView.snp.updateConstraints {
        $0.top.equalToSuperview().offset(0)
        $0.bottom.equalTo(firstView.snp.top).offset(0)
      }
    }
  }

}
