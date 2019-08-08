//
//  ReplyTableViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ReplyTableViewCell: UITableViewCell {

  private lazy var userThumbNailButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "user"), for: .normal)
//    button.addTarget(self, action: #selector(didTapUserInfoButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var userNicknameButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("daisy_ko_", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
//    button.addTarget(self, action: #selector(didTapUserInfoButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var replyTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "우와!! 멋있어요!!!"
    label.numberOfLines = 0
//    label.lineBreakMode = .byWordWrapping
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var createTimeLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "19시간 ∙"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private var likeBool = false

  private lazy var likeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("♡ 좋아요", for: .normal)
    button.setTitleColor(.lightGray, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    button.addTarget(self, action: #selector(didTapLikeButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var createReplyAndReplyLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "∙ 댓글달기 ∙ 신고"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var detailInfoStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ self.createTimeLabel,
                                                    self.likeButton,
                                                    self.createReplyAndReplyLabel]
    )
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fillProportionally
    stackView.spacing = 6
    addSubview(stackView)
    return stackView
  }()

  public var CommentsList: PicDetailModel.PhotoComments? {
    didSet {
      guard let info = CommentsList else {return logger()}

      userNicknameButton.setTitle("\(info.author)", for: .normal)
      replyTextLabel.text = info.text
      createTimeLabel.text = info.created

    }
  }

  //authorImage
  func getReplyAuthorImage(thumnailUrl: URL) {
    userThumbNailButton.kf.setImage(with: thumnailUrl, for: .normal)
  }

  //stop download
  public func stopDownloadImage() {
    userThumbNailButton.imageView!.kf.cancelDownloadTask()
  }

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    makeConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    userThumbNailButton.imageView?.layer.cornerRadius = userThumbNailButton.imageView!.frame.width/2
    userThumbNailButton.clipsToBounds = true
  }

  // MARK: - Action
  @objc private func didTapLikeButton(_ sender: UIButton) {
    likeBool.toggle()
    if likeBool == true {
      likeButton.setTitle("♥︎ 좋아요", for: .normal)
      likeButton.setTitleColor(#colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1), for: .normal)
    } else {
      likeButton.setTitle("♡ 좋아요", for: .normal)
      likeButton.setTitleColor( .lightGray, for: .normal)
    }
  }
  // MARK: - AutoLayout
  private func makeConstraints() {

    userThumbNailButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(15)
      make.width.equalToSuperview().multipliedBy(0.1)
      make.height.equalTo(userThumbNailButton.snp.width)
    }

    userNicknameButton.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(15)
      make.leading.equalTo(userThumbNailButton.snp.trailing).offset(10)
      make.bottom.equalTo(replyTextLabel.snp.top).offset(-5)
    }

    replyTextLabel.snp.makeConstraints { make in
      make.leading.equalTo(userThumbNailButton.snp.trailing).offset(10)
      make.trailing.equalToSuperview().inset(15)
      make.bottom.equalTo(detailInfoStackView.snp.top).offset(-10)
    }

    detailInfoStackView.snp.makeConstraints { make in
      make.leading.equalTo(userThumbNailButton.snp.leading)
      make.bottom.equalToSuperview().inset(15)
    }

  }
}
