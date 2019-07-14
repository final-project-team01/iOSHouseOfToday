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
    label.font = UIFont.boldSystemFont(ofSize: 18)
    addSubview(label)
    return label
  }()

  lazy var subTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "첫사진을 올리면 +1000p"
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
    button.setTitleColor(.white, for: .normal)
    button.setTitle("바로가기", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
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

    subTitleLabel.layer.cornerRadius = subTitleLabel.frame.height / 3
    subTitleLabel.clipsToBounds = true

    rightSideCellButton.layer.cornerRadius = rightSideCellButton.frame.height / 10
    rightSideCellButton.clipsToBounds = true

    seperateLabel.snp.makeConstraints { make in
      make.width.equalTo(2)
      make.height.equalTo(beingOrderCount.snp.height)
    }
  }

  override func updateConstraints() {
    super.updateConstraints()

    let padding: CGFloat = 10

    let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
    titleStackView.axis = .horizontal
    titleStackView.alignment = .leading
    titleStackView.distribution = .equalCentering
    titleStackView.spacing = padding

    addSubview(titleStackView)

    detailStackView = UIStackView(arrangedSubviews: [beingOrder, beingOrderCount, seperateLabel, pointTextLeable, pointNum])
    detailStackView.axis = .horizontal
    detailStackView.alignment = .fill
    detailStackView.distribution = .equalSpacing
    detailStackView.spacing = padding

    addSubview(detailStackView)

    titleStackView.snp.makeConstraints { make in
      make.centerY.equalTo(rightSideCellButton.snp.centerY).offset(-padding)
      make.leading.equalToSuperview().inset(padding * 2)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading).offset(-padding)
    }

    detailStackView.snp.makeConstraints { make in
      make.top.equalTo(rightSideCellButton.snp.centerY).offset(padding)
      make.leading.equalToSuperview().inset(padding * 2)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading).offset(-padding)
    }

    rightSideCellButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.17)
      make.height.equalToSuperview().multipliedBy(0.33)
      make.trailing.equalToSuperview().inset(padding * 2)
    }

  }

}
