//
//  PicCollectionViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 22/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class PicCollectionViewCell: UICollectionViewCell {

  lazy var photoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = .lightGray
    imageView.clipsToBounds = true
    addSubview(imageView)
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if translatesAutoresizingMaskIntoConstraints == true {
    photoImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      }
    }
  }

}
