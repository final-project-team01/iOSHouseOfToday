//
//  ProfileUserCell.swift
//  HouseOfToday
//
//  Created by Daisy on 10/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit
import SnapKit

final class ProfileUserCell: UITableViewCell {

  internal lazy var userImageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "userImage"), for: .normal)
    button.clipsToBounds = true
    button.imageView?.contentMode = .scaleAspectFit
    addSubview(button)
    return button
  }()

  internal lazy var userNameLabel: UILabel = {
    let label = UILabel()
    label.text = "사용자"
    label.font = UIFont.boldSystemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var followerButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("팔로워 0", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(.darkGray, for: .normal)
    addSubview(button)
    return button
  }()

  private lazy var followingButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("팔로잉 1", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(.darkGray, for: .normal)
    addSubview(button)
    return button
  }()

  private lazy var inviteFrendsButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("친구초대 +5,000P", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.backgroundColor = .lightGray
    button.clipsToBounds = true
    button.alpha = 0.7
    addSubview(button)
    return button
  }()

  private lazy var notiButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "noti"), for: .normal)
    addSubview(button)
    return button
  }()

  private lazy var scrapButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "bookMark"), for: .normal)
    addSubview(button)
    return button
  }()

  private lazy var likeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "like"), for: .normal)
    addSubview(button)
    return button
  }()

  private lazy var notiLabel: UILabel = {
    let label = UILabel()
    label.text = "알림"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var scrapLabel: UILabel = {
    let label = UILabel()
    label.text = "스크랩북"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var scrapCount: UILabel = {
    let label = UILabel()
    label.text = " 1"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var likeLabel: UILabel = {
    let label = UILabel()
    label.text = "좋아요"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var likeCount: UILabel = {
    let label = UILabel()
    label.text = " 2"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var followStackView: UIStackView = {
    let followStackView = UIStackView(arrangedSubviews: [followerButton, followingButton])
    followStackView.axis = .horizontal
    followStackView.alignment = .leading
    followStackView.distribution = .fill
    followStackView.spacing = 10
    return followStackView
  }()

  private lazy var userInfoStackView: UIStackView = {
    let userInfoStackView = UIStackView(arrangedSubviews: [userNameLabel, followStackView, inviteFrendsButton])
    userInfoStackView.axis = .vertical
    userInfoStackView.alignment = .leading
    userInfoStackView.distribution = .fill
    userInfoStackView.spacing = 5
    return userInfoStackView
  }()

  private lazy var topStackView: UIStackView = {
    let topStackView = UIStackView(arrangedSubviews: [userImageButton, userInfoStackView])
    topStackView.axis = .horizontal
    topStackView.alignment = .leading
    topStackView.distribution = .fill
    topStackView.spacing = 30

    addSubview(topStackView)

    return topStackView
  }()

  private lazy var notiStackView: UIStackView = {
    let notiStackView = UIStackView(arrangedSubviews: [notiButton, notiLabel])
    notiStackView.axis = .vertical
    notiStackView.alignment = .center
    notiStackView.distribution = .equalCentering
    return notiStackView
  }()

  private lazy var scrapTextStackView: UIStackView = {
    let scrapTextStackView = UIStackView(arrangedSubviews: [scrapLabel, scrapCount])
    scrapTextStackView.axis = .horizontal
    scrapTextStackView.alignment = .fill
    scrapTextStackView.distribution = .equalCentering
    return scrapTextStackView
  }()

  private lazy var scrapStackView: UIStackView = {
    let scrapStackView = UIStackView(arrangedSubviews: [scrapButton, scrapTextStackView])
    scrapStackView.axis = .vertical
    scrapStackView.alignment = .center
    scrapStackView.distribution = .equalCentering
    return scrapStackView
  }()

  private lazy var likeTextStackView: UIStackView = {
    let likeTextStackView = UIStackView(arrangedSubviews: [likeLabel, likeCount])
    likeTextStackView.axis = .horizontal
    likeTextStackView.alignment = .center
    likeTextStackView.distribution = .equalCentering
    return likeTextStackView
  }()

  private lazy var likeStackView: UIStackView = {
    let likeStackView = UIStackView(arrangedSubviews: [likeButton, likeTextStackView])
    likeStackView.axis = .vertical
    likeStackView.alignment = .center
    likeStackView.distribution = .equalCentering
    return likeStackView
  }()

  private lazy var snsButtonStackView: UIStackView = {
    let snsButtonStackView = UIStackView(arrangedSubviews: [notiStackView, scrapStackView, likeStackView])
    snsButtonStackView.axis = .horizontal
    snsButtonStackView.alignment = .fill
    snsButtonStackView.distribution = .fillEqually
    snsButtonStackView.spacing = 5

    addSubview(snsButtonStackView)

    return snsButtonStackView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none //셀에서도 선택되었을 때 표시 막아줘야한다.
    updateConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    userImageButton.layer.cornerRadius = userImageButton.frame.width / 2

    inviteFrendsButton.layer.cornerRadius = inviteFrendsButton.frame.height / 2

  }

  override func updateConstraints() {
    super.updateConstraints()

    userImageButton.snp.makeConstraints { make in
      make.width.equalToSuperview().multipliedBy(0.25)
      make.height.equalTo(userImageButton.snp.width)
    }

    inviteFrendsButton.snp.makeConstraints { make in
      make.width.equalToSuperview()
    }

    topStackView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(15)
      make.top.equalToSuperview().inset(30)
    }

    snsButtonStackView.snp.makeConstraints { make in
      make.top.equalTo(topStackView.snp.bottom).offset(30)
      make.leading.trailing.bottom.equalToSuperview().inset(15).labeled("snsButtonStackView")
    }

  }

}
