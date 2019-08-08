//
//  OptionTableCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 06/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class OptionTableCell: UITableViewCell {

  // MARK: - Property
  static var identifier: String = "OptionTableCell"

  public lazy var optionName: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "option Name"
    label.numberOfLines = 2
    contentView.addSubview(label)
    return label
  }()

  private lazy var cancelButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("×", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
    btn.addTarget(self, action: #selector(touchUpDeleteButton(_:)), for: .touchUpInside)
    contentView.addSubview(btn)
    return btn
  }()

  public lazy var quantityButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("0", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.setImage(UIImage(named: "T##String"), for: .normal)
    btn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.layer.borderWidth = 0.5
    btn.layer.cornerRadius = 5
    btn.clipsToBounds = true
    btn.backgroundColor = .white
    contentView.addSubview(btn)
    return btn
  }()

  public lazy var priceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "??,???원"
    label.font = UIFont.systemFont(ofSize: 13)
    contentView.addSubview(label)
    return label
  }()

//  public var

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    autolayoutViews()
    contentView.backgroundColor = #colorLiteral(red: 0.9582814574, green: 0.9525845647, blue: 0.9626603723, alpha: 1)
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 5
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

//    print(<#T##items: Any...##Any#>)
  }

  // MARK: - configure
  private func autolayoutViews() {

    if optionName.translatesAutoresizingMaskIntoConstraints {
      optionName.snp.makeConstraints {
        $0.top.leading.equalToSuperview().inset(10)
        $0.trailing.equalToSuperview().inset(30)
      }
    }

    if cancelButton.translatesAutoresizingMaskIntoConstraints {
      cancelButton.snp.makeConstraints {
        $0.top.trailing.equalToSuperview()
      }
    }

    if quantityButton.translatesAutoresizingMaskIntoConstraints {
      quantityButton.snp.makeConstraints {
        $0.top.equalTo(optionName.snp.bottom).offset(Metric.marginY)
        $0.bottom.leading.equalToSuperview().inset(10)
        $0.width.equalTo(100)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.centerY.equalTo(quantityButton)
        $0.trailing.equalToSuperview().inset(10)
      }
    }
  }

  // MARK: - touchUpDeleteButton
  @objc private func touchUpDeleteButton(_ sender: UIButton) {
    print("touchUpDeleteButton")
  }
}
