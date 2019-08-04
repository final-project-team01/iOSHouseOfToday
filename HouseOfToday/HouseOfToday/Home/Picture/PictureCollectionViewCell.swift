//
//  PictureCollectionViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 04/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {

  lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
//    imageView.image = UIImage(named: "user")
    imageView.backgroundColor = .yellow
    imageView.layer.cornerRadius = imageView.frame.width/2
    imageView.layer.masksToBounds = true
    addSubview(imageView)
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    cellAutolayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - configure
  private func cellAutolayout() {

    thumnailImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
