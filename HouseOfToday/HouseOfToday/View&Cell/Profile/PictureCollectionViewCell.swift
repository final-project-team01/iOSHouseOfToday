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

  private lazy var collectionCell: UILabel = {
    let label = UILabel()
    label.backgroundColor = .yellow
    label.layer.cornerRadius = 20
    label.clipsToBounds = true
    addSubview(label)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupConstraints() {
    collectionCell.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

}
