//
//  ReviewHeaderView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 30/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ReviewHeaderView: UICollectionReusableView {

  // MARK: - Property
  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰"
    label.font = UIFont.systemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "55,555"
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var starLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★★★★★"
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 25)
    addSubview(label)
    return label
  }()

  private var starView = RatingStarView()

  private lazy var starPointLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "5.0"
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var starPointHighLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "/5"
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var purchaseSatisfactionLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "55,555명의 구매만족도"
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 10)
    addSubview(label)
    return label
  }()

  private lazy var lineLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.layer.borderColor = UIColor.darkGray.cgColor
    label.layer.borderWidth = 0.5
    label.layer.addBorder([.top, .left], color: .black, width: 0.5)
    addSubview(label)
    return label
  }()

  private lazy var bestSortButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("베스트순", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 5
    btn.tag = 0
    btn.addTarget(self, action: #selector(sortReviewList(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()
  private lazy var newestSortButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("최신순", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 5
    btn.tag = 1
    btn.addTarget(self, action: #selector(sortReviewList(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()
  private lazy var lowestSortButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("낮은 평점순", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 5
    btn.tag = 2
    btn.addTarget(self, action: #selector(sortReviewList(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  public var productDetailData: ProductDetail? {
    didSet {
      guard let info = productDetailData else {return print("productDetailData is nil")}

      let reviewCount = "\(formetter(price: info.reviewCount))"
      starPointLabel.text = "\(info.starAvg)"
      reviewCountLabel.text = reviewCount
      purchaseSatisfactionLabel.text = "\(reviewCount)의 구매만족도"
      starView.rating = CGFloat(Double(info.starAvg) ?? 0.0)
//      sortedReviewList = reviewList.sorted(by: { $0.starScore > $1.starScore })

//      collectionView.reloadData()
    }
  }

  private let notiCenter = NotificationCenter.default

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)

    addSubview(starView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {

    if titleLabel.translatesAutoresizingMaskIntoConstraints {
      titleLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if reviewCountLabel.translatesAutoresizingMaskIntoConstraints {
      reviewCountLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
      }
    }

    if starLabel.translatesAutoresizingMaskIntoConstraints {
      starLabel.isHidden = true
      starLabel.snp.makeConstraints {
        $0.top.equalTo(titleLabel.snp.bottom).offset(Metric.marginY*2)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if starView.translatesAutoresizingMaskIntoConstraints {
      starView.snp.makeConstraints {
        $0.centerY.leading.equalTo(starLabel)
        $0.width.equalTo(115)
        $0.height.equalTo(23)
      }
    }

    if starPointLabel.translatesAutoresizingMaskIntoConstraints {
      starPointLabel.snp.makeConstraints {
        $0.centerY.equalTo(starLabel.snp.centerY)
        $0.leading.equalTo(starLabel.snp.trailing).offset(10)
      }
    }

    if starPointHighLabel.translatesAutoresizingMaskIntoConstraints {
      starPointHighLabel.snp.makeConstraints {
        $0.centerY.equalTo(starLabel.snp.centerY)
        $0.leading.equalTo(starPointLabel.snp.trailing)
      }
    }

    if purchaseSatisfactionLabel.translatesAutoresizingMaskIntoConstraints {
      purchaseSatisfactionLabel.snp.makeConstraints {
        $0.top.equalTo(starLabel.snp.bottom).offset(Metric.marginY/2)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if lineLabel.translatesAutoresizingMaskIntoConstraints {
      lineLabel.snp.makeConstraints {
        $0.top.equalTo(purchaseSatisfactionLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
        $0.height.equalTo(0.5)
      }
    }

    if bestSortButton.translatesAutoresizingMaskIntoConstraints {
      bestSortButton.snp.makeConstraints {
        $0.top.equalTo(lineLabel.snp.top).offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.height.equalTo(Metric.marginY * 2)
        $0.width.equalTo(UIScreen.main.bounds.width/4)
      }
    }

    if newestSortButton.translatesAutoresizingMaskIntoConstraints {
      newestSortButton.snp.makeConstraints {
        $0.top.equalTo(lineLabel.snp.top).offset(Metric.marginY)
        $0.leading.equalTo(bestSortButton.snp.trailing).offset(10)
        $0.height.equalTo(Metric.marginY * 2)
        $0.width.equalTo(UIScreen.main.bounds.width/4)
      }
    }

    if lowestSortButton.translatesAutoresizingMaskIntoConstraints {
      lowestSortButton.snp.makeConstraints {
        $0.top.equalTo(lineLabel.snp.top).offset(Metric.marginY)
        $0.leading.equalTo(newestSortButton.snp.trailing).offset(10)
        $0.height.equalTo(Metric.marginY * 2)
        $0.width.equalTo(UIScreen.main.bounds.width/4)
      }
    }
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  @objc private func sortReviewList(_ sender: UIButton) {

    bestSortButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    newestSortButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    lowestSortButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    sender.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)

    let tag: String = "\(sender.tag)"
    print(tag)
    notiCenter.post(name: ReviewVC.sort, object: nil, userInfo: ["sortNumber": tag])
  }

}
