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
    label.text = "0"
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
    button.backgroundColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    button.layer.cornerRadius = button.frame.width / 5
    // FIXME: - 여기서 cornerRadius 설정인가?
    button.clipsToBounds = true
    addSubview(button)
    return button
  }()

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

  }

  override func updateConstraints() {
    super.updateConstraints()

    seperateLabel.snp.makeConstraints { make in
      make.width.equalTo(1)
      make.height.equalTo(beingOrderCount.snp.height)
    }

    let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
    titleStackView.axis = .horizontal
    titleStackView.alignment = .leading
    titleStackView.distribution = .fill
    titleStackView.spacing = 10

    let detailStackView = UIStackView(arrangedSubviews: [beingOrder, beingOrderCount, seperateLabel, pointTextLeable, pointNum])
    detailStackView.axis = .horizontal
    detailStackView.alignment = .center
    detailStackView.distribution = .equalCentering
    detailStackView.spacing = 5

    let totalStackView = UIStackView(arrangedSubviews: [titleStackView, detailStackView])
    totalStackView.axis = .vertical
    totalStackView.alignment = .leading
    detailStackView.distribution = .equalCentering
    detailStackView.spacing = 5

    addSubview(totalStackView)

//    titleStackView.snp.makeConstraints { make in
//      make.top.leading.equalToSuperview().inset(30)
//      make.trailing.equalTo(rightSideCellButton.snp.leading)
//      make.bottom.equalTo(detailStackView.snp.top)
//    }
//
//    detailStackView.snp.makeConstraints { make in
//      make.bottom.equalToSuperview()
//      make.leading.equalToSuperview().inset(30)
//      make.trailing.equalTo(rightSideCellButton.snp.leading)
//    }

    totalStackView.snp.makeConstraints { make in
      make.top.leading.bottom.equalToSuperview()
      make.trailing.equalTo(rightSideCellButton.snp.leading)
    }

    rightSideCellButton.snp.makeConstraints { make in
      make.width.equalToSuperview().multipliedBy(0.2)
      make.height.equalTo(80)
      make.top.bottom.equalToSuperview().inset(50)
      make.leading.equalTo(detailStackView.snp.trailing)
      make.trailing.equalToSuperview().inset(20)
    }

  }

}
