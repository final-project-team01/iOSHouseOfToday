//
//  Exhibition2.jpg Exhibition4.jpg Exhibition3.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ExhibitionCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "ExhibitionCell"

  public lazy var imageView: UIImageView = {
    let iv = UIImageView(frame: CGRect.zero)

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
