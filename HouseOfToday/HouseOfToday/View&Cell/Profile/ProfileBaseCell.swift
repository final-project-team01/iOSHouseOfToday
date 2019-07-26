//
//  ProfileBaseCell.swift
//  HouseOfToday
//
//  Created by Daisy on 11/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit
import SnapKit

final class ProfileBaseCell: UITableViewCell {

  enum TitleName: String {

    case myShoping        = "나의 쇼핑"
    case picture          = "사진"
    case houseWarming     = "집들이"
    case reviewWriting    = "리뷰쓰기"
    case review           = "리뷰"
  }

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "나의 쇼핑"
    label.font = UIFont.boldSystemFont(ofSize: 18)
    addSubview(label)
    return label
  }()

  private lazy var subTitleLabel: UILabel = {
    let label = UILabel()
    label.text = " 첫사진을 올리면 +1000p "
    label.backgroundColor = #colorLiteral(red: 0.9656298757, green: 0.5998463631, blue: 0.5986141562, alpha: 1)
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var beingOrder: UILabel = {
    let label = UILabel()
    label.text = "진행중 주문"
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var beingOrderCount: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var seperateLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var pointTextLabel: UILabel = {
    let label = UILabel()
    label.text = "포인트"
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var pointNum: UILabel = {
    let label = UILabel()
    label.text = "0P"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var rightSideCellButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(.white, for: .normal)
    button.setTitle("바로가기", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.backgroundColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    // 창식 테스트
    button.addTarget(self, action: #selector(siccTest(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  @objc private func siccTest(_ sender: Any) {
    guard let tokenInfo = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String],
    let type = tokenInfo["type"] else {
      return logger("로그아웃 하기 전인데 토큰 정보가 없습니다. 심각한 에러")
    }
    UserDefaults.standard.removeObject(forKey: "tokenInfo")
    NotificationCenter.default.post(name: NSNotification.Name("LoginDidChange"),
                                    object: nil,
                                    userInfo: ["type": type])
  }

  let padding: CGFloat = 10

  private lazy var titleStackView: UIStackView = {
    let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
    titleStackView.axis = .horizontal
    titleStackView.alignment = .leading
    titleStackView.distribution = .equalCentering
    titleStackView.spacing = padding

    addSubview(titleStackView)

    return titleStackView
  }()

  private lazy var detailStackView: UIStackView = {
    let detailStackView = UIStackView(arrangedSubviews: [beingOrder, beingOrderCount, seperateLabel, pointTextLabel, pointNum])
    detailStackView.axis = .horizontal
    detailStackView.alignment = .fill
    detailStackView.distribution = .equalSpacing
    detailStackView.spacing = padding

    addSubview(detailStackView)

    return detailStackView
  }()

  //각각 cell에 맞게 속성 변경
  func setLabelItems(title: TitleName, subTitle: String = "", orderCount: String = "", point: String = "") {

    switch title {
    case .myShoping:
      titleLabel.text = title.rawValue
      subTitleLabel.isHidden = true
      beingOrderCount.text = orderCount
      pointNum.text = "\(point)P"

    case .picture:
      titleLabel.text = title.rawValue

      beingOrder.isHidden = true
      beingOrderCount.isHidden = true
      pointTextLabel.isHidden = true
      pointNum.isHidden = true
      seperateLabel.isHidden = true

      rightSideCellButton.setTitle("올리기", for: .normal)
      rightSideCellButton.backgroundColor = .white
      rightSideCellButton.setTitleColor( #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
      rightSideCellButton.contentHorizontalAlignment = .right

    case .houseWarming:

      titleLabel.text = title.rawValue

      beingOrder.isHidden = true
      beingOrderCount.isHidden = true
      pointTextLabel.isHidden = true
      pointNum.isHidden = true
      seperateLabel.isHidden = true

      rightSideCellButton.isHidden = true

      subTitleLabel.text = subTitle
      subTitleLabel.backgroundColor = .white
      subTitleLabel.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)

    case .reviewWriting:

      titleLabel.text = title.rawValue
      subTitleLabel.isHidden = true

      beingOrder.isHidden = true
      beingOrderCount.isHidden = true
      pointTextLabel.isHidden = true
      pointNum.isHidden = true
      seperateLabel.isHidden = true

      rightSideCellButton.setTitle("리뷰쓰기", for: .normal)

    case .review:

      titleLabel.text = title.rawValue

      subTitleLabel.text = subTitle
      subTitleLabel.backgroundColor = .white
      subTitleLabel.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)

      beingOrder.isHidden = true
      beingOrderCount.isHidden = true
      pointTextLabel.isHidden = true
      pointNum.isHidden = true
      seperateLabel.isHidden = true

      rightSideCellButton.isHidden = true

    default:
      break
    }

  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
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

  }

  override func updateConstraints() {
    super.updateConstraints()

    titleStackView.snp.makeConstraints { make in
      //      make.centerY.equalTo(rightSideCellButton.snp.centerY).offset(-padding)
      make.top.leading.equalToSuperview().inset(padding * 2)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading).offset(-padding)
    }

    detailStackView.snp.makeConstraints { make in
      //      make.top.equalTo(rightSideCellButton.snp.centerY).offset(padding)
      make.top.equalTo(titleStackView.snp.bottom).offset(padding)
      make.leading.equalToSuperview().inset(padding * 2)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading).offset(-padding)
    }

    rightSideCellButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.17)
      make.height.equalTo(30)
      make.trailing.equalToSuperview().inset(padding * 2)
    }

  }

}
