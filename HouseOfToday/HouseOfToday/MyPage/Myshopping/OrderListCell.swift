//
//  OrderListCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class OrderListCell: UITableViewCell {

  // MARK: - Property

  public lazy var thumnailImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.contentMode = .scaleAspectFit
    contentView.addSubview(iv)
    return iv
  }()

  public lazy var productTitle: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "brand"
    contentView.addSubview(label)
    return label
  }()

  public lazy var optionLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "option"
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    contentView.addSubview(label)
    return label
  }()

  public lazy var priceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "price"
    contentView.addSubview(label)
    return label
  }()

  public lazy var quantityLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "quantity"
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    contentView.addSubview(label)
    return label
  }()

  private lazy var orderCompleteLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "주문완료 | 무료배송"
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    contentView.addSubview(label)
    return label
  }()

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = .white
    autolayoutViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - configure
  private func autolayoutViews() {

    thumnailImageView.snp.makeConstraints {
      $0.top.equalTo(contentView)
      $0.leading.equalTo(contentView)
      $0.width.height.equalTo(70)
    }

    productTitle.snp.makeConstraints {
      $0.top.equalTo(thumnailImageView)
      $0.leading.equalTo(thumnailImageView.snp.trailing).offset(Metric.marginX/2)
    }

    optionLabel.snp.makeConstraints {
      $0.top.equalTo(productTitle.snp.bottom).offset(Metric.marginY/2)
      $0.leading.equalTo(productTitle)
    }

    priceLabel.snp.makeConstraints {
      $0.top.equalTo(optionLabel.snp.bottom).offset(Metric.marginY/2)
      $0.leading.equalTo(productTitle)
    }

    quantityLabel.snp.makeConstraints {
      $0.top.equalTo(priceLabel)
      $0.leading.equalTo(priceLabel.snp.trailing).offset(Metric.marginX/2)
    }

    orderCompleteLabel.snp.makeConstraints {
      $0.top.equalTo(priceLabel.snp.bottom).offset(Metric.marginY/2)
      $0.leading.equalTo(priceLabel)
    }

  }

}
