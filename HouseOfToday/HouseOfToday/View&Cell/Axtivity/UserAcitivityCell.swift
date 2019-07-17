//
//  UserAcitivityCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class UserAcitivityCell: UITableViewCell {

  static var identifier: String = "ActivityCell"

  private lazy var iconImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)

    return imageView
  }()

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
