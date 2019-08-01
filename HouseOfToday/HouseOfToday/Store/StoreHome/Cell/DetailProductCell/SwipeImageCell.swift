//
//  CollectionViewCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 26/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SwipeImageCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "SwipeImageCell"

  public lazy var imageView: UIImageView = {
    let iv = UIImageView(frame: CGRect.zero)
    iv.contentMode = .scaleAspectFit
    addSubview(iv)
    return iv
  }()

  // MARK: - View life cycle

  override func layoutSubviews() {
    super.layoutSubviews()

    if imageView.translatesAutoresizingMaskIntoConstraints {
      imageView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }
}
