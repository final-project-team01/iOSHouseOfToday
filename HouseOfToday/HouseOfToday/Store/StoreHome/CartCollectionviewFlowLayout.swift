//
//  CartCollectionviewFlowLayout.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 06/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CartCollectionviewFlowLayout: UICollectionViewFlowLayout {

  override init() {
    super.init()

    self.minimumInteritemSpacing = Metric.marginX
    self.minimumLineSpacing = Metric.marginY
    self.sectionInset = UIEdgeInsets(top: Metric.marginY, left: 0, bottom: 0, right: 0)
    self.sectionHeadersPinToVisibleBounds = true
    self.sectionFootersPinToVisibleBounds = true
    self.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    guard let layoutAttributes = super.layoutAttributesForItem(at: indexPath) else { return nil }
    guard let collectionView = collectionView else { return nil }
    layoutAttributes.bounds.size.width = collectionView.safeAreaLayoutGuide.layoutFrame.width - sectionInset.left - sectionInset.right
    return layoutAttributes
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let superLayoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
    guard scrollDirection == .vertical else { return superLayoutAttributes }

    let computedAttributes = superLayoutAttributes.compactMap { layoutAttribute in
      return layoutAttribute.representedElementCategory == .cell ? layoutAttributesForItem(at: layoutAttribute.indexPath) : layoutAttribute
    }
    return computedAttributes
  }

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }

}
