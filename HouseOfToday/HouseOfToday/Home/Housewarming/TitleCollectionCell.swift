//
//  TitleCollectionCell.swift
//  HouseOfToday
//
//  Created by Sicc on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class TitleTableCell: UITableViewCell {

  let mini = UIFont.systemFont(ofSize: 14, weight: .regular)

  private lazy var categoryLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "온라인 집들이"
    lb.font = mini
    lb.textColor = .darkGray
    addSubview(lb)
    return lb
  }()

  private lazy var titleLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "타이틀!"
    lb.font = UIFont.systemFont(ofSize: 23, weight: .bold)
    addSubview(lb)
    return lb
  }()

  private lazy var authorLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "by Sofie15"
    lb.font = mini
    addSubview(lb)
    return lb
  }()

  private lazy var createdLabel: UILabel = {
    let lb = UILabel(frame: .zero)
    lb.text = "2019년 08월 08일"
    lb.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    lb.textColor = #colorLiteral(red: 0.8109878898, green: 0.8095566034, blue: 0.8121477962, alpha: 1)
    addSubview(lb)
    return lb
  }()

//  private lazy var detailView: UIView = {
//    let v = UIView(frame: .zero)
//    v.backgroundColor = .clear
//    v.layer.borderWidth = 1
//    v.layer.borderColor = #colorLiteral(red: 0.8109878898, green: 0.8095566034, blue: 0.8121477962, alpha: 1)
//    addSubview(v)
//    return v
//  }()

  // MARK: - Initializer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    makeConstrains()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  let leftPadding = 10
  private func makeConstrains() {
    categoryLabel.snp.makeConstraints {
      $0.top.equalTo(20)
      $0.leading.equalTo(leftPadding)
    }
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(categoryLabel.snp.bottom).offset(10)
      $0.leading.equalTo(leftPadding)
    }
    authorLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(30)
      $0.leading.equalTo(leftPadding)
    }
    createdLabel.snp.makeConstraints {
      $0.leading.equalTo(authorLabel.snp.trailing).offset(15)
      $0.centerY.equalTo(authorLabel)
      $0.bottom.equalToSuperview().inset(30)
    }

//    detailView.snp.makeConstraints {
//      $0.leading.trailing.equalTo(self).inset(leftPadding)
//      $0.top.equalTo(authorLabel.snp.bottom).offset(20)
//      $0.height.equalTo(200)
//      $0.bottom.equalToSuperview().inset(30)
//    }
  }

  internal func configureCell(title: String, author: String, created: String) {
    self.titleLabel.text = title
    self.authorLabel.text = author
    self.createdLabel.text = created
  }

}
