//
//  SettingTableCell.swift
//  HouseOfToday
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SettingTableCell: UITableViewCell {

  internal lazy var tailTextView: UITextView = {
    let tv = UITextView(frame: .zero)
    tv.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    tv.textAlignment = .right
    tv.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
    contentView.addSubview(tv)
    return tv
  }()

  internal lazy var bottomTextField: UITextField = {
    let tf = UITextField(frame: .zero)
    contentView.addSubview(tf)
    return tf
    }()

  internal var isNeedTextField: Bool = false {
    didSet {
      bottomTextField.snp.makeConstraints {
        $0.top.equalTo(textLabel!.snp.bottom).offset(5)
        $0.center.equalToSuperview()
      }
    }
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLogs.coderInit.message)
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }

  private func makeConstraints() {
    tailTextView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().inset(10)
      $0.width.equalToSuperview().multipliedBy(0.4)
      $0.height.equalToSuperview().multipliedBy(0.8)
    }
  }

}
