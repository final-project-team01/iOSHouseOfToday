//
//  DealOfTodayCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class DealOfTodayCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "DealOfTodayCell"

  lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.backgroundColor = .white
    addSubview(imageView)
    return imageView
  }()

  lazy var brandLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "brand"
    addSubview(label)
    return label
  }()

  lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Label"
    label.lineBreakMode = .byCharWrapping
    label.numberOfLines = 0
    addSubview(label)
    return label
  }()

  lazy var ratingStarLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "⭐"
    addSubview(label)
    return label
  }()

  lazy var ratingStarRankLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "5.0"
    addSubview(label)
    return label
  }()

  lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰 1,004"
    addSubview(label)
    return label
  }()

  lazy var discountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    let mutableAttributedString = NSMutableAttributedString()

    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 50, weight: .bold),
      .foregroundColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    ]
    let attributeString = NSMutableAttributedString(string: "80",
                                                             attributes: attributes)
    let attributes1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 25, weight: .bold),
      .foregroundColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    ]
    let attributeString1 = NSMutableAttributedString(string: "%",
                                                    attributes: attributes1)
    mutableAttributedString.append(attributeString)
    mutableAttributedString.append(attributeString1)
    label.attributedText = mutableAttributedString
    addSubview(label)
    return label
  }()

  lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "999,999"
    addSubview(label)
    return label
  }()

  let margin = 15

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .blue
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    viewsConfigure()
  }

  // MARK: - configure
  private func viewsConfigure() {

    if thumnailImageView.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.snp.makeConstraints {
        $0.top.leading.bottom.equalToSuperview()
        $0.width.equalTo(self.snp.height)
      }
    }

    if brandLabel.translatesAutoresizingMaskIntoConstraints {
      brandLabel.snp.makeConstraints {
        $0.top.trailing.equalToSuperview()
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
      }
    }

    if productNameLabel.translatesAutoresizingMaskIntoConstraints {
      productNameLabel.snp.makeConstraints {
        $0.top.equalTo(brandLabel.snp.bottom)
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
        $0.trailing.equalToSuperview()
      }
    }

    if ratingStarLabel.translatesAutoresizingMaskIntoConstraints {
      ratingStarLabel.snp.makeConstraints {
        $0.top.equalTo(productNameLabel.snp.bottom)
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
      }
    }

    if ratingStarRankLabel.translatesAutoresizingMaskIntoConstraints {
      ratingStarRankLabel.snp.makeConstraints {
        $0.top.equalTo(productNameLabel.snp.bottom)
        $0.leading.equalTo(ratingStarLabel.snp.trailing).offset(0)
      }
    }

    if reviewCountLabel.translatesAutoresizingMaskIntoConstraints {
      reviewCountLabel.snp.makeConstraints {
        $0.top.equalTo(productNameLabel.snp.bottom)
        $0.leading.equalTo(ratingStarRankLabel.snp.trailing).offset(10)
      }
    }

    if discountLabel.translatesAutoresizingMaskIntoConstraints {
      discountLabel.snp.makeConstraints {
        $0.top.lessThanOrEqualTo(reviewCountLabel.snp.bottom).offset(20)
//        $0.top.greaterThanOrEqualTo(reviewCountLabel.snp.bottom).offset(20)
//        $0.bottom.lessThanOrEqualTo(self.snp.bottom)
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.top.equalTo(discountLabel.snp.bottom)
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
//        $0.bottom.lessThanOrEqualTo(self.snp.bottom)
//        $0.bottom.greaterThanOrEqualTo(self.snp.bottom)
      }
    }
  }
}
