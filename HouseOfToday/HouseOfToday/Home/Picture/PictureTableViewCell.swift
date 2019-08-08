//
//  PictureTableViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension Notification.Name {
  static let replyVC = Notification.Name("ReplyVC")
  static let activityC = Notification.Name("ActivityC")
  static let picAlert = Notification.Name("PicAlert")
}

class PictureTableViewCell: UITableViewCell {

  private let notiCenter = NotificationCenter.default

  let replyVC = ReplyVC()

  private lazy var userThumbNailButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "user"), for: .normal)
    button.addTarget(self, action: #selector(didTapUserInfoButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var userNicknameButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("daisy_ko_", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    button.addTarget(self, action: #selector(didTapUserInfoButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private var followBool = false

  private lazy var followStatusButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("팔로잉", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(.lightGray, for: .normal)
    button.contentHorizontalAlignment = .left
    button.addTarget(self, action: #selector(didTapFollowStatusButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var dotdotdotButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("•••", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    button.addTarget(self, action: #selector(didTapDotdotdotButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var bodyTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "sdgfdhgjhghgjfdhdgfssfdshfdjgfhkgjhklkjhkgfjdgs"
    label.numberOfLines = 5
    label.lineBreakMode = .byTruncatingTail // FIXME: - 마지막에 `...더보기` 나오게 만들기
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var thumbnailImageView: UIImageView = {
    let imageview = UIImageView(image: UIImage(named: "ahhh"))
    addSubview(imageview)
    return imageview
  }()

  private lazy var heartButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("1", for: .normal)
    button.setTitleColor(.darkGray, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setImage(UIImage(named: "picHeart"), for: .normal)
    button.setImage(UIImage(named: "fullPicHeart"), for: .selected)
    button.addTarget(self, action: #selector(didTapHeartButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var scrapButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("1", for: .normal)
    button.setTitleColor(.darkGray, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setImage(UIImage(named: "picBookMark"), for: .normal)
    button.setImage(UIImage(named: "fullPicBookMark"), for: .selected)
    button.addTarget(self, action: #selector(didTapScrapButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var commentButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("1", for: .normal)
    button.setImage(UIImage(named: "picComment"), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(.darkGray, for: .normal)
    button.addTarget(self, action: #selector(didTapCommentButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var sharingButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "picShare"), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(.darkGray, for: .normal)
    button.addTarget(self, action: #selector(didTapSharingButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var authorImageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "user"), for: .normal)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
    //    button.addTarget(self, action: #selector(didTapReplyButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var authorNicknameButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("author", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    //    button.addTarget(self, action: #selector(didTapReplyButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var authorCommentLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "노란색 의자 너무 예뻐요😊" // FIXME: - authorNicknameButton width 계산해서 앞쪽에 추가해주고 오토레이아웃 다시 잡아보자
    label.numberOfLines = 2
    label.lineBreakMode = .byTruncatingTail
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var socialButtonStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ self.heartButton,
                                                    self.scrapButton,
                                                    self.commentButton,
                                                    self.sharingButton]
    )
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    addSubview(stackView)
    return stackView
  }()

  // MARK: - collectionview
  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return layout
  }()

  internal lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
    collectionView.register(cell: PictureCollectionViewCell.self)
    addSubview(collectionView)
    return collectionView
  }()

  // MARK: - getData

  public var pictureInfo: PictureModel? {
    didSet {
      guard let info = pictureInfo else {return logger()}
      userNicknameButton.setTitle(info.author, for: .normal)
      bodyTextLabel.text = info.text
      heartButton.setTitle("\(info.likeCount)", for: .normal)
      scrapButton.setTitle("\(info.scrapCount)", for: .normal)
      commentButton.setTitle("\(info.commentCount)", for: .normal)

      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }

      commentsInfo = info.comments.first
    }
  }

  public var commentsInfo: PictureModel.CommentsInfo? {
    didSet {
      guard let info = commentsInfo else {return logger()}
      authorNicknameButton.setTitle("\(info.author)", for: .normal)
      authorCommentLabel.text = info.text
    }
  }

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    makeConstraints()
    backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Action Methods
  @objc private func didTapUserInfoButton(_ sender: UIButton) {
    print("didTapUserInfoButton")
    // FIXME: - 유저 Info로 넘어가는 페이지 만들기
  }

  @objc private func didTapFollowStatusButton(_ sender: UIButton) {
    print("didTapFollowStatusLabel")
    followBool.toggle()
    if followBool == true {
      followStatusButton.setTitle("팔로우", for: .normal)
      followStatusButton.setTitleColor( #colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1), for: .normal)
    } else {
      followStatusButton.setTitle("팔로잉", for: .normal)
      followStatusButton.setTitleColor( .lightGray, for: .normal)
    }
  }

  @objc private func didTapDotdotdotButton(_ sender: UIButton) {

    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    let doneAction = UIAlertAction(title: "신고", style: .default, handler: nil)
    let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)

    //Add Action
    alertController.addAction(doneAction)
    alertController.addAction(cancelAction)

    notiCenter.post(name: .picAlert, object: sender, userInfo: ["PicAlert": alertController])
  }

  @objc private func didTapHeartButton(_ sender: UIButton) {
    sender.isSelected.toggle()
    if sender.isSelected {
      pictureInfo?.likeCount += 1
    } else {
      pictureInfo?.likeCount -= 1
    }
  }

  @objc private func didTapScrapButton(_ sender: UIButton) {
    sender.isSelected.toggle()
    if sender.isSelected {
      pictureInfo?.scrapCount += 1
    } else {
      pictureInfo?.scrapCount -= 1
    }
  }

  // replyVC 로 넘어가기
  @objc private func didTapCommentButton(_ sender: UIButton) {
    notiCenter.post(name: .replyVC, object: sender, userInfo: ["ReplyVC": replyVC])
  }

  @objc private func didTapSharingButton(_ sender: UIButton) {
    let activityVC = UIActivityViewController(activityItems: ["공유"], applicationActivities: nil)
    activityVC.excludedActivityTypes = [.airDrop, .mail, .message, .print]

    notiCenter.post(name: .activityC, object: sender, userInfo: ["ActivityVC": activityVC])

  }

  override func layoutSubviews() {
    super.layoutSubviews()
    userThumbNailButton.imageView?.layer.cornerRadius = userThumbNailButton.imageView!.frame.width/2
    userThumbNailButton.clipsToBounds = true

    authorImageButton.imageView?.layer.cornerRadius = authorImageButton.imageView!.frame.width/2
    authorImageButton.clipsToBounds = true
  }

  // MARK: - AutoLayout
  private func makeConstraints() {

    let margin: CGFloat = 10

    userThumbNailButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(15)
      make.bottom.equalTo(bodyTextLabel.snp.top).inset(-margin)
      make.width.equalToSuperview().multipliedBy(0.1)
      make.height.equalTo(userThumbNailButton.snp.width)
    }

    userNicknameButton.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(15)
      make.leading.equalTo(userThumbNailButton.snp.trailing).offset(10)
      make.trailing.equalTo(followStatusButton.snp.leading).inset(-10)
      make.bottom.equalTo(bodyTextLabel.snp.top).inset(-margin)
    }

    followStatusButton.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(15)
      make.bottom.equalTo(bodyTextLabel.snp.top).inset(-margin)
    }

    dotdotdotButton.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(15)
      make.bottom.equalTo(bodyTextLabel.snp.top).inset(-margin)
    }

    bodyTextLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(15)
      make.bottom.equalTo(thumbnailImageView.snp.top).inset(-margin)
    }

    thumbnailImageView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.width.equalTo(thumbnailImageView.snp.height)
    }

    socialButtonStackView.snp.makeConstraints { make in
      make.top.equalTo(thumbnailImageView.snp.bottom)
      make.centerX.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.9)
    }

    authorImageButton.snp.makeConstraints { make in
      make.top.equalTo(socialButtonStackView.snp.bottom)
      make.leading.equalToSuperview().inset(15)
      make.bottom.equalTo(collectionView.snp.top)
      make.width.equalToSuperview().multipliedBy(0.06)
      make.height.equalTo(authorImageButton.snp.width)
    }
    authorNicknameButton.snp.makeConstraints { make in
      make.top.equalTo(socialButtonStackView.snp.bottom)
      make.leading.equalTo(authorImageButton.snp.trailing).offset(5)
      make.trailing.equalTo(authorCommentLabel.snp.leading).offset(-5)
      make.bottom.equalTo(collectionView.snp.top)
    }
    authorCommentLabel.snp.makeConstraints { make in
      make.top.equalTo(socialButtonStackView.snp.bottom)
      make.trailing.equalToSuperview().inset(margin)
      make.bottom.equalTo(collectionView.snp.top)
    }

    collectionView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalToSuperview().inset(30)
      make.height.equalTo(100)
    }
  }

  // MARK: - Action Methods

  //user thumbnail
  func setUserprofileImage(thumnailUrl: URL) {
    userThumbNailButton.kf.setImage(with: thumnailUrl, for: .normal)
  }

  //main product image
  func setImage(thumnailUrl: URL) {

    thumbnailImageView.kf.setImage(with: thumnailUrl,
                                   placeholder: nil,
                                   options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                   progressBlock: nil) { (_) in
    }
  }

  //comment user thumbnail
  func userThumbNailButton(thumnailUrl: URL) {
    authorImageButton.kf.setImage(with: thumnailUrl, for: .normal)
  }

  //stop download
  public func stopDownloadImage() {
    thumbnailImageView.kf.cancelDownloadTask()
    userThumbNailButton.imageView!.kf.cancelDownloadTask()
    authorImageButton.imageView!.kf.cancelDownloadTask()
  }
}

extension PictureTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(PictureCollectionViewCell.self, indexPath)

    if let url = URL(string: pictureInfo?.productImage ?? "" ) {
      cell.commentThumbButton(thumnailUrl: url)
    }

    return cell
  }
}

extension PictureTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    let lineSpacing = JMetric.lineSpacing
    let horizontalPadding = JMetric.rankingHorizontalInset.left + JMetric.rankingHorizontalInset.right + 50
    let width = (collectionView.frame.width - lineSpacing - horizontalPadding) / 4

    return CGSize(width: width.rounded(.down), height: width.rounded(.down))
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return JMetric.lineSpacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return JMetric.itemSpacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return JMetric.rankingHorizontalInset
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let productID = pictureInfo?.productID
    notiCenter.post(name: StoreVC.presentProductDetail, object: nil, userInfo: ["productID": productID])

  }
}
