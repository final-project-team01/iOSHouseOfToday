//
//  CategoryBestCell.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryBestCell: UICollectionViewCell {
  
  var countLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10)
    label.text = "1"
    label.backgroundColor = .white
// FIXME: - label.layer.cornerRadius = 5
//    label.clipsToBounds = true
    return label
  }()
  
  override init(frame: CGRect) {
    super .init(frame: frame)
    configureItems()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
 private func configureItems() {
  
  
  }
  
  
}
