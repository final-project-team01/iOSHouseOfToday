//
//  CategoryTabBarCell.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class CategoryTabBarCell: UICollectionViewCell {

  lazy var label: UILabel = {
    let lb = UILabel()
    lb.text = "Text"
    lb.font = UIFont.boldSystemFont(ofSize: 16)
    lb.textColor = .lightGray

    addSubview(lb)
    return lb
  }()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    label.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }

}
