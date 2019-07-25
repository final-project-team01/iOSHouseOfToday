//
//  MetricCell.swift
//  HouseOfToday
//
//  Created by Daisy on 25/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

enum JMetric {
  static let lineSpacing: CGFloat = 12
  static let itemSpacing: CGFloat = 12
  static let nextOffSet: CGFloat = 10
  static let numberOfLine: CGFloat = 3
  static let numberOfItem: CGFloat = 3

 static let verticalPadding = JMetric.inset.top + JMetric.inset.bottom

  static var rankkingCellSize: CGSize {

    let linspacing = JMetric.lineSpacing * (JMetric.numberOfLine - 1)
    let horizontalPadding = JMetric.inset.left + JMetric.inset.right + JMetric.nextOffSet

    let width = (UIScreen.main.bounds.width - linspacing - horizontalPadding) / JMetric.numberOfLine
    let height = width + 60

    return CGSize(width: width.rounded(.down), height: height.rounded(.down))
  }

  static var rankkingHorizontalCellSize: CGSize {

    let linspacing = JMetric.lineSpacing * (JMetric.numberOfLine - 1)
    let horizontalPadding = JMetric.rankingHorizontalInset.left + JMetric.rankingHorizontalInset.right + JMetric.nextOffSet

    let itemSpacing = JMetric.itemSpacing * (JMetric.numberOfItem - 1)
    let verticalPadding = JMetric.inset.top + JMetric.inset.bottom

    let width = (UIScreen.main.bounds.width - linspacing - horizontalPadding) / JMetric.numberOfLine
    let height = (UIScreen.main.bounds.width - linspacing - horizontalPadding) / JMetric.numberOfItem

    return CGSize(width: width.rounded(.down), height: height.rounded(.down))
  }

  static var rankingHorizontalInset: UIEdgeInsets {
    return .init(top: 3, left: 3, bottom: 3, right: 3)
  }

  static let inset: UIEdgeInsets = .init(top: 10, left: 15, bottom: 10, right: 15)

}
