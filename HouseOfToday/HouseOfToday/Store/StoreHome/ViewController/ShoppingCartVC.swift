//
//  ShoppingCartVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 04/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ShoppingCartVC: UIViewController {

  // MARK: - Property
//  private let flowLayout = CartCollectionviewFlowLayout()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionHeadersPinToVisibleBounds = true
    layout.sectionFootersPinToVisibleBounds = true
    layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 1)
    layout.itemSize = UICollectionViewFlowLayout.automaticSize
    layout.scrollDirection = UICollectionView.ScrollDirection.vertical
    return layout
  }()

  private let layout = CartCollectionviewFlowLayout()
  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    colV.register(ShoppingCartHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ShoppingCartHeaderView.identifier)
//    colV.register(ShoppingCartFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ShoppingCartFooterView.identifier)
//    colV.register(cell: ShoppingCartCell.self)
//    colV.register(cell: TotalPriceCell.self)
    colV.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//    colV.dataSource = self
//    colV.delegate = self
    colV.alwaysBounceVertical = true
    colV.contentInsetAdjustmentBehavior = .always
    view.addSubview(colV)
    return colV
  }()

  public var shoppingOptionCart: [ShoppingOptionCart] = [] {
    didSet {
      guard !shoppingOptionCart.isEmpty else { return print("shoppingOptionCart is empty") }

      DispatchQueue.main.async { [weak self] in

        self?.collectionView.reloadData()
      }
    }
  }

  private let service = HouseOfTodayService()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "장바구니"
    view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    collectionViewAutolayout()

    fetchCartList()
  }

  // MARK: - configure
  private func collectionViewAutolayout() {
    collectionView.snp.makeConstraints {
      $0.edges.equalTo(view)
    }
  }

  // MARK: - configure

  // MARK: - fetchCartList
  private func fetchCartList() {

    service.fetchCartList { result in
      switch result {
      case .success(let list):
        print("success!!! fetchCartList)")

        self.shoppingOptionCart = list
      case .failure(let error):
        print("fetchCartList Error: \(error.localizedDescription)")
      }
    }
  }

}
//
//extension ShoppingCartVC: UICollectionViewDataSource {
//
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    print("aaaa")
//    return 1//(shoppingOptionCart.count + 3)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    //if indexPath.item == 2 {//shoppingOptionCart.count == indexPath.item {
//      let cell = collectionView.dequeue(TotalPriceCell.self, indexPath)
//
//      return cell
//    //}
////
////    let cell = collectionView.dequeue(ShoppingCartCell.self, indexPath)
////
////    print("indexPath: \(indexPath)")
////    return cell
//  }
//
//  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//    if kind == ShoppingCartHeaderView.identifier {
//      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ShoppingCartHeaderView.identifier, for: indexPath)
//
//      return header
//    } else {
//      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ShoppingCartFooterView.identifier, for: indexPath)
//
//      return footer
//    }
//  }
//
//}
//
//extension ShoppingCartVC: UICollectionViewDelegateFlowLayout {
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//
//    return CGSize(width: UIScreen.main.bounds.width, height: 50)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//
//    return CGSize(width: UIScreen.main.bounds.width, height: 100)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//    return UIEdgeInsets(top: Metric.marginY, left: 0, bottom: 5, right: 0)
//  }
//
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//    return Metric.marginY
//  }
//
////  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////    print("layoutAttributes.bounds.size aaaaaaa")
////    return UICollectionViewFlowLayout.automaticSize
////  }
//
//}

//var isHeightCalculated: Bool = false
//
//override func preferredLayoutAttributesFittingAttributes(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//  //Exhibit A - We need to cache our calculation to prevent a crash.
//  if !isHeightCalculated {
//    setNeedsLayout()
//    layoutIfNeeded()
//    let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//    var newFrame = layoutAttributes.frame
//    newFrame.size.width = CGFloat(ceilf(Float(size.width)))
//    layoutAttributes.frame = newFrame
//    isHeightCalculated = true
//  }
//  return layoutAttributes
//}
