//
//  OptionHeaderCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 03/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class OptionHeaderCell: UITableViewCell {

  // MARK: - Property
  private lazy var productNameLabel: UILabel = {
    let label = UILabel()
    label.text = "상품명"
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.text = "가격"
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  // MARK: - View life cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {
    if productNameLabel.translatesAutoresizingMaskIntoConstraints {
      productNameLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalToSuperview().inset(Metric.marginX/2)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.trailing.equalToSuperview().inset(Metric.marginX/2)
      }
    }
  }

}
