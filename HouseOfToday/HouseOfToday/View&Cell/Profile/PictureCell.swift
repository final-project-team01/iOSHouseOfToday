//
//  PictureCell.swift
//  HouseOfToday
//
//  Created by Daisy on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {

  private enum UI {
    static let itemsInLine: CGFloat = 3
    static let linesOnScreen: CGFloat = 4
    static let itemSpacing: CGFloat = 3.0
    static let lineSpacing: CGFloat = 3.0
    static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
  }
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    updateConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func updateConstraints() {
    super.updateConstraints()
    
    
    
    
  }
}
