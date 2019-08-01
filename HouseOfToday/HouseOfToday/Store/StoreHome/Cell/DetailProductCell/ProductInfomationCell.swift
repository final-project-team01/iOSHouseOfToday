//
//  ProductInfomationCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 26/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

class ProductInfomationCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "ProductInfomationCell"

  private lazy var cellTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "상품정보"
    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    addSubview(label)
    return label
  }()

  private var imageViews: [UIImageView] = [] {
    didSet {
      guard imageViews.count + failImageCount == productDetail?.detailImages.count else { return }

      print("reload imageViews")
    }
  }

  private lazy var gradationImageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "gradient"))
    iv.contentMode = .scaleAspectFill
    addSubview(iv)
    return iv
  }()

  private lazy var spreadButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("펼치기 ∨", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.addTarget(self, action: #selector(spreadImageViewAction(_:)), for: .touchUpInside)
    gradationImageView.addSubview(btn)
    return btn
  }()

  private var failImageCount = 0

  public var productImages: [Int: UIImage] = [:]

  public var productDetail: ProductDetail? = nil {
    didSet {
      guard let info = productDetail else { return print("productDetail is nil")}

      let urls = info.detailImages.map ({ URL(string: $0.image) }).compactMap ({ $0 })

      setImageViews(urls)
    }
  }

  let notiCenter = NotificationCenter.default

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)

    let imageView = UIImageView(frame: CGRect.zero)
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageViews.append(imageView)
    addSubview(imageView)
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

    if cellTitleLabel.translatesAutoresizingMaskIntoConstraints {
      cellTitleLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if let firstImageView = imageViews.first,
      firstImageView.translatesAutoresizingMaskIntoConstraints {
      print("firstImageView")
      addSubview(firstImageView)
      firstImageView.snp.makeConstraints {
        $0.top.equalTo(cellTitleLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.bottom.equalToSuperview()
      }
    }

    if gradationImageView.translatesAutoresizingMaskIntoConstraints {
      gradationImageView.snp.makeConstraints {
        $0.leading.trailing.bottom.equalToSuperview()
        $0.height.equalTo(gradationImageView.snp.width).multipliedBy(0.3)
      }
    }

    if spreadButton.translatesAutoresizingMaskIntoConstraints {
      spreadButton.snp.makeConstraints {
        $0.leading.trailing.bottom.equalToSuperview().inset(Metric.marginX)
        $0.height.equalTo(gradationImageView.snp.height).multipliedBy(0.4)
      }
    }

  }

  private func imageViewsAutolayout() {

    for index in 1..<imageViews.count {

      imageViews[index].snp.makeConstraints {
        $0.top.equalTo(imageViews[index-1].snp.bottom)
        $0.leading.trailing.equalToSuperview()

        // FIXME: - image 높이를 넣어야함 비율 계산
        print("height: ", imageViews[index].getHeight())
        $0.height.equalTo(imageViews[index].getHeight())
      }
    }

//    if let lastImageView = imageViews.last {
//      lastImageView.snp.makeConstraints {
//        $0.bottom.equalToSuperview()
//      }
//    }

  }

  private func setImageViews(_ urls: [URL]) {
    failImageCount = 0

//    if let firstImageView = imageViews.first, let firstUrl = urls.first {
//      firstImageView.kf.setImage(with: firstUrl,
//                                 placeholder: nil,
//                                 options: [.transition(.fade(1)), .loadDiskFileSynchronously],
//                                 progressBlock: nil) {(_) in
//
//      }
//    }
    if let firstImageView = imageViews.first, let firstUrl = urls.first {
      firstImageView.kf.setImage(with: firstUrl,
                                 placeholder: nil,
                                 options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                 progressBlock: nil) { [weak self] image, _, _, _ in

                                  firstImageView.image = self?.resizeImage(image: image, resizeWidth: UIScreen.main.bounds.width)
      }
    }

    for index in 1..<urls.count {

      let downloader = ImageDownloader.default
      downloader.downloadImage(with: urls[index]) { result in
        switch result {
        case .success(let value):
          print("success:", index)
          self.imageViews.append(UIImageView(image: value.image))
        case .failure(let error):
          print(error)
          self.failImageCount += 1
        }
      }
    }
  }

  func resizeImage(image: UIImage?, resizeWidth: CGFloat) -> UIImage? {

    guard let image = image else { return nil}

    let scale = resizeWidth / image.size.width
    let resizeHeight = image.size.height * scale
    UIGraphicsBeginImageContext(CGSize(width: resizeWidth, height: resizeHeight))
    image.draw(in: CGRect(x: 0, y: 0, width: resizeWidth, height: resizeHeight))
    let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return resizeImage
  }

  // MARK: - Spread ImageView Button Action
  @objc private func spreadImageViewAction(_ sender: UIButton) {

    let totalHeight: Int = Int(imageViews.reduce(0) { $0 + $1.getHeight() })

    notiCenter.post(name: ProductDetailVC.cellSpread, object: nil, userInfo: ["TotalHeight": totalHeight])
  }
}

//extension UIImageView {
//  func getHeight() -> Int {
//    return Int(image?.size.height ?? 0)
//  }
//}
