//
//  OptionHeaderView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 07/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class OptionHeaderView: UITableViewHeaderFooterView {

  // MARK: - Property
  static var identifier: String = "ShoppingFooterView"

  // MARK: - View life cycle
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
