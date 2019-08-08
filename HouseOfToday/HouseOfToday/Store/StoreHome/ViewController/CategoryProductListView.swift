//
//  CategoryProductListView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 22/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class CategoryProductListView: UIViewController {

  // MARK: - Property
  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = Metric.dealOfTodayCellInset
//    layout.estimatedItemSize = CGSize(width: Metric.popularityProductCellSize.width, height: 50)
//    layout.itemSize = UICollectionViewFlowLayout.automaticSize
    return layout
  }()

  lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    colV.register(cell: PopularityProductCell.self)
    view.addSubview(colV)
    return colV
  }()

  private var productList: [ProductList] = [] {
    didSet {
      DispatchQueue.main.async { [weak self] in
        self?.collectionView.reloadData()
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

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureNaviBar()
    autolayoutViews()
  }

  // MARK: - 창식 - Navi 설정
  private func configureNaviBar() {
    self.title = "카테고리"
    self.navigationController?.setNavigationBarHidden(false, animated: true)

    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - configure
  private func autolayoutViews() {

    if collectionView.translatesAutoresizingMaskIntoConstraints {
      collectionView.snp.makeConstraints {
        $0.edges.equalToSuperview()
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
extension CategoryProductListView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return productList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(PopularityProductCell.self, indexPath)

    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension CategoryProductListView: UICollectionViewDelegate {
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

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    let vc = ProductDetailVC()
    self.navigationController?.navigationBar.isHidden = false
    self.navigationItem.hidesBackButton = true

    vc.fetchProductDetail(id: productList[indexPath.item].id)
    navigationController?.pushViewController(vc, animated: true)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryProductListView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return Metric.popularityProductCellSize
  }
}
