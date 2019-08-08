//
//  ShoppingHeaderView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 07/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ShoppingHeaderView: UITableViewHeaderFooterView {

  // MARK: - Property
  static var identifier: String = "ShoppingHeaderView"

  public lazy var allItemButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "selected"), for: .selected)
    btn.setImage(UIImage(named: "unselected"), for: .normal)
    btn.isSelected = true
    btn.addTarget(self, action: #selector(touchUpAllItemButton(_:)), for: .touchUpInside)
    contentView.addSubview(btn)
    return btn
  }()

  public lazy var allItemLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "모두선택 (?개)"
    contentView.addSubview(label)
    return label
  }()

  private lazy var selectedItemDeleteButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("선택삭제", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.addTarget(self, action: #selector(touchUpSelectedItemDelete(_:)), for: .touchUpInside)
    contentView.addSubview(btn)
    return btn
  }()

  public var selectAll: ((Bool) -> String)?
  public var deleteAll: (() -> Void)?

  // MARK: - View life cycle
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)

    contentView.backgroundColor = .clear
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - configure
  override func layoutSubviews() {
    super.layoutSubviews()

    if allItemButton.translatesAutoresizingMaskIntoConstraints {
      allItemButton.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalToSuperview().inset(Metric.marginX)
        $0.width.height.equalTo(30)
      }
    }

    if allItemLabel.translatesAutoresizingMaskIntoConstraints {
      allItemLabel.snp.makeConstraints {
        $0.top.equalTo(allItemButton).offset(Metric.marginY/3)
        $0.leading.equalTo(allItemButton.snp.trailing).offset(Metric.marginX/2)
      }
    }

    if selectedItemDeleteButton.translatesAutoresizingMaskIntoConstraints {
      selectedItemDeleteButton.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.trailing.equalToSuperview().inset(Metric.marginX)
      }
    }
  }

  // MARK: - allItemButton TouchUp
  @objc private func touchUpAllItemButton(_ sender: UIButton) {
    print("touchUpAllItemButton")
    allItemButton.isSelected.toggle()

    allItemLabel.text = selectAll?(allItemButton.isSelected)
  }

  @objc private func touchUpSelectedItemDelete(_ sender: UIButton) {
    print("touchUpSelectedItemDelete")

    deleteAll?()
  }

}
