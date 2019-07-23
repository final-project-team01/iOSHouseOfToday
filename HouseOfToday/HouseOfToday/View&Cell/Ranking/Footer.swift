//
//  CollectionFooter.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class Footer: UICollectionReusableView {

  var moreCount = 0
  private lazy var moreButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("더보기 (\(moreCount))", for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    button.backgroundColor?.withAlphaComponent(0.5)
    button.setTitleColor( #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.addTarget(self, action: #selector(moreButtondidTap), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  override init(frame: CGRect) {
    super .init(frame: frame)
    self.backgroundColor = .white
    configureLabel()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func moreButtondidTap() {

  }

  private func configureLabel() {

    moreButton.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

  }

}
