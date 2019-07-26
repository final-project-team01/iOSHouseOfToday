//
//  RankingCollectionCell.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class RankingCollectionCell: UICollectionViewCell {

    lazy var countLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "6"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.backgroundColor = .white
    label.layer.cornerRadius = 5
    label.clipsToBounds = true
    label.textColor = .black
    addSubview(label)
    return label
  }()

    lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.image = UIImage(named: "product")
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 5
    addSubview(imageView)
    return imageView
  }()

  private lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Label 1asldkfjhaslkjdfhalksjdfalkjhdf"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = .black
    addSubview(label)
    return label
  }()

  private lazy var ratingStarRankLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★5.0"
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = .black
    addSubview(label)
    return label
  }()

  private lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰 1,004"
    label.font = UIFont.boldSystemFont(ofSize: 10)
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

  override init(frame: CGRect) {
    super.init(frame: frame)
    cellAutolayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  @objc func didTapScrapButton(_ sender: UIButton) {
    sender.isSelected.toggle()
  }

  // MARK: - configure
  private func cellAutolayout() {

    let margin: CGFloat = 5

    if thumnailImageView.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.snp.makeConstraints { make in
        make.top.leading.trailing.equalToSuperview()
        make.height.equalTo(thumnailImageView.snp.width)
      }
    }

    if countLabel.translatesAutoresizingMaskIntoConstraints {
      countLabel.snp.makeConstraints { make in
        make.top.equalTo(thumnailImageView.snp.top).inset(-4)
        make.leading.equalTo(thumnailImageView.snp.leading).inset(-4)
        make.height.equalTo(countLabel.snp.width)
        make.width.equalToSuperview().multipliedBy(0.2)
      }
    }

    if scrapButton.translatesAutoresizingMaskIntoConstraints {
      scrapButton.snp.makeConstraints { make in
        make.bottom.equalTo(thumnailImageView.snp.bottom).inset(margin)
        make.trailing.equalTo(thumnailImageView.snp.trailing).inset(margin)
        make.height.equalTo(countLabel.snp.width)
        make.width.equalToSuperview().multipliedBy(0.2)
      }
    }

    if productNameLabel.translatesAutoresizingMaskIntoConstraints {
      productNameLabel.snp.makeConstraints { make in
        make.top.equalTo(thumnailImageView.snp.bottom).offset(margin)
        make.leading.trailing.equalToSuperview()
      }
    }

    if ratingStarRankLabel.translatesAutoresizingMaskIntoConstraints {
      ratingStarRankLabel.snp.makeConstraints { make in
        make.top.equalTo(productNameLabel.snp.bottom).offset(margin)
      }
    }

    if reviewCountLabel.translatesAutoresizingMaskIntoConstraints {
      reviewCountLabel.snp.makeConstraints { make in
        make.top.equalTo(productNameLabel.snp.bottom).offset(margin)
        make.leading.equalTo(ratingStarRankLabel.snp.trailing).offset(margin/2)
      }
    }
  }
}
