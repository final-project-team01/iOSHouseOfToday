//
//  StoreHomeView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

final class StoreHomeView: UIView {

  // MARK: - Property
  enum TypeCell: Int {
    case first
    case second
    case third
    case fourth
  }

  private let notiCenter = NotificationCenter.default

  var pageNumber: Int = 4
  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]
  private let popularityKeyword = ["homeKeyword", "aircondition", "rucyAir", "brandCupon"]
  private let sectionTitle = ["", "오늘의딜", "인기 키워드", "인기상품"]

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    return layout
  }()

  private lazy var productCollectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.register(StoreHomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoreHomeHeaderView")
    colV.register(DefaultHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DefaultHeaderView")
    colV.register(TimeSaleFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TimeSaleFooterView")

    colV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Item")
    colV.register(cell: PopularityProductCell.self)
    colV.register(cell: PopularityKewordCell.self)
    colV.register(cell: DealOfTodayCell.self)
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    addSubview(colV)
    return colV
  }()

  private var productList: [ProductList] = [] {
    didSet {
      print("productList didSet")
    }
  }

  private var productListTemp: [ProductListTemp] = [] {
    didSet {
       productList = productListTemp.map {
        let imageUrl = $0.thumnailImages.map { Resizing.url($0.image, Int(Metric.popularityProductCellSize.width * 2)).get  }
//        print($0.discountRate ?? "Err")
        return ProductList(id: $0.id,
                           brandName: $0.brandName,
                           productName: $0.productName,
                           discountRate: $0.discountRate ?? "0",
                           price: $0.price,
                           reviewCount: $0.reviewCount,
                           starAvg: $0.starAvg,
                           thumnailUrl: imageUrl)
      }

    }
  }

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    fetchProductList()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }

  override func updateConstraints() {
    super.updateConstraints()
  }

  // MARK: - configure

  override func layoutSubviews() {
    super.layoutSubviews()

    if productCollectionView.translatesAutoresizingMaskIntoConstraints {
      productCollectionView.snp.makeConstraints {
        $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading)
        $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing)
        $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
      }
    }
  }

  // MARK: - Fetch Product List

  private func fetchProductList() {
//    print("fetchProductList Start")
    service.fetchProductList { result in
      switch result {
      case .success(let list):
        print("success!!! productList List Count: \(list.count)")

        self.productListTemp = list
      case .failure(let error):
        print("fetchProductList Error: \(error.localizedDescription)")
      }
    }
  }

}

// MARK: - UICollectionViewDataSource
extension StoreHomeView: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 4
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 0
    case 1: return productList.count > 0 ? 4 : 0
    case 3:
      return productList.count
    default:
      break
    }
    return pageNumber
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

    switch kind {
    case UICollectionView.elementKindSectionHeader:
      if indexPath.section == 0 {
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StoreHomeHeaderView", for: indexPath) as? StoreHomeHeaderView {

          return header
        }
      } else {
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DefaultHeaderView", for: indexPath) as? DefaultHeaderView {
          header.titleLabel.text = sectionTitle[indexPath.section]
          if indexPath.section == 1 {
            header.hideButton(false)
          } else {
            header.hideButton(true)
          }
          return header
        }
      }

    case UICollectionView.elementKindSectionFooter:
      if let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TimeSaleFooterView", for: indexPath) as? TimeSaleFooterView {

        return footer
      }
    default:
      break
    }

    fatalError("Unable to Dequeue Reusable Supplementary View")
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    if indexPath.section == 1 {

      let cell = collectionView.dequeue(DealOfTodayCell.self, indexPath)
      cell.productInfo = productList[indexPath.item]
      return cell

    } else if indexPath.section == 2 {

      let cell = collectionView.dequeue(PopularityKewordCell.self, indexPath)
      cell.keywordImageView.image = UIImage(named: popularityKeyword[indexPath.item])
      return cell

    } else if indexPath.section == 3 {

      let cell = collectionView.dequeue(PopularityProductCell.self, indexPath)
      return cell
    }

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath)
    cell.backgroundColor = colorList[indexPath.item]
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension StoreHomeView: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? PopularityProductCell {
      cell.productInfo = productList[indexPath.item]
    }
  }

  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? DealOfTodayCell {
      cell.stopDownloadImage()
    } else if let cell = cell as? PopularityProductCell {
      cell.stopDownloadImage()
    }
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    if indexPath.section == 3 {

      let productID = productList[indexPath.item].id

      notiCenter.post(name: StoreVC.presentProductDetail, object: nil, userInfo: ["productID": productID])
    }
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StoreHomeView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

    if section == 0 {
      return CGSize(width: UIScreen.main.bounds.width, height: StoreHomeHeaderView.height)
    } else {
      return CGSize(width: UIScreen.main.bounds.width, height: DefaultHeaderView.height)
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

    if section == 1 { return CGSize(width: UIScreen.main.bounds.width, height: 50) }

    return CGSize(width: 0, height: 0)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    if indexPath.section == 1 {
      return Metric.dealOfTodayCellSize
    } else if indexPath.section == 2 {
      return Metric.popularityKeywordCellSize
    } else {
      return Metric.popularityProductCellSize
    }

  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

    if section == 0 {
      return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    } else {
      return Metric.dealOfTodayCellInset
    }

  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

    return Metric.lineSpacing[section]
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

    return Metric.itemSpacing[section]
  }
}
