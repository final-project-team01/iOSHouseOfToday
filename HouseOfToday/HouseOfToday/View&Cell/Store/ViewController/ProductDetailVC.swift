//
//  ProductDetailVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 20/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

extension ProductDetailVC {
  static var cellSpread: Notification.Name {
    return Notification.Name("cellSpread")
  }
  static var presentReview: Notification.Name {
    return Notification.Name("presentReview")
  }
}

class ProductDetailVC: UIViewController {

  // MARK: - Property

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  lazy var bottomView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)

    return view
  }()

  lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    return layout
  }()

  lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.register(cell: ProductMainCell.self)
    colV.register(cell: ProductStylingCell.self)
    colV.register(cell: ProductInfomationCell.self)
    colV.register(cell: PopularityProductCell.self)
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    view.addSubview(colV)
    return colV
  }()

  private var productList: [ProductList] = [] {
    didSet {
      guard !productList.isEmpty else { return print("productList is empty")}

      print("productList called")
      DispatchQueue.main.async { [weak self] in
        let indexSet = IndexSet(integer: 1)
        self?.collectionView.reloadSections(indexSet)
      }
    }
  }

  private var productListTemp: CategoryIdList? {
    didSet {
      guard let products = productListTemp?.products else { return print("productListTemp?.products fail")}
      productList = products.map {
        let imageUrl = $0.thumnailImages.map { Resizing.url($0.image, Int(Metric.popularityProductCellSize.width * 2)).get  }
        //        let review = $0.review.map { $0.score }

        return ProductList(id: $0.id,
                           brandName: $0.brandName,
                           productName: $0.productName,
                           discountRate: $0.discountRate,
                           price: $0.price,
                           reviewCount: $0.reviewCount,
                           starAvg: $0.starAvg,
                           thumnailUrl: imageUrl)
      }

    }
  }

  private var productDetail: ProductDetail? = nil {
    didSet {
      guard let info = productDetail else { return print("productDetail is nil")}

      print("ProductDetail called")
      self.fetchCategoryID(id: info.category)

      DispatchQueue.main.async { [weak self] in
        let indexSet = IndexSet(integer: 0)
        self?.collectionView.reloadSections(indexSet)
      }
    }
  }

  private var productImages: [Int: UIImage] = [:]

  let notiCenter = NotificationCenter.default

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    autolayoutViews()
    setupNotificationCenter()
  }

  deinit {
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.cellSpread,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.presentReview,
                              object: nil)
  }

  // MARK: - configure
  private func autolayoutViews() {

    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  // MARK: - Setting NotofocationCenter
  private func setupNotificationCenter() {
    notiCenter.addObserver(self,
                           selector: #selector(reloadCollectionView(_:)),
                           name: ProductDetailVC.cellSpread,
                           object: nil)

    notiCenter.addObserver(self,
                           selector: #selector(presentReview(_:)),
                           name: ProductDetailVC.presentReview,
                           object: nil)
  }

  // MARK: - setReload collectionView
  @objc private func reloadCollectionView(_ sender: Notification) {
//    collectionView.reloadSections()
    print("reloadCollectionView Click")
  }

  // MARK: - presentReview NotificationCenter
  @objc private func presentReview(_ sender: Notification) {
    print("presentReview Click")
    let reviewVC = ReviewVC()
    reviewVC.productDetailData = productDetail

    navigationController?.pushViewController(reviewVC, animated: true)
//    present(reviewVC, animated: true)
  }

  // MARK: - ImageDownload
  private func getFirstImage(_ urls: [URL]) {

    if let firstUrl = urls.first {
      let downloader = ImageDownloader.default
      downloader.downloadImage(with: firstUrl) { result in
        switch result {
        case .success(let value):
          self.productImages[0] = value.image
          self.getImages(urls)
        case .failure(let error):
          print(error)
        }
      }
    }
  }

  private func getImages(_ urls: [URL]) {

    for index in 1..<urls.count {

      let downloader = ImageDownloader.default
      downloader.downloadImage(with: urls[index]) { result in
        switch result {
        case .success(let value):
//          print("success:", index)
          self.productImages[index] = value.image
        case .failure(let error):
          print(error)
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

  // MARK: - FetchProductDetail
  public func fetchProductDetail(id: Int) {
    service.fetchProductDetail(id: id) { result in
      switch result {
      case .success(let product):
        print("success!!! ProductDetail")
        self.productDetail = product
      case .failure(let error):
        print("fetchProductDetail Error: \(error.localizedDescription)")
      }
    }
  }

  public func fetchCategoryID(id: Int) {

    service.fetchCategoryIdList(id: id) { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.products.count)")

        self.productListTemp = list
      case .failure(let error):

        print("fetchCategoryList Error: \(error.localizedDescription)")
      }
    }
  }

}

// MARK: - UICollectionViewDataSource
extension ProductDetailVC: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else {
      return productList.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    if indexPath.section == 0 {
      if indexPath.item == 0 {
        let cell = collectionView.dequeue(ProductMainCell.self, indexPath)
        cell.productDetail = self.productDetail
        return cell
      } else if indexPath.item == 1 {
        let cell = collectionView.dequeue(ProductStylingCell.self, indexPath)

        return cell
      } else {//if indexPath.item == 1 {
        let cell = collectionView.dequeue(ProductInfomationCell.self, indexPath)
        cell.productDetail = self.productDetail
        return cell
      }
    } else {
      let cell = collectionView.dequeue(PopularityProductCell.self, indexPath)

      return cell
    }
  }
}

extension ProductDetailVC: UICollectionViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {

    guard let cell = self.collectionView.cellForItem(at: IndexPath(row: 0, section: 0)),
      let mainCell = cell as? ProductMainCell else { return }

    if SwipeImageview.height > scrollView.bounds.origin.y + view.safeAreaInsets.top {
      mainCell.updateSwipeImageViewPosition(positionY: (scrollView.bounds.origin.y + view.safeAreaInsets.top) / 2)
    }
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? PopularityProductCell {
      cell.productInfo = productList[indexPath.item]
    }
  }

  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? PopularityProductCell {
      cell.stopDownloadImage()
    }
  }

}

extension ProductDetailVC: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    if indexPath.section == 0 {
      if indexPath.item == 0 {
        return CGSize(width: UIScreen.main.bounds.width, height: ProductMainCell.height)
      } else if indexPath.item == 1 {
        return CGSize(width: UIScreen.main.bounds.width, height: ProductStylingCell.height)
      } else {
        return CGSize(width: UIScreen.main.bounds.width, height: 400)
      }
    } else {
      return Metric.popularityProductCellSize
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    if section == 3 {
      return Metric.dealOfTodayCellInset
    } else {
      return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
  }
}
