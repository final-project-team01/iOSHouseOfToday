//
//  PictureCollectionViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class PictureCollectionViewCell: UICollectionViewCell {

  lazy var imageCell: UIImageView = {
    let imageCell = UIImageView()
    imageCell.layer.cornerRadius = 5
    imageCell.backgroundColor = .lightGray
    // FIXME: - .white로 변경해주기
    imageCell.clipsToBounds = true
    addSubview(imageCell)
    return imageCell
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if translatesAutoresizingMaskIntoConstraints {
      imageCell.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
}
