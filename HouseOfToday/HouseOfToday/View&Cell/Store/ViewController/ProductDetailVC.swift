//
//  ProductDetailVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 20/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

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
    colV.dataSource = self
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

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {

    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  // MARK: - FetchProductDetail
  public func fetchProductDetail(id: Int) {
    service.fetchProductDetail(id: id) { result in
      switch result {
      case .success(let product):
        print("success!!! ProductDetail")

        self.productDetail = product
      case .failure(let error):

        print("fetchCategoryList Error: \(error.localizedDescription)")
      }
    }
  }

}

// MARK: - UICollectionViewDataSource
extension ProductDetailVC: UICollectionViewDataSource {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

    return cell
  }
}
