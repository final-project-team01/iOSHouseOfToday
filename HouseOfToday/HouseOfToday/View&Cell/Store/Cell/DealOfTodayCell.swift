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

  private lazy var timeRemainingLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = " 5일 99:99:99 남음 "
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 5//("일" as NSString).size(withAttributes: [.font: "1"]).height
    return label
  }()

  private lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.backgroundColor = .white
    addSubview(imageView)
    return imageView
  }()

  private lazy var brandLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "brand"
    label.textColor = #colorLiteral(red: 0.4823140502, green: 0.4823748469, blue: 0.4822933078, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Labelasdfasdfasdfafffffsdfasdf"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 3
    label.textColor = #colorLiteral(red: 0.2588008046, green: 0.258836329, blue: 0.2587887347, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var ratingStarLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★"
    label.textColor = #colorLiteral(red: 0, green: 0.4797514677, blue: 0.9984372258, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var ratingStarRankLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "5.0"
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.textColor = #colorLiteral(red: 0.2588008046, green: 0.258836329, blue: 0.2587887347, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰 1,004"
    label.textColor = #colorLiteral(red: 0.4823140502, green: 0.4823748469, blue: 0.4822933078, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var discountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    let mutableAttributedString = NSMutableAttributedString()

    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 50, weight: .bold),
      .foregroundColor: #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    ]
    let attributeString = NSMutableAttributedString(string: "80",
                                                             attributes: attributes)
    let attributes1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 25, weight: .bold),
      .foregroundColor: #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    ]
    let attributeString1 = NSMutableAttributedString(string: "%",
                                                    attributes: attributes1)
    mutableAttributedString.append(attributeString)
    mutableAttributedString.append(attributeString1)
    label.attributedText = mutableAttributedString
    addSubview(label)
    return label
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "999,999"
    label.textColor = #colorLiteral(red: 0.2588008046, green: 0.258836329, blue: 0.2587887347, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  public var productInfo: ProductList? {
    didSet {
      guard let info = productInfo else { return logger()}

      brandLabel.text = info.brandName
      productNameLabel.text = info.productName
      priceLabel.text = "\(info.price)"

      if info.review.count > 0 {
        let average = info.review.reduce(0) { $0 + $1 } / info.review.count
        ratingStarRankLabel.text = "\(average)"
      } else {
        ratingStarRankLabel.text = "\(0.0)"
      }

      DispatchQueue.global().async { [weak self] in
        do {
          if let url = URL(string: info.thumnailUrl[0]) {
            let data = try Data(contentsOf: url)
            DispatchQueue.main.async { [weak self] in
              guard let `self` = self else { return logger()}
              self.thumnailImageView.image = UIImage(data: data)
            }
          }
        } catch {
          print("makeCategoryButton id: \(info.id), Error: \(error.localizedDescription)")
        }
      }
    }
  }

  private let margin = 15

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = UIColor(red: 100/255, green: 230/255, blue: 50/255, alpha: 1)
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

    if timeRemainingLabel.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.addSubview(timeRemainingLabel)
      timeRemainingLabel.snp.makeConstraints {
        $0.top.leading.equalToSuperview().offset(margin)
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
        $0.top.equalTo(productNameLabel.snp.bottom).offset(5)
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
      }
    }

    if ratingStarRankLabel.translatesAutoresizingMaskIntoConstraints {
      ratingStarRankLabel.snp.makeConstraints {
        $0.top.equalTo(productNameLabel.snp.bottom).offset(5)
        $0.leading.equalTo(ratingStarLabel.snp.trailing).offset(0)
      }
    }

    if reviewCountLabel.translatesAutoresizingMaskIntoConstraints {
      reviewCountLabel.snp.makeConstraints {
        $0.top.equalTo(productNameLabel.snp.bottom).offset(5)
        $0.leading.equalTo(ratingStarRankLabel.snp.trailing).offset(10)
      }
    }

    if discountLabel.translatesAutoresizingMaskIntoConstraints {
      discountLabel.snp.makeConstraints {
        $0.top.lessThanOrEqualTo(reviewCountLabel.snp.bottom).offset(15)
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
