//
//  PopularityProductCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 19/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PopularityProductCell: UICollectionViewCell {
  // MARK: - Property
  static var identifier: String = "PopularityProductCell"

  private lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.backgroundColor = .white
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 10
    addSubview(imageView)
    return imageView
  }()

  private lazy var brandLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "brand"
    label.textColor = #colorLiteral(red: 0.9293405414, green: 0.929452002, blue: 0.9293025732, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Label 1asldkfjhaslkjdfhalksjdfalkjhdf"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 2
    addSubview(label)
    return label
  }()

  private lazy var discountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "80%"
    label.textColor = #colorLiteral(red: 0.08574206382, green: 0.7608343959, blue: 0.9359433651, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "999,999"
    label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var ratingStarRankLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★5.0"
    addSubview(label)
    return label
  }()

  private lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰 1,004"
    addSubview(label)
    return label
  }()

  private lazy var clippingAndHitsCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "스크랩 999 조회 500"
    addSubview(label)
    return label
  }()

  private lazy var deliveryFreeLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "무료배송"
    label.backgroundColor = #colorLiteral(red: 0.9293405414, green: 0.929452002, blue: 0.9293025732, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 5
    addSubview(label)
    return label
  }()

  private lazy var lowestPriceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "최저가"
    label.backgroundColor = #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 5
    addSubview(label)
    return label
  }()

  var productInfo: ProductList? {
    didSet {
      guard let info = productInfo else { return logger() }

      brandLabel.text = info.brandName
      productNameLabel.text = info.productName
      priceLabel.text = "\(info.price)"

      if info.review.count > 0 {
        let average = info.review.reduce(0) { $0 + $1 } / info.review.count
        ratingStarRankLabel.text = "★\(average)"
      } else {
        ratingStarRankLabel.text = "★\(0.0)"
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

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor(red: 50/255, green: 100/255, blue: 200/255, alpha: 1)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    cellAutolayout()
  }

  // MARK: - configure
  private func cellAutolayout() {

    let margin = 5

    if thumnailImageView.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.snp.makeConstraints {
        $0.top.leading.trailing.equalToSuperview()
        $0.height.equalTo(thumnailImageView.snp.width)
      }
    }

    if brandLabel.translatesAutoresizingMaskIntoConstraints {
      brandLabel.snp.makeConstraints {
        $0.leading.equalToSuperview()
        $0.top.equalTo(thumnailImageView.snp.bottom).offset(margin)
      }
    }

    if productNameLabel.translatesAutoresizingMaskIntoConstraints {
      productNameLabel.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
        $0.top.equalTo(brandLabel.snp.bottom).offset(margin)
      }
    }

    if discountLabel.translatesAutoresizingMaskIntoConstraints {
      discountLabel.snp.makeConstraints {
        $0.leading.equalToSuperview()
        $0.top.equalTo(productNameLabel.snp.bottom).offset(margin*2)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.leading.equalTo(discountLabel.snp.trailing).offset(margin*2)
        $0.top.equalTo(discountLabel.snp.top)
      }
    }
//
    if clippingAndHitsCountLabel.translatesAutoresizingMaskIntoConstraints {
      clippingAndHitsCountLabel.snp.makeConstraints {
        $0.leading.equalToSuperview()
        $0.top.equalTo(discountLabel.snp.bottom).offset(margin*2)
      }
    }

    // FIXME: - add rating star label

    if deliveryFreeLabel.translatesAutoresizingMaskIntoConstraints {
      deliveryFreeLabel.snp.makeConstraints {
        $0.leading.equalToSuperview()
        $0.top.equalTo(clippingAndHitsCountLabel.snp.bottom).offset(margin)
      }
    }

    if lowestPriceLabel.translatesAutoresizingMaskIntoConstraints {
      lowestPriceLabel.snp.makeConstraints {
        $0.leading.equalTo(deliveryFreeLabel.snp.trailing).offset(margin)
        $0.top.equalTo(deliveryFreeLabel.snp.top)
      }
    }
  }

  public func showRatingStar(_ hide: Bool) {
    clippingAndHitsCountLabel.isHighlighted = hide
  }

}
