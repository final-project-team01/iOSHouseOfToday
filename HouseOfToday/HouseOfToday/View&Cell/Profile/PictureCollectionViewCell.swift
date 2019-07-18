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

  //test용
  private lazy var collectionCell: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    label.layer.cornerRadius = 5
    label.clipsToBounds = true
    addSubview(label)
    return label
  }()

  // FIXME: - imageView 추가

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
