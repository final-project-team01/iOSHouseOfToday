//
//  PictureTableViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {

  private lazy var userInfoButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("daisy_ko_", for: .normal)
    button.setImage(UIImage(named: "user"), for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
    button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    button.contentHorizontalAlignment = .left
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
    //    button.addTarget(self, action: #selector(didTapDotdotdotButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var bodyTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "아내는 남편을 '그 자신이 가장 좋아하는 것들을 모아 만든 이름'으로 불렀고, 실제로 남편의 남은 인생을 그가 꿈꾸던 좋은 것들로 채워주었다. 남편은 아내를 '한때 자신의 것이었던 이름'으로 불렀다. 결혼 이후 세상을 떠날 때까지 김환기에게 아내 김향안은 또 다른 자신이었다. 5월의 사랑, 꿈, 아름다운 자연을 같이 나눌 사람은 하나밖에 없었던가. 한 사람이 가고 나니 5월의 이야기를 나눌 사람이 없다. 별들은 많으나 사랑할 수 있는 별은 하나밖에 없다."
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
    button.isUserInteractionEnabled = true
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
    button.setTitle("1", for: .normal)
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
    //    button.contentHorizontalAlignment = .left
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    //    button.addTarget(self, action: #selector(didTapReplyButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var authorCommentLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "노란색 의자 너무 예뻐요😊" // FIXME: - authorNicknameButton width 계산해서 앞쪽에 추가해주고 오토레이아웃 다시 잡기
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

  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionHeadersPinToVisibleBounds = false
    layout.sectionFootersPinToVisibleBounds = false
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .blue
    collectionView.register(cell: PictureCollectionViewCell.self)
    addSubview(collectionView)
    return collectionView
  }()

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    makeConstraints()
    backgroundColor = .white
    isUserInteractionEnabled = true

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
    print("didTapDotdotdotButton")
    // FIXME: - 신고, 취소 알럿? 띄우기

  }

  @objc private func didTapHeartButton(_ sender: UIButton) {
    sender.isSelected.toggle()
    // FIXME: - count 적용해주기

  }

  @objc private func didTapScrapButton(_ sender: UIButton) {
    sender.isSelected.toggle()
    // FIXME: - count 적용해주기

  }

  @objc private func didTapCommentButton(_ sender: UIButton) {
    print("didTapCommentButton")
    // FIXME: - comment View 로 넘어가기

  }

  @objc private func didTapSharingButton(_ sender: UIButton) {
    print("sharingButton")
    // FIXME: - sharing 창 띄우기

  }

  override func layoutSubviews() {
    super.layoutSubviews()

    userInfoButton.imageView?.layer.cornerRadius = userInfoButton.imageView!.frame.width/2
    userInfoButton.clipsToBounds = true

    authorImageButton.imageView?.layer.cornerRadius = authorImageButton.imageView!.frame.width/2
    authorImageButton.clipsToBounds = true
  }

  // MARK: - AutoLayout
  private func makeConstraints() {

    let margin: CGFloat = 10

    // 15는 superView에 대한
    userInfoButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(15)
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
      make.leading.equalToSuperview().inset(margin)
      make.bottom.equalTo(collectionView.snp.top).inset(-margin)
    }
    authorNicknameButton.snp.makeConstraints { make in
      make.top.equalTo(socialButtonStackView.snp.bottom)
      make.leading.equalTo(authorImageButton.snp.trailing).offset(5)
      make.trailing.equalTo(authorCommentLabel.snp.leading).offset(-5)
      make.bottom.equalTo(collectionView.snp.top).inset(-margin)
    }
    authorCommentLabel.snp.makeConstraints { make in
      make.top.equalTo(socialButtonStackView.snp.bottom)
      make.trailing.equalToSuperview().inset(margin)
      make.bottom.equalTo(collectionView.snp.top).inset(-margin)
    }

    collectionView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(margin)
      make.bottom.equalToSuperview().inset(30)
    }
  }
}

extension PictureTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(PictureCollectionViewCell.self, indexPath)
    return cell

  }

}

extension PictureTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return JMetric.rankkingCellSize
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

}
