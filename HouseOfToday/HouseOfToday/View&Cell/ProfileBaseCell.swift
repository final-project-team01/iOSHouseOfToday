//
//  ProfileBaseCell.swift
//  HouseOfToday
//
//  Created by Daisy on 11/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class ProfileBaseCell: UITableViewCell {

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "나의 쇼핑"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  lazy var subTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "첫사진을 올리면 +1000P"
    label.backgroundColor = #colorLiteral(red: 0.9656298757, green: 0.5998463631, blue: 0.5986141562, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 18)
    addSubview(label)
    return label
  }()

  lazy var beingOrder: UILabel = {
    let label = UILabel()
    label.text = "진행중 주문"
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  lazy var beingOrderCount: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  lazy var seperateLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .lightGray
    addSubview(label)
    return label
  }()

  lazy var pointTextLeable: UILabel = {
    let label = UILabel()
    label.text = "포인트"
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  lazy var pointNum: UILabel = {
    let label = UILabel()
    label.text = "0P"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  lazy var rightSideCellButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "바로가기"), for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.setTitle("바로가기", for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)

    addSubview(button)
    return button
  }()

  var detailStackView: UIStackView!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    updateConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    subTitleLabel.layer.cornerRadius = subTitleLabel.frame.height / 2
    subTitleLabel.clipsToBounds = true

    rightSideCellButton.layer.cornerRadius = rightSideCellButton.frame.height / 10
    rightSideCellButton.clipsToBounds = true

    seperateLabel.snp.makeConstraints { make in
      make.width.equalTo(2)
      make.height.equalTo(beingOrderCount.snp.height)
    }

    print("detailStackView: \(detailStackView.frame)")
  }

  override func updateConstraints() {
    super.updateConstraints()

    let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
    titleStackView.axis = .horizontal
    titleStackView.alignment = .center
    titleStackView.distribution = .fill
    titleStackView.spacing = 10

    addSubview(titleStackView)

    detailStackView = UIStackView(arrangedSubviews: [beingOrder, beingOrderCount, seperateLabel, pointTextLeable, pointNum])
    detailStackView.axis = .horizontal
    detailStackView.alignment = .fill
    detailStackView.distribution = .equalSpacing
    detailStackView.spacing = 5

    addSubview(detailStackView)

    titleStackView.snp.makeConstraints { make in
      make.centerY.equalTo(rightSideCellButton.snp.centerY).offset(-10)
      make.leading.equalToSuperview().inset(20)

    }

    detailStackView.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(20)
      make.top.equalTo(titleStackView.snp.bottom).offset(10)

    }

    rightSideCellButton.snp.makeConstraints { make in
      make.width.equalToSuperview().multipliedBy(0.2)
      make.top.bottom.equalToSuperview().inset(40)
//      make.leading.equalTo(detailStackView.snp.trailing).offset(20)
      make.trailing.equalToSuperview().inset(20)
    }

  }

}
