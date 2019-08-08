//
//  optionCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 03/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class OptionCell: UITableViewCell {

  // MARK: - Property
  public lazy var productNameLabel: UILabel = {
    let label = UILabel()
    label.text = "product"
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  public lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.text = "10,000원"
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
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
