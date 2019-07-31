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
  static var present: Notification.Name {
    return Notification.Name("present")
  }
  static var progressUpdate: Notification.Name {
    return Notification.Name("progressUpdate")
  }
}

class ProductDetailVC: UIViewController {

  // MARK: - Property

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private lazy var bottomView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)

    return view
  }()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
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

  private lazy var progressBar: UIProgressView = {
    let progress = UIProgressView(progressViewStyle: .default)
    progress.progressTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    progress.backgroundColor = .clear
//    progress.isHidden = true
    return progress
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

  private var reloadedHeight: CGFloat = 0

  private var productImages: [Int: UIImage] = [:]

  let notiCenter = NotificationCenter.default

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    autolayoutViews()
    setupNotificationCenter()
    settingProgressView()
  }

  deinit {
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.cellSpread,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.present,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.progressUpdate,
                              object: nil)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)

    ProductInfomationView.height = 600
    progressBar.isHidden = true
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
                           selector: #selector(presentVC(_:)),
                           name: ProductDetailVC.present,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(updateProgressView(_:)),
                           name: ProductDetailVC.progressUpdate,
                           object: nil)
  }

  // MARK: - Setting Progress View
  private func settingProgressView() {

    if let naviBar = navigationController?.navigationBar {
      naviBar.addSubview(progressBar)

      progressBar.snp.makeConstraints {
        $0.bottom.equalTo(naviBar.snp.bottom)
        $0.left.equalTo(naviBar.snp.left)
        $0.right.equalTo(naviBar.snp.right)
      }
    }
  }

  // MARK: - update progress view
  @objc private func updateProgressView(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: Float],
      let value = userInfo["progressUpdate"]
      else {
        return print("fail down casting")
    }

    if progressBar.progress + value < 0.95 {
      let update = progressBar.progress + value
      progressBar.setProgress(update, animated: true)
      progressBar.isHidden = false
    } else {
      print("true")
      progressBar.isHidden = true
    }
    print("progressBar.progress: \(progressBar.progress)")
  }

  // MARK: - setReload collectionView
  @objc private func reloadCollectionView(_ sender: Notification) {
    print("reloadCollectionView Click")
    guard let userInfo = sender.userInfo as? [String: CGFloat],
      let value = userInfo["TotalHeight"]
      else {
        return print("fail down casting")
    }

    reloadedHeight = value

    collectionView.reloadData()
  }

  // MARK: - presentReview NotificationCenter
  @objc private func presentVC(_ sender: Notification) {
    print("presentReview Click")

    guard let userInfo = sender.userInfo as? [String: UIViewController],
      let vc = userInfo["viewController"]
      else {
        return print("fail down casting")
    }

    navigationController?.pushViewController(vc, animated: true)
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
        if reloadedHeight == 0 {
          cell.productDetail = self.productDetail
        } else {
          cell.updateHeight()
        }
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
    if section == 1 {
      return Metric.dealOfTodayCellInset
    } else {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
//    print(section)
  }
}
