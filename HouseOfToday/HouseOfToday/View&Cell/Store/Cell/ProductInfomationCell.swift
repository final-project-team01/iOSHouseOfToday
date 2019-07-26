//
//  ProductInfomationCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 26/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ProductInfomationCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "ProductInfomationCell"

  lazy var cellTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "상품정보"
    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    return label
  }()

  lazy var imageViews: [UIImageView] = {
    let iv = UIImageView(frame: CGRect.zero)
    iv.backgroundColor = .red
    return [iv]
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {

    if cellTitleLabel.translatesAutoresizingMaskIntoConstraints {
      cellTitleLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if let firstImageView = imageViews.first,
      firstImageView.translatesAutoresizingMaskIntoConstraints {
      firstImageView.snp.makeConstraints {
        $0.top.equalTo(cellTitleLabel).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
      }
    }
  }

  private func imageViewsAutolayout() {

    for index in 1..<imageViews.count {

      imageViews[index].snp.makeConstraints {
        $0.top.equalTo(imageViews[index-1].snp.bottom)
        $0.leading.trailing.equalToSuperview()

        // FIXME: - image 높이를 넣어야함 비율 계산
      }

    }

  }
}
