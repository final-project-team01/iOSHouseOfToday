//
//  PushTableCell.swift
//  HouseOfToday
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PushTableCell: UITableViewCell {

  private lazy var switchButton: UISwitch = {
    let s = UISwitch(frame: .zero)
    s.isOn = true
    contentView.addSubview(s)
    return s
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    logger(ErrorLogs.coderInit.message)
    fatalError(ErrorLogs.coderInit.message)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }

  // MARK: - Autolayout
  private func makeConstraints() {
    switchButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(10)
    }
  }

}
