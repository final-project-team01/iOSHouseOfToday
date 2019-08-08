//
//  ChangeProfileHeaderCell.swift
//  HouseOfToday
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ChangeProfileHeaderView: UITableViewHeaderFooterView {

  internal lazy var backgroundImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.image = UIImage(named: "homeTest2")
    iv.backgroundColor = .red
    addSubview(iv)
    return iv
  }()

  internal lazy var profileImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.backgroundColor = .yellow
    backgroundImageView.addSubview(iv)
    iv.clipsToBounds = true
    return iv
  }()

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    makeConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError(ErrorLogs.coderInit.message)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
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
