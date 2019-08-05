//
//  ProductInfomationView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

final class ProductInfomationView: UIView {

  // MARK: - Property
  static var height: CGFloat = 600

  private lazy var cellTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "상품정보"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    addSubview(label)
    return label
  }()

  private lazy var testLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "상품정보"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
    addSubview(btn)
    return btn
  }()

  private var failImageCount = 0

  public var productImages: [Int: UIImage] = [:]

  public var productDetail: ProductDetail? = nil {
    didSet {
      guard let info = productDetail else { return print("productDetail is nil")}

      let urls = info.detailImages.map ({ URL(string: $0.image) }).compactMap ({ $0 })

      let totalValue = Float(1.0) / Float(urls.count)

      if let firstImageView = imageViews.first, let firstUrl = urls.first {
        firstImageView.tag = 0
        firstImageView.kf.setImage(with: firstUrl,
                                   placeholder: nil,
                                   options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                   progressBlock: nil) { [weak self] image, _, _, _ in

                                    self?.notiCenter.post(name: ProductDetailVC.progressUpdate, object: nil, userInfo: ["progressUpdate": totalValue])
                                    firstImageView.image = self?.resizeImage(image: image, resizeWidth: UIScreen.main.bounds.width)
        }
      }

      for index in 1..<urls.count {
        self.imageViews.append(UIImageView(frame: CGRect.zero))

        if let lastView = imageViews.last {
          lastView.contentMode = .scaleAspectFit
          lastView.clipsToBounds = true

          lastView.kf.setImage(with: urls[index],
                               placeholder: nil,
                               options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                               progressBlock: nil) { [weak self] _, _, _, _ in

                                self?.notiCenter.post(name: ProductDetailVC.progressUpdate, object: nil, userInfo: ["progressUpdate": totalValue])
//                                lastView.image = self?.resizeImage(image: image, resizeWidth: UIScreen.main.bounds.width)
          }

        }
      }

      DispatchQueue.main.async {
        self.updateImageViewsAutolayout()
      }

    }
  }

  let notiCenter = NotificationCenter.default

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white

    self.clipsToBounds = true

    let imageView = UIImageView(frame: CGRect.zero)
    imageView.contentMode = .top//.scaleAspectFill
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

//    if testLabel.translatesAutoresizingMaskIntoConstraints {
//      testLabel.snp.makeConstraints {
//        $0.top.equalToSuperview().offset(Metric.marginY)
//        $0.leading.equalToSuperview().offset(Metric.marginY)
//      }
//    }

    if cellTitleLabel.translatesAutoresizingMaskIntoConstraints {
      cellTitleLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

//    if let firstImageView = imageViews.first,
//      firstImageView.translatesAutoresizingMaskIntoConstraints {
//      print("firstImageView")
//      addSubview(firstImageView)
//      firstImageView.snp.makeConstraints {
//        $0.top.equalTo(cellTitleLabel.snp.bottom).offset(Metric.marginY*2)
//        $0.leading.trailing.bottom.equalToSuperview()
//      }
//    }

    if gradationImageView.translatesAutoresizingMaskIntoConstraints {
      gradationImageView.snp.makeConstraints {
        $0.leading.trailing.bottom.equalToSuperview()
        $0.height.equalTo(ProductInfomationView.height/3)
      }
    }

    if spreadButton.translatesAutoresizingMaskIntoConstraints {

      spreadButton.snp.makeConstraints {
        $0.centerY.equalTo(gradationImageView.snp.centerY)
        $0.leading.trailing.equalToSuperview()//.inset(Metric.marginX)
        $0.height.equalTo(gradationImageView.snp.height).multipliedBy(0.3)
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
  }

  private func setImageViews(_ urls: [URL]) {
    failImageCount = 0

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

  private func updateImageViewsAutolayout() {

    if let firstImageView = imageViews.first {
      firstImageView.snp.makeConstraints {
        $0.top.equalTo(cellTitleLabel.snp.bottom).offset(Metric.marginY*2)
        $0.leading.trailing.equalToSuperview()
        $0.width.equalTo(UIScreen.main.bounds.width)
//        $0.bottom.equalToSuperview()
      }
    }

    for index in 1..<imageViews.count {
      addSubview(imageViews[index])
      imageViews[index].snp.makeConstraints {
        $0.top.equalTo(imageViews[index - 1].snp.bottom)
        $0.left.right.equalToSuperview()
        $0.height.equalTo(0)
      }
    }

    if let lastImageView = imageViews.last {
      lastImageView.snp.makeConstraints {
        $0.bottom.equalToSuperview().priority(500)
      }
    }
  }

  public func updateLongSizeAutolayout() {

    for index in 1..<imageViews.count {
      imageViews[index].snp.updateConstraints {

        //        if let image = imageViews[index].image {
        //          let scale = (UIScreen.main.bounds.width)  / image.size.width
        //          let resizeHeight = image.size.height * scale
        //          $0.height.equalTo(resizeHeight)
        //        } else {
        $0.height.equalTo(imageViews[index].getHeight())
        //        $0.height.equalTo((imageViews[index].image?.size.height ?? 0) )
        //        }
      }
    }
  }

  public func getImagesHeight() -> CGFloat {

    var height = imageViews.reduce(0) { $0 + $1.getHeight() }
//    var height = imageViews.reduce(0) { $0 + ($1.image?.size.height ?? 0) }
    print("height: \(height)")
    return height
  }

  private func rescaling(image: UIImage?, resizeWidth: CGFloat) -> UIImage? {
    guard let image = image else { return nil; print("rescaling fail")}

//    image.scale = resizeWidth / image.size.width
    return image
  }

  private func resizeImage(image: UIImage?, resizeWidth: CGFloat) -> UIImage? {

    guard let image = image else { return nil}

    let scale = (resizeWidth*1)  / image.size.width
    let resizeHeight = image.size.height * scale
    UIGraphicsBeginImageContext(CGSize(width: resizeWidth, height: resizeHeight))
    image.draw(in: CGRect(x: 0, y: 0, width: resizeWidth, height: resizeHeight))
    let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

//    print("scale: ", resizeImage?.scale)
//    resizeImage.set
    return resizeImage
  }

  // MARK: - Spread ImageView Button Action
  @objc private func spreadImageViewAction(_ sender: UIButton) {
    print("spreadImageViewAction")

    let totalHeight: CGFloat = getImagesHeight()

    ProductInfomationView.height = totalHeight
    notiCenter.post(name: ProductDetailVC.cellSpread, object: nil, userInfo: ["TotalHeight": totalHeight])
  }
}

extension UIImageView {
  func getHeight() -> CGFloat {

    if let width = image?.size.width {
      let scale = (UIScreen.main.bounds.width)  / width
      let resizeHeight = (image?.size.height ?? 0) * scale

      return (resizeHeight + 0.5)
    }

    return (image?.size.height ?? 0)
  }
}
