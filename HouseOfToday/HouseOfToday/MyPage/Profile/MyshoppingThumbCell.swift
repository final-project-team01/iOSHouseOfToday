//
//  ProfileBaseCell.swift
//  HouseOfToday
//
//  Created by Daisy on 11/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit
import SnapKit

extension Notification.Name {
  static let presentpresentMyShoppingView = Notification.Name("presentMyShoppingView")
}

final class MyshoppingThumbCell: UITableViewCell {

  private let notiCenter = NotificationCenter.default

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "나의 쇼핑"
    label.textColor = #colorLiteral(red: 0.1772814812, green: 0.1772814812, blue: 0.1772814812, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 18)
    addSubview(label)
    return label
  }()

  private lazy var beingOrder: UILabel = {
    let label = UILabel()
    label.text = "진행중 주문"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var beingOrderCount: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var seperateLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .darkGray
    addSubview(label)
    return label
  }()

  private lazy var pointTextLabel: UILabel = {
    let label = UILabel()
    label.text = "포인트"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var pointNum: UILabel = {
    let label = UILabel()
    label.text = "0P"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  // FIXME: - 누르면 나의쇼핑 View로 가기 구현
  private lazy var rightSideCellButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(.white, for: .normal)
    button.setTitle("바로가기", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.addTarget(self, action: #selector(gotoMyShopping(_ :)), for: .touchUpInside)
    button.backgroundColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    addSubview(button)
    return button
  }()

  let padding: CGFloat = 10

  private lazy var detailStackView: UIStackView = {
    let detailStackView = UIStackView(arrangedSubviews: [beingOrder, beingOrderCount, seperateLabel, pointTextLabel, pointNum])
    detailStackView.axis = .horizontal
    detailStackView.alignment = .fill
    detailStackView.distribution = .equalSpacing
    detailStackView.spacing = padding

    addSubview(detailStackView)

    return detailStackView
  }()

  @objc func gotoMyShopping(_ sender: UIButton) {
//   let myVC = MyPageVC()

    
   // FIXME: - didSelectedCategoryCell 아마 `didSelectedCategoryCell` 써서 해보기
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

    rightSideCellButton.layer.cornerRadius = rightSideCellButton.frame.height / 10
    rightSideCellButton.clipsToBounds = true

    seperateLabel.snp.makeConstraints { make in
      make.width.equalTo(1)
      make.height.equalTo(beingOrderCount.snp.height)
    }

  }

  override func updateConstraints() {
    super.updateConstraints()

    titleLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(15)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading).offset(-padding)
      make.centerY.equalTo(rightSideCellButton.snp.centerY).offset(-padding * 1.2)
    }

    detailStackView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(padding)
      make.leading.equalToSuperview().inset(15)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading).offset(-padding)
    }

    rightSideCellButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.17)
      make.height.equalTo(30)
      make.trailing.equalToSuperview().inset(15)
    }

  }

}
