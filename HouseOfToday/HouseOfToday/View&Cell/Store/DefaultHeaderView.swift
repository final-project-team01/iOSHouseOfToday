//
//  DefaultHeaderView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class DefaultHeaderView: UICollectionReusableView {
  static var height = UIScreen.main.bounds.height / 10

  lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "Text"
    label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    addSubview(label)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if titleLabel.translatesAutoresizingMaskIntoConstraints {
      titleLabel.snp.makeConstraints {
        $0.edges.equalToSuperview().offset(15)
      }
    }
  }
}
