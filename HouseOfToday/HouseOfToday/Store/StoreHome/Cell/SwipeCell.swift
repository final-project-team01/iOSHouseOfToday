//
//  SwipeCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SwipeCell: UICollectionViewCell {

  static var identifier: String = "SwipeCell"

  public lazy var imageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.contentMode = .scaleAspectFit
    addSubview(iv)
    return iv
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
