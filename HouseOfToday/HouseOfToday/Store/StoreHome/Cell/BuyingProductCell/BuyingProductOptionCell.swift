//
//  BuyingProductOptionCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class BuyingProductOptionCell: UICollectionViewCell {
  
  // MARK: - Property
  static var identifier: String = "BuyingProductOptionCell"

  private lazy var productOptionsLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    return label
  }()
  
  private lazy var minusButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("-", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    btn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.layer.borderWidth = 1
    return btn
  }()
  
  private lazy var quantityLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1"
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15, weight: .light)
    return label
  }()
  
  private lazy var plusButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("+", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    btn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.layer.borderWidth = 1
    return btn
  }()
  
  private lazy var cancelButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("×", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    return btn
  }()
  
  private lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "20,000원"
    return label
  }()
  

}
