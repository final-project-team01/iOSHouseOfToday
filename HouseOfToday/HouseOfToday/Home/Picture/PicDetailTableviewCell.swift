//
//  PicDetailTableviewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 06/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PicDetailTableviewCell: UITableViewCell {

  private let notiCenter = NotificationCenter.default

  private lazy var categoryLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "30평대 | 내추럴 | 스타일아파트"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var createdLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1일전"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(named: "test")
    imageView.contentMode = .scaleAspectFit
    addSubview(imageView)
    return imageView
  }()

  // MARK: - collectionview
  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return layout
  }()

  internal lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(cell: PictureCollectionViewCell.self)
    addSubview(collectionView)
    return collectionView
  }()

  private lazy var picBodyTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "Loading..."
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var authorImageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "user"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFill
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

  private var followBool = false

  private lazy var followStatusButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("+ 팔로우", for: .normal)
    button.setTitleColor(.lightGray, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    button.clipsToBounds = true
    button.addTarget(self, action: #selector(didTapFollowStatusButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var likeTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "좋아요"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var likeCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "7"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var scrapTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "스크랩"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var scrapCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "0"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var replyTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "댓글"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var replyCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "0"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var viewsTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "조회수"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var viewsCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "118"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var detailInfoStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ self.likeTitleLabel,
                                                    self.likeCountLabel,
                                                    self.scrapTitleLabel,
                                                    self.scrapCountLabel,
                                                    self.replyTitleLabel,
                                                    self.replyCountLabel,
                                                    self.viewsTitleLabel,
                                                    self.viewsCountLabel]
    )
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fillProportionally
    stackView.spacing = 6
    addSubview(stackView)
    return stackView
  }()

  private lazy var plusButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "opaPlusButton"), for: .normal)
    button.addTarget(self, action: #selector(didTapPlusButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  public var picDetailInfo: PicDetailModel? {
    didSet {
      guard let info = picDetailInfo else {return logger()}
      categoryLabel.text = info.category
      createdLabel.text = info.created
      picBodyTextLabel.text = info.text
      authorNicknameButton.setTitle("\(info.author)", for: .normal)
      replyCountLabel.text = "\(info.likeCount)"
      scrapCountLabel.text = "\(info.scrapCount)"
      replyCountLabel.text = "\(info.commentCount)"
      viewsCountLabel.text = "\(info.hitCount)"

      plusButton.snp.makeConstraints { make in
        make.centerX.equalTo(productImageView.snp.trailing).multipliedBy(floor(info.axisLeft ) * 0.01 )
        make.centerY.equalTo(productImageView.snp.bottom).multipliedBy(floor(info.axisTop ) * 0.01 )
      }

      self.bringSubviewToFront(plusButton)

      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
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

  override func layoutSubviews() {
    super.layoutSubviews()
    authorImageButton.imageView?.layer.cornerRadius = authorImageButton.imageView!.frame.width/2
    authorImageButton.clipsToBounds = true

    plusButton.imageView?.layer.cornerRadius = plusButton.imageView!.frame.width/2
    plusButton.clipsToBounds = true
  }

  // MARK: - AutoLayout
  private func makeConstraints() {
    categoryLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(15)
      make.bottom.equalTo(productImageView.snp.top).inset(-10)
    }

    createdLabel.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(15)
      make.bottom.equalTo(productImageView.snp.top).inset(-10)
    }

    productImageView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(collectionView.snp.top).inset(-10)
    }

    collectionView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalTo(picBodyTextLabel.snp.top).offset(-15)
      make.height.equalTo(100)
    }

    picBodyTextLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(15)
    }

    authorImageButton.snp.makeConstraints { make in
      make.top.equalTo(picBodyTextLabel.snp.bottom).offset(15)
      make.leading.equalToSuperview().inset(15)
      make.bottom.equalTo(detailInfoStackView.snp.top).offset(-10)
      make.width.equalToSuperview().multipliedBy(0.1)
      make.height.equalTo(authorImageButton.snp.width)
    }

    authorNicknameButton.snp.makeConstraints { make in
      make.top.equalTo(picBodyTextLabel.snp.bottom).offset(15)
      make.leading.equalTo(authorImageButton.snp.trailing).offset(10)
      make.bottom.equalTo(detailInfoStackView.snp.top).offset(-10)
    }

    followStatusButton.snp.makeConstraints { make in
      make.top.equalTo(picBodyTextLabel.snp.bottom).offset(15)
      make.trailing.equalToSuperview().inset(15)
      make.bottom.equalTo(detailInfoStackView.snp.top).offset(-10)
      make.width.equalToSuperview().multipliedBy(0.18)
    }

    detailInfoStackView.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(15)
      make.bottom.equalToSuperview().inset(30)
    }
  }

  // MARK: - getData
  public func setMainProductImage(thumnailUrl: URL) {
    //MainImage
    productImageView.kf.setImage(with: thumnailUrl,
                                 placeholder: nil,
                                 options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                 progressBlock: nil) { [weak self] image, _, _, _ in

                                  if let h = image?.size.height, let w = image?.size.width {
                                    let height = UIScreen.main.bounds.width * h / w

                                    self?.productImageView.snp.makeConstraints {
                                      $0.height.equalTo(height)
                                    }
                                  }
    }
  }

  //authorImage
  func getAuthorImage(thumnailUrl: URL) {
    authorImageButton.kf.setImage(with: thumnailUrl, for: .normal)
  }

  public func stopDownloadImage() {
    productImageView.kf.cancelDownloadTask()
    authorImageButton.imageView!.kf.cancelDownloadTask()
  }

  // MARK: - ActionMethod
  //팔로잉 버튼
  @objc private func didTapFollowStatusButton(_ sender: UIButton) {
    followBool.toggle()
    if followBool == true {
      followStatusButton.setTitle("✓ 팔로잉", for: .normal)
      followStatusButton.setTitleColor(.white, for: .normal)
      followStatusButton.backgroundColor = #colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1)
      followStatusButton.layer.borderWidth = 0
    } else {
      followStatusButton.setTitle("+ 팔로우", for: .normal)
      followStatusButton.setTitleColor( .lightGray, for: .normal)
      followStatusButton.backgroundColor = .clear
      followStatusButton.layer.borderColor = UIColor.lightGray.cgColor
      followStatusButton.layer.borderWidth = 1
    }
  }

  @objc private func didTapPlusButton(_ sender: UIButton) {
    let productID = picDetailInfo?.productID
    notiCenter.post(name: StoreVC.presentProductDetail, object: nil, userInfo: ["productID": productID])
  }
}

extension PicDetailTableviewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(PictureCollectionViewCell.self, indexPath)

    if let url = URL(string: picDetailInfo?.productImage ?? "") {
      cell.commentThumbButton(thumnailUrl: url)
    }

    return cell
  }

}

extension PicDetailTableviewCell: UICollectionViewDelegateFlowLayout {
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
    let productID = picDetailInfo?.productID
    notiCenter.post(name: StoreVC.presentProductDetail, object: nil, userInfo: ["productID": productID])

  }
}
