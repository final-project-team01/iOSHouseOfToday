//
//  CategoryCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 22/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryListCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "CategoryListCell"

  lazy var categoryImageView: UIImageView = {
    let iv = UIImageView()
    iv.backgroundColor = .red
    addSubview(iv)
    return iv
  }()

  lazy var cateforyLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = .darkGray
    label.numberOfLines = 1
    label.textAlignment = .center
    label.text = "text"
    label.minimumScaleFactor = 5
    addSubview(label)
    return label
  }()

  override func layoutSubviews() {
    super.layoutSubviews()
    if cateforyLabel.translatesAutoresizingMaskIntoConstraints {
      cateforyLabel.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.bottom.equalToSuperview().offset(10)
      }
    }
    if categoryImageView.translatesAutoresizingMaskIntoConstraints {
      categoryImageView.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.top.equalToSuperview().offset(10)
        $0.width.equalToSuperview().multipliedBy(0.5)
        $0.height.equalToSuperview().multipliedBy(0.5)
        $0.bottom.equalTo(cateforyLabel.snp.top).offset(10)
      }
    }

  }
}
