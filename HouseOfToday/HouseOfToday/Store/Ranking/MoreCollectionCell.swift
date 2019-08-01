//
//  MoreCollectionCell.swift
//  HouseOfToday
//
//  Created by Daisy on 26/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class MoreCollectionCell: UICollectionViewCell {

  private lazy var moreButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "more"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.addTarget(self, action: #selector(didTapMoreButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureButton()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func didTapMoreButton(_ sender: UIButton) {
    print("moreButton Tapped")

  }

  func configureButton() {
    moreButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}
