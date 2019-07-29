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
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    view.addSubview(colV)
    return colV
  }()

  private var productDetail: ProductDetail? = nil {
    didSet {

      DispatchQueue.main.async { [weak self] in
        self?.collectionView.reloadData()
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
  }

  deinit {
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.cellSpread,
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
  }

  // MARK: - setReload collectionView
  @objc private func reloadCollectionView(_ sender: Notification) {
//    collectionView.reloadSections()
    print("reloadCollectionView Click")
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
//  preferredLayoutAttributesFitting

}

// MARK: - UICollectionViewDataSource
extension ProductDetailVC: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

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
}

extension ProductDetailVC: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.item == 0 {
      return CGSize(width: UIScreen.main.bounds.width, height: ProductMainCell.height)
    } else if indexPath.item == 1 {
      return CGSize(width: UIScreen.main.bounds.width, height: ProductStylingCell.height)
    } else {
      return CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
  }
}
