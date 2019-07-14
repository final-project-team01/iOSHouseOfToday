//
//  ProfileUserCell.swift
//  HouseOfToday
//
//  Created by Daisy on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

final class ProfileUserCell: UITableViewCell {

  lazy var userImageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "userImage"), for: .normal)
    button.layer.cornerRadius = button.frame.width / 2
    button.clipsToBounds = true
    addSubview(button)
    return button
  }()

  lazy var userNameLabel: UILabel = {
    let label = UILabel()
    label.text = "데이지코"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  lazy var followerButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("팔로워 0", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.setTitleColor(.black, for: .normal)
    addSubview(button)
    return button
  }()

  lazy var followingButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("팔로잉 1", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.setTitleColor(.black, for: .normal)
    addSubview(button)
    return button
  }()

  lazy var inviteFrendsButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("친구초대 +5,000P", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.backgroundColor = .lightGray
    button.alpha = 0.7
    addSubview(button)
    return button
  }()

  lazy var notiButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "noti"), for: .normal)
    addSubview(button)
    return button
  }()

  lazy var scrapButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "bookMark"), for: .normal)
    addSubview(button)
    return button
  }()

  lazy var likeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "like"), for: .normal)
    addSubview(button)
    return button
  }()

  lazy var notiLabel: UILabel = {
    let label = UILabel()
    label.text = "알림"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  lazy var scrapLabel: UILabel = {
    let label = UILabel()
    label.text = "스크랩북"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  lazy var scrapCount: UILabel = {
    let label = UILabel()
    label.text = " 1"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  lazy var likeLabel: UILabel = {
    let label = UILabel()
    label.text = "좋아요"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  lazy var likeCount: UILabel = {
    let label = UILabel()
    label.text = " 2"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    label.textColor = .lightGray
    addSubview(label)
    return label
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

    userImageButton.layer.cornerRadius = userImageButton.frame.width / 2
    userImageButton.clipsToBounds = true

    inviteFrendsButton.layer.cornerRadius = inviteFrendsButton.frame.height / 2
    inviteFrendsButton.clipsToBounds = true

  }

  override func updateConstraints() {
    super.updateConstraints()

    let followStackView = UIStackView(arrangedSubviews: [followerButton, followingButton])
    followStackView.axis = .horizontal
    followStackView.alignment = .leading
    followStackView.distribution = .fill
    followStackView.spacing = 10

    let userInfoStackView = UIStackView(arrangedSubviews: [userNameLabel, followStackView, inviteFrendsButton])
    userInfoStackView.axis = .vertical
    userInfoStackView.alignment = .leading
    userInfoStackView.distribution = .fill
    userInfoStackView.spacing = 5

    let topStackView = UIStackView(arrangedSubviews: [userImageButton, userInfoStackView])
    topStackView.axis = .horizontal
    topStackView.alignment = .leading
    topStackView.distribution = .fill
    topStackView.spacing = 30

    addSubview(topStackView)

    let notiStackView = UIStackView(arrangedSubviews: [notiButton, notiLabel])
    notiStackView.axis = .vertical
    notiStackView.alignment = .center
    notiStackView.distribution = .equalCentering

    let scrapTextStackView = UIStackView(arrangedSubviews: [scrapLabel, scrapCount])
    scrapTextStackView.axis = .horizontal
    scrapTextStackView.alignment = .fill
    scrapTextStackView.distribution = .equalCentering

    let scrapStackView = UIStackView(arrangedSubviews: [scrapButton, scrapTextStackView])
    scrapStackView.axis = .vertical
    scrapStackView.alignment = .center
    scrapStackView.distribution = .equalCentering

    let likeTextStackView = UIStackView(arrangedSubviews: [likeLabel, likeCount])
    likeTextStackView.axis = .horizontal
    likeTextStackView.alignment = .center
    likeTextStackView.distribution = .equalCentering

    let likeStackView = UIStackView(arrangedSubviews: [likeButton, likeTextStackView])
    likeStackView.axis = .vertical
    likeStackView.alignment = .center
    likeStackView.distribution = .equalCentering

    let snsButtonStackView = UIStackView(arrangedSubviews: [notiStackView, scrapStackView, likeStackView])
    snsButtonStackView.axis = .horizontal
    snsButtonStackView.alignment = .fill
    snsButtonStackView.distribution = .fillEqually
    snsButtonStackView.spacing = 5

    addSubview(snsButtonStackView)

    userImageButton.snp.makeConstraints { make in
      make.width.equalToSuperview().multipliedBy(0.25)
      make.height.equalTo(userImageButton.snp.width)
    }

    inviteFrendsButton.snp.makeConstraints { make in
      make.width.equalToSuperview()
    }

    topStackView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview().inset(30)
    }

    snsButtonStackView.snp.makeConstraints { make in
      make.top.equalTo(topStackView.snp.bottom).offset(15)
      make.leading.trailing.bottom.equalToSuperview().inset(10).labeled("snsButtonStackView")
    }

  }

}
