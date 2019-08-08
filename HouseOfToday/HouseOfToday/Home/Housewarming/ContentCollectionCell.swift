//
//  ContentCollectionCell.swift
//  HouseOfToday
//
//  Created by Sicc on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ContentTableCell: UITableViewCell {

  lazy var contentImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    //iv.image = UIImage(named: "homeTest2")
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    addSubview(iv)
    return iv
  }()

  lazy var contentLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = ""
    lb.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    lb.textColor = .darkGray
    lb.numberOfLines = 0
    addSubview(lb)
    return lb
  }()

  // MARK: - Initializer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    makeConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  private func makeConstraints() {
    contentImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(300)
    }

    contentLabel.snp.makeConstraints {
      $0.top.equalTo(contentImageView.snp.bottom).offset(20)
      $0.leading.trailing.bottom.equalToSuperview().inset(20)
    }
  }

  internal func configureCell(imageURL: String, content: String) {
    if !(imageURL == "") {
      self.contentImageView.kf.setImage(with: imageURL.getURL())
    }
    if !(content == "") {
      self.contentLabel.text = content
    }
  }
}
