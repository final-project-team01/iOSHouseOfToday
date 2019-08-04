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
    label.text = "options"
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var minusButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("-", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    btn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.layer.borderWidth = 0.5
    btn.addTarget(self, action: #selector(touchUpMinusButton(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  private lazy var quantityLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1"
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 15, weight: .light)
    addSubview(label)
    return label
  }()

  private lazy var plusButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("+", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    btn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.layer.borderWidth = 0.5
    btn.addTarget(self, action: #selector(touchUpPlusButton(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  private lazy var cancelButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("×", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    btn.addTarget(self, action: #selector(touchUpDeleteButton(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "20,000원"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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

      productOptionsLabel.text = info.optionName
      priceLabel.text = "\(formetter(price: info.price * info.quantity))원"
      quantityLabel.text = "\(info.quantity)"
    }
  }

  public var indexPathRow = 0

  public var reloadPrice: (() -> Void)?

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = #colorLiteral(red: 0.925521493, green: 0.9698749185, blue: 0.9821010232, alpha: 1)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if productOptionsLabel.translatesAutoresizingMaskIntoConstraints {
      productOptionsLabel.snp.makeConstraints {
        $0.top.equalToSuperview().inset(Metric.marginY/2)
        $0.leading.equalToSuperview().inset(Metric.marginX)
      }
    }

    if minusButton.translatesAutoresizingMaskIntoConstraints {
      minusButton.snp.makeConstraints {
        $0.top.equalTo(productOptionsLabel.snp.bottom).offset(Metric.marginY/2)
        $0.leading.equalToSuperview().inset(Metric.marginX)
        $0.width.equalTo(20)
        $0.height.equalTo(22)
      }
    }

    if quantityLabel.translatesAutoresizingMaskIntoConstraints {
      quantityLabel.snp.makeConstraints {
        $0.centerY.equalTo(minusButton)
        $0.leading.equalTo(minusButton.snp.trailing).offset(5)
        $0.width.equalTo(minusButton)
      }
    }

    if plusButton.translatesAutoresizingMaskIntoConstraints {
      plusButton.snp.makeConstraints {
        $0.centerY.equalTo(quantityLabel)
        $0.leading.equalTo(quantityLabel.snp.trailing).offset(5)
        $0.width.height.equalTo(minusButton)
      }
    }

    if cancelButton.translatesAutoresizingMaskIntoConstraints {
      cancelButton.snp.makeConstraints {
        $0.top.trailing.equalToSuperview()//.inset(Metric.marginX/2)
        $0.width.height.equalTo(30)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.trailing.equalToSuperview().inset(Metric.marginX/2)
        $0.bottom.equalToSuperview().inset(Metric.marginY*0.75)
      }
    }

  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  @objc private func touchUpPlusButton(_ sender: UIButton) {
    guard let cart = shoppingCart else { return print("shoppingCartList is nil")}

    cart.quantity += 1
    reloadPrice?()
  }

  @objc private func touchUpMinusButton(_ sender: UIButton) {
    guard let cart = shoppingCart else { return print("shoppingCartList is nil")}

    if cart.quantity > 1 {
      cart.quantity -= 1
      reloadPrice?()
    }
  }

  @objc private func touchUpDeleteButton(_ sender: UIButton) {

    NotificationCenter.default.post(name: BuyingVC.deleteOption, object: nil, userInfo: ["indexPathRow": indexPathRow])
  }

}
