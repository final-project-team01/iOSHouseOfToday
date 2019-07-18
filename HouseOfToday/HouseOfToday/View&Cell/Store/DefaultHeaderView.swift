//
//  DefaultHeaderView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class DefaultHeaderView: UICollectionReusableView {
  static var height = UIScreen.main.bounds.height / 10

  lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "Text"
    label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    addSubview(label)
    return label
  }()

  lazy var specialPriceButton: UIButton = {
    let btn = UIButton(type: .system)
    btn.setTitle("최대 81% 타임특가 >", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
    btn.addTarget(self, action: #selector(clickedSpecialPriceButton(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if titleLabel.translatesAutoresizingMaskIntoConstraints {
      titleLabel.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(15)
        $0.bottom.equalToSuperview().offset(-10)
      }
    }

    if specialPriceButton.translatesAutoresizingMaskIntoConstraints {
      specialPriceButton.snp.makeConstraints {
        $0.centerY.equalTo(titleLabel.snp.centerY)
        $0.leading.equalTo(titleLabel.snp.trailing).offset(10)
      }
    }
  }

  func hideButton(_ hide: Bool) {
    specialPriceButton.isHidden = hide
  }

   @objc private func clickedSpecialPriceButton(_ sender: UIButton) {

  }
}
