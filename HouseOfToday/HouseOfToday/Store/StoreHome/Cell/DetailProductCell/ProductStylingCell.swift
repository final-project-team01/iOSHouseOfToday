//
//  ProductStylingCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 27/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ProductStylingCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "ProductStylingCell"
  static let height = Metric.StylingShotBigCellSize.height + Metric.StylingShotSmallCellSize.height + 100

  private let userStylingView = UsersStylingShotView()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(userStylingView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if userStylingView.translatesAutoresizingMaskIntoConstraints {
      userStylingView.snp.makeConstraints {
        $0.edges.equalToSuperview()
//        $0.top.equalTo(firstView.snp.bottom).offset(Metric.marginY)

//        $0.leading.trailing.equalToSuperview()
//        $0.height.equalTo(UsersStylingShotView.height)//.priority(500)
      }
    }
  }
}
