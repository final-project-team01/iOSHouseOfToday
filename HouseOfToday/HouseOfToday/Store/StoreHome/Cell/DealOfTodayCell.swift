//
//  DealOfTodayCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

final class DealOfTodayCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "DealOfTodayCell"

  private lazy var timeRemainingLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = " 5일 99:99:99 남음 "
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 5//("일" as NSString).size(withAttributes: [.font: "1"]).height
    return label
  }()

  private lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.backgroundColor = .white
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 5
    addSubview(imageView)
    return imageView
  }()

  private lazy var brandLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "brand"
    label.textColor = #colorLiteral(red: 0.4823140502, green: 0.4823748469, blue: 0.4822933078, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 10)
    addSubview(label)
    return label
  }()

  private lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Labelasdfasdfasdfafffffsdfasdf"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 3
    label.textColor = #colorLiteral(red: 0.2588008046, green: 0.258836329, blue: 0.2587887347, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var ratingStarLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★"
    label.textColor = #colorLiteral(red: 0, green: 0.4797514677, blue: 0.9984372258, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var ratingStarRankLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "5.0"
    label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
    label.textColor = #colorLiteral(red: 0.2588008046, green: 0.258836329, blue: 0.2587887347, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰 1,004"
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = #colorLiteral(red: 0.4823140502, green: 0.4823748469, blue: 0.4822933078, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var discountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    let mutableAttributedString = NSMutableAttributedString()

    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 40, weight: .bold),
      .foregroundColor: #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    ]
    let attributeString = NSMutableAttributedString(string: "80",
                                                             attributes: attributes)
    let attributes1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 20, weight: .bold),
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
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    addSubview(label)
    return label
  }()

  public var productInfo: ProductList? {
    didSet {
      guard let info = productInfo else { return logger()}

      brandLabel.text = info.brandName
      productNameLabel.text = info.productName
      priceLabel.text = formetter(price: info.price)

      ratingStarRankLabel.text = "\(info.starAvg)"
      discountLabel.attributedText = getAttributeString(rate: info.discountRate)
      reviewCountLabel.text = "리뷰 \(info.reviewCount)"

      if let url = URL(string: info.thumnailUrl[0]) {
        setImage(thumnailUrl: url)
      }
    }
  }

  private var timer = Timer()

  private let margin = 15

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupTimer()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    killTimer()
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    viewsConfigure()
  }

  // MARK: - configure
  private func viewsConfigure() {

    if thumnailImageView.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.snp.makeConstraints {
        $0.top.leading.equalToSuperview()
        $0.height.equalTo(Metric.dealOfTodayCellSize.height)
        $0.width.equalTo(thumnailImageView.snp.height)
      }
    }

    if timeRemainingLabel.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.addSubview(timeRemainingLabel)
      timeRemainingLabel.snp.makeConstraints {
        $0.top.leading.equalToSuperview().offset(10)
        $0.height.equalTo(priceLabel.snp.height)
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
        $0.trailing.equalToSuperview()//.priority(250)
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
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.top.equalTo(discountLabel.snp.bottom)
        $0.leading.equalTo(thumnailImageView.snp.trailing).offset(margin)
      }
    }
  }

  private func getAttributeString(rate: String) -> NSMutableAttributedString {
    let mutableAttributedString = NSMutableAttributedString()

    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 40, weight: .bold),
      .foregroundColor: #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    ]
    let attributeString = NSMutableAttributedString(string: rate,
                                                    attributes: attributes)
    let attributes1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 20, weight: .bold),
      .foregroundColor: #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    ]
    let attributeString1 = NSMutableAttributedString(string: "%",
                                                     attributes: attributes1)
    mutableAttributedString.append(attributeString)
    mutableAttributedString.append(attributeString1)

    return mutableAttributedString
  }

  // MARK: - Setting Timeer
  private func setupTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] (_) in
      self?.setTimeAttackLabel()
    })
  }

  private func killTimer() {
    timer.fire()
  }

  private func setTimeAttackLabel() {

    let nowDate = Date()
    let formetter = ISO8601DateFormatter()
    let tomorrow = Date(timeInterval: 86400, since: nowDate)
    let tomorrowFormetter = DateFormatter()

    tomorrowFormetter.dateFormat = "yyyy-MM-dd"

    let tomorrowString = tomorrowFormetter.string(from: tomorrow) + "T00:00:00+0000"

    if let date = formetter.date(from: tomorrowString) {

      let components = Set<Calendar.Component>([.second, .minute, .hour, .day])
      let differenceOfDate = Calendar.current.dateComponents(components, from: nowDate, to: date)

      guard let day = differenceOfDate.day, let hour = differenceOfDate.hour,
        let minute = differenceOfDate.minute, let second = differenceOfDate.second else { return }

      var diffText: String = ""
      var hourText: String = ""
      var minuteText: String = ""
      var secondText: String = ""

      if hour < 10 {
        hourText = "0\(hour)"
      } else { hourText = "\(hour)"}
      if minute < 10 {
        minuteText = "0\(minute)"
      } else { minuteText = "\(minute)" }
      if second < 10 {
        secondText = "0\(second)"
      } else { secondText = "\(second)"}

      if day == 0 {
        diffText = " \(hourText): \(minuteText): \(secondText) 남음 "
      } else {
        diffText = " 0\(day)일 \(hourText): \(minuteText): \(secondText) 남음 "
      }
      timeRemainingLabel.text = diffText
    }

  }

  // MARK: - Image Download & setImage
  private func setImage(thumnailUrl: URL) {

    thumnailImageView.kf.setImage(with: thumnailUrl,
                                  placeholder: nil,
                                  options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                  progressBlock: nil) { (_) in
    }
  }

  public func stopDownloadImage() {
    thumnailImageView.kf.cancelDownloadTask()
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  public func showAnimationCell() {

    thumnailImageView.snp.updateConstraints {
      $0.height.equalTo(Metric.dealOfTodayCellSize.height + 200)
    }
    layoutIfNeeded()

    UIView.animate(withDuration: 1) { [weak self] in
      self?.thumnailImageView.snp.updateConstraints {
        $0.height.equalTo(Metric.dealOfTodayCellSize.height)
      }
      self?.layoutIfNeeded()
    }
  }

}
