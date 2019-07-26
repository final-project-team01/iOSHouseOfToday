//
//  UserStylingImageCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 25/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class UserStylingImageCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "UserStylingImageCell"

  lazy var thumnailImageView: UIImageView = {
    let iv = UIImageView(frame: CGRect.zero)
    iv.layer.masksToBounds = true
    iv.layer.cornerRadius = Metric.StylingShotSmallCellSize.width / 10
    addSubview(iv)
    return iv
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: CGRect.zero)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if thumnailImageView.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }

}
