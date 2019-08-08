//
//  ShoppingFooterView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 07/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ShoppingFooterView: UITableViewHeaderFooterView {

  // MARK: - Property
  static var identifier: String = "ShoppingFooterView"

  public lazy var selectedItemLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "?개"
    label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    contentView.addSubview(label)
    return label
  }()

  public lazy var selectedTotalPriceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "???,???원"
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    contentView.addSubview(label)
    return label
  }()

  private lazy var buyingButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("바로구매", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .highlighted)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 5
    btn.addTarget(self, action: #selector(touchUpBuyingButton(_:)), for: .touchUpInside)

    contentView.addSubview(btn)
    return btn
  }()

  // MARK: - View life cycle
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    backgroundColor = .clear
//  }
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    autolayoutViews()
    contentView.backgroundColor = .clear
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - configure
  override func layoutSubviews() {
    super.layoutSubviews()
  }

  private func autolayoutViews() {
    selectedItemLabel.snp.makeConstraints {
      $0.centerY.equalTo(buyingButton)
      $0.leading.equalToSuperview().inset(Metric.marginX)
    }

    selectedTotalPriceLabel.snp.makeConstraints {
      $0.centerY.equalTo(buyingButton)
      $0.leading.equalTo(selectedItemLabel.snp.trailing).offset(Metric.marginX/3)
    }

    buyingButton.snp.makeConstraints {
      $0.top.equalToSuperview().inset(Metric.marginY/2)
      $0.trailing.equalToSuperview().inset(Metric.marginX/2)
      $0.bottom.equalToSuperview().inset(Metric.marginY/2)
      $0.leading.equalTo(selectedTotalPriceLabel.snp.trailing).offset(Metric.marginX)
    }

  }

  @objc private func touchUpBuyingButton(_ sender: UIButton) {
    print("touchUpBuyingButton")
  }

}
