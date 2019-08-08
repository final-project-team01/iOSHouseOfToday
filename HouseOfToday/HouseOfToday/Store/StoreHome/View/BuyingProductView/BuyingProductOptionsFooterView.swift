//
//  BuyingProductOptionsFooterView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class BuyingProductOptionsFooterView: UICollectionReusableView {

  // MARK: - Property
  static var identifier: String = "BuyingProductOptionsFooterView"

  private lazy var priceMarkLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "금액"
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  public lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "price"
    label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    addSubview(label)
    return label
  }()

  private lazy var wonMarkLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "원"
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

//  weak var shoppingCartList: ShoppingList? {
//    didSet {
//      guard let info = shoppingCartList else { return print("shoppingCartList is nil")}
//
//    }
//  }
  weak var shoppingCart: ShoppingCart? {
    didSet {
      guard let info = shoppingCart else { return print("shoppingCartList is nil")}

    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - View life cycle
  override func layoutSubviews() {
    super.layoutSubviews()
    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {

    if priceMarkLabel.translatesAutoresizingMaskIntoConstraints {
      priceMarkLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalToSuperview().inset(Metric.marginX)
      }
    }

    if wonMarkLabel.translatesAutoresizingMaskIntoConstraints {
      wonMarkLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.trailing.equalToSuperview().inset(Metric.marginX/2)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.trailing.equalTo(wonMarkLabel.snp.leading)
      }
    }
  }

}
