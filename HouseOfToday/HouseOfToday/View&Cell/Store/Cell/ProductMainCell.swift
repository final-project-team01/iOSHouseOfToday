//
//  ProductMainCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ProductMainCell: UICollectionViewCell {

  // MARK: - Property
  private lazy var brandLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "brand"
    label.textColor = UIColor.lightGray
    label.font = UIFont.systemFont(ofSize: 10)
    addSubview(label)
    return label
  }()

  private lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Label 1asldkfjhaslkjdfhalksjdfalkjhdf"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var shareButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "share"), for: .normal)
    return btn
  }()

  private lazy var shareCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "555"
    label.font = UIFont.systemFont(ofSize: 10)
    return label
  }()

  private lazy var ratingStarLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★★★★★"
    return label
  }()

  private lazy var ratingStarScoreLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1.8k"
    return label
  }()

  private lazy var discountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "80%"
    label.textColor = #colorLiteral(red: 0.08574206382, green: 0.7608343959, blue: 0.9359433651, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var costPriceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "999,999"
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "111,111원"
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var lowestPriceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = " 최저가 "
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 3
    label.font = UIFont.systemFont(ofSize: 10)
    addSubview(label)
    return label
  }()

  private lazy var pointLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "45P"
    label.font = UIFont.systemFont(ofSize: 10)
    return label
  }()

  private lazy var pointSavingLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "적립해드립니다."
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = .darkGray
    return label
  }()

//  private lazy var 

  private lazy var deliveryFreeLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = " 무료배송 "
    label.font = UIFont.systemFont(ofSize: 10)
    label.backgroundColor = #colorLiteral(red: 0.9293405414, green: 0.929452002, blue: 0.9293025732, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 3
    addSubview(label)
    return label
  }()

  // MARK: - View life cycle

  // MARK: - configure

}
