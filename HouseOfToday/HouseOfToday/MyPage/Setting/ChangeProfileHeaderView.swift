//
//  ChangeProfileHeaderCell.swift
//  HouseOfToday
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ChangeProfileHeaderView: UITableViewHeaderFooterView {

  private lazy var backgroundImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.backgroundColor = .red
    addSubview(iv)
    return iv
  }()

  private lazy var profileImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.backgroundColor = .yellow
    backgroundImageView.addSubview(iv)
    return iv
  }()

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLogs.coderInit.message)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }

  private func makeConstraints() {
    backgroundImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    profileImageView.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.33)
      $0.height.equalTo(profileImageView.snp.width)
    }
  }

}
