//
//  SimilarProductView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class SimilarProductsView: UIView {

  // MARK: - Property
  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "비슷한 상품"
    addSubview(label)
    return label
  }()

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = Metric.dealOfTodayCellInset
    //    layout.estimatedItemSize = CGSize(width: Metric.popularityProductCellSize.width, height: 50)
    //    layout.itemSize = UICollectionViewFlowLayout.automaticSize
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    colV.register(cell: PopularityProductCell.self)
    addSubview(colV)
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
  override func layoutSubviews() {
    super.layoutSubviews()
    backgroundColor = .white
    autolayoutViews()
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
extension SimilarProductsView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return productList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(PopularityProductCell.self, indexPath)

    return cell
  }

}

// MARK: - UICollectionViewDelegate
extension SimilarProductsView: UICollectionViewDelegate {
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

// MARK: - UICollectionViewDelegateFlowLayout
extension SimilarProductsView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return Metric.popularityProductCellSize
  }
}
