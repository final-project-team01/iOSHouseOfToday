//
//  HouseWarmingTableViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class HouseWarmingTableViewCell: UITableViewCell {

  private lazy var housearmingImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(named: "ahhh")
    imageView.contentMode = .scaleAspectFill
    addSubview(imageView)
    return imageView
  }()

  private lazy var createdLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "온라인 집들이"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "사계절이 기대되는 두 번째 우리 집!"
    label.font = UIFont.systemFont(ofSize: 20)
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
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    //    button.addTarget(self, action: #selector(didTapReplyButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var scrapTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "89명 스크랩 |"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var viewsCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "6,236명 조회"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()

  private lazy var scrapButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "bookMarkOpa"), for: .normal)
    button.setImage(UIImage(named: "bookMarkOpaSelected"), for: .selected)
    button.addTarget(self, action: #selector(didTapScrapButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var scrapHitsStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ self.scrapTitleLabel,
                                                    self.viewsCountLabel]
    )
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .equalSpacing
    stackView.spacing = 3
    addSubview(stackView)
    return stackView
  }()

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
    housearmingImageView.layer.cornerRadius = 10
    housearmingImageView.clipsToBounds = true

    authorImageButton.imageView?.layer.cornerRadius = authorImageButton.imageView!.frame.width/2
    authorImageButton.clipsToBounds = true

  }

  // MARK: - get data

  public var housewarmingInfo: HousewarmingModel.HousewarmingPost? {
    didSet {
      guard let info = housewarmingInfo else {return logger()}
      titleLabel.text = info.title
      authorNicknameButton.setTitle("\(info.author)", for: .normal)
      scrapTitleLabel.text = "\(info.scrapCount)명 스크랩 |"
      viewsCountLabel.text = "\(info.hitCount)명 조회"
    }
  }

  // MARK: - Action Method
  @objc func didTapScrapButton(_ sender: UIButton) {
    sender.isSelected.toggle()
  }

  // MARK: - configure
  private func makeConstraints() {

    housearmingImageView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview().inset(15)
      make.width.equalToSuperview().multipliedBy(0.9)
      make.height.equalTo(housearmingImageView.snp.width).multipliedBy(0.8)
    }

    createdLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(housearmingImageView.snp.bottom).offset(10)
    }

    titleLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(createdLabel.snp.bottom).offset(10)
    }

    authorImageButton.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.bottom.equalTo(scrapHitsStackView.snp.top).offset(-10)
      make.width.equalToSuperview().multipliedBy(0.1)
      make.height.equalTo(authorImageButton.snp.width)
      make.trailing.equalTo(housearmingImageView.snp.centerX)
    }
    authorNicknameButton.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.bottom.equalTo(scrapHitsStackView.snp.top).offset(-10)
      make.leading.equalTo(housearmingImageView.snp.centerX).offset(5)
    }

    scrapHitsStackView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview().inset(20)
    }

    scrapButton.snp.makeConstraints { make in
      make.trailing.equalTo(housearmingImageView.snp.trailing).inset(10)
      make.bottom.equalTo(housearmingImageView.snp.bottom).inset(20)
      make.width.equalToSuperview().multipliedBy(0.1)
      make.height.equalTo(scrapButton.snp.width)
    }

  }

  //main product image
  func housewarminMainImage(thumnailUrl: URL) {

    housearmingImageView.kf.setImage(with: thumnailUrl,
                                   placeholder: nil,
                                   options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                   progressBlock: nil) { (_) in
    }
  }

  //comment user thumbnail
  func houseAuthorThumbButton(thumnailUrl: URL) {
    authorImageButton.kf.setImage(with: thumnailUrl, for: .normal)
  }

  //stop download
  public func stopDownloadImage() {
    housearmingImageView.kf.cancelDownloadTask()
    authorImageButton.imageView!.kf.cancelDownloadTask()
  }
}
