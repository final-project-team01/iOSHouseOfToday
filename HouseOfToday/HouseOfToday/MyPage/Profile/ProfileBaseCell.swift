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
    case picture          = "사진"
    case houseWarming     = "집들이"
    case reviewWriting    = "리뷰쓰기"
    case review           = "리뷰"
  }

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "나의 쇼핑"
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
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
    if let tokenInfo = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String],
    let type = tokenInfo["type"] {
      UserDefaults.standard.removeObject(forKey: "tokenInfo")
      NotificationCenter.default.post(name: NSNotification.Name("LoginDidChange"),
                                      object: nil,
                                      userInfo: ["type": (type, "logout")])
    } else {
      logger("로그아웃 하기 전인데 토큰 정보가 없습니다. 둘러보기로 왔으니 보내드립니다.")
      NotificationCenter.default.post(name: NSNotification.Name("LoginDidChange"),
                                      object: nil,
                                      userInfo: ["type": ("lookAround", "logout")])
    }
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

  //각각 cell에 맞게 속성 변경
  func setLabelItems(title: TitleName, subTitle: String = "", orderCount: String = "", point: String = "") {

    switch title {

    case .picture:
      titleLabel.text = title.rawValue

      rightSideCellButton.setTitle("올리기", for: .normal)
      rightSideCellButton.backgroundColor = .clear
      rightSideCellButton.setTitleColor( #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
      rightSideCellButton.contentHorizontalAlignment = .right

    case .houseWarming:

      titleLabel.text = title.rawValue

      rightSideCellButton.isHidden = true

      subTitleLabel.text = subTitle
      subTitleLabel.backgroundColor = .white
      subTitleLabel.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)

    case .reviewWriting:

      titleLabel.text = title.rawValue
      subTitleLabel.isHidden = true

      rightSideCellButton.setTitle("리뷰쓰기", for: .normal)

    case .review:

      titleLabel.text = title.rawValue

      subTitleLabel.text = subTitle
      subTitleLabel.backgroundColor = .white
      subTitleLabel.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)

      rightSideCellButton.isHidden = true

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

  }

  override func updateConstraints() {
    super.updateConstraints()

    titleStackView.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(15)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading).offset(-padding)
      make.centerY.equalTo(rightSideCellButton.snp.centerY)
    }

    rightSideCellButton.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.17)
      make.height.equalTo(30)
      make.trailing.equalToSuperview().inset(15)
    }

  }

}
