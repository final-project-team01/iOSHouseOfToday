//
//  DealOfTodayCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

class DealOfTodayCell: UICollectionViewCell {

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
      priceLabel.text = formetter(price: info.price)//"\(info.price)"

      if info.review.count > 0 {
        let average = info.review.reduce(0) { $0 + $1 } / info.review.count
        ratingStarRankLabel.text = "\(average)"
      } else {
        ratingStarRankLabel.text = "\(0.0)"
      }

      if let url = URL(string: info.thumnailUrl[0]) {
        setImage(thumnailUrl: url)
      }

//      DispatchQueue.global().async { [weak self] in
//        do {
//          if let url = URL(string: info.thumnailUrl[0]) {
//            let data = try Data(contentsOf: url)
//            DispatchQueue.main.async { [weak self] in
//              guard let `self` = self else { return logger()}
//              self.thumnailImageView.image = UIImage(data: data)
//            }
//          }
//        } catch {
//          print("makeCategoryButton id: \(info.id), Error: \(error.localizedDescription)")
//        }
//      }
    }
  }

  private let margin = 15

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)

//    backgroundColor = UIColor(red: 100/255, green: 230/255, blue: 50/255, alpha: 1)
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

  // MARK: - Image Download & setImage
  private func setImage(thumnailUrl: URL) {

    thumnailImageView.kf.setImage(with: thumnailUrl,
                                  placeholder: nil,
                                  options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                  progressBlock: nil) { (_) in
//                                    print("result: ", result)
    }

    // 셀이 보여지기 전에
    // 만들어준 커스텀 셀의 이미지뷰를 불러온다.
//    let imageView = (cell as! ImageCollectionViewCell).cellImageView!
    // 일반적으로 쓰는 가장 흔한 방법
//    thumnailImageView.kf.setImage(
//      with: thumnailUrl, // url 넣기
//      placeholder: nil, // 이미지가 보여지기전 사진 넣기
//      // 옵션들 이미지 보여지는 방식이나 캐시 방식 정할 수 있음
//      // .loadDiskFileSynchronously: 로딩 성능의 균형을 맞추어 깜박임을 없앤다.
//      options: [.transition(.fade(1)), .loadDiskFileSynchronously],
//      // 진행률이 업데이트 될때 마다 호출 되는 메서드
//      // response에 예상 콘텐츠 길이가 포함되어 있지 않으면 호출되지 않음.
//      // progressBlock은 서버 응답에 헤더에 "Content-Length"가 포함 된 경우에만 호출됩니다.
//      progressBlock: { receivedSize, totalSize in
//        //                print("****\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
//        //                이미지 퍼센테이지 호출하는법
//        let percentage = (Float(receivedSize) / Float(totalSize)) * 100.0
//        print("\(indexPath.row + 1)번째 이미지: downloading progress: \(percentage)%")
//    },
//      // 완료 블럭 완료된 시점에 호출됨.
//      completionHandler: { result in
//        print(result)
//        print("\(indexPath.row + 1): Finished")
//    }
//    )
  }

  public func stopDownloadImage() {
    thumnailImageView.kf.cancelDownloadTask()
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

}
