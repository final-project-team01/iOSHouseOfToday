//
//  CategoryBarView.swift
//  HouseOfToday
//
//  Created by chang sic jung on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryTabBarView: UIView {

  lazy var categoryTabBarCollectionView: UICollectionView = {

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal

    let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    cv.showsHorizontalScrollIndicator = false
    cv.backgroundColor = .yellow

    addSubview(cv)

    cv.dataSource = self.self
    cv.delegate = self.self
    cv.register(cell: CategoryTabBarCell.self)
    return cv
  }()

  lazy var indicatorBar: UIView = {
    let v = UIView()
    v.backgroundColor = .black
    addSubview(v)
    return v
  }()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    categoryTabBarCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    indicatorBar.snp.makeConstraints {
      $0.leading.bottom.equalToSuperview()
      $0.height.equalTo(self.snp.height).multipliedBy(0.1)
    }

  }
}

extension CategoryTabBarView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  // MARK: - UICollectionViewDataSource

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return menuTitles.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(CategoryTabBarCell.self, indexPath)
    cell.label.text = menuTitles[indexPath.item]

    return cell
  }

}
