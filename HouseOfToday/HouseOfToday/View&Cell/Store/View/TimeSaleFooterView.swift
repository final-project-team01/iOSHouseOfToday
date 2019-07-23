//
//  TimeSaleFooterView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 19/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class TimeSaleFooterView: UICollectionReusableView {

  // MARK: - Property
  static var height = UIScreen.main.bounds.height / 10

  lazy var timeSaleButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("최대 78% 타임특가 보기 ❭", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    button.layer.cornerRadius = 10
    addSubview(button)
    return button
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: CGRect.zero)
//    backgroundColor = .black
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    timeSaleButtonConfigure()
  }

  // MARK: - configure
  private func timeSaleButtonConfigure() {
    if timeSaleButton.translatesAutoresizingMaskIntoConstraints {
      timeSaleButton.snp.makeConstraints {
        $0.top.bottom.equalToSuperview()
        $0.leading.equalToSuperview().offset(15)
        $0.trailing.equalToSuperview().offset(-15)
      }
    }
  }

}
