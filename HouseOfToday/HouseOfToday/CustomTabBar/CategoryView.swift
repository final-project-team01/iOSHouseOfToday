//
//  CategoryView.swift
//  HouseOfToday
//
//  Created by chang sic jung on 11/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryView: UIView {
  
  var categoryViews: [UIView] = []

  lazy var pageCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal

    let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    cv.isPagingEnabled = true
    cv.showsHorizontalScrollIndicator = false
    cv.backgroundColor = .white
    addSubview(cv)
    cv.register(cell: CategoryTabBarCell.self)
    cv.dataSource = self.self
    cv.delegate = self.self
    return cv
  }()

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .green
  }

}

extension CategoryView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  // MARK: - UICollectionViewDataSource
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryViews.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    // 여기서부터 다시 시작. 임시로 return 해놓기
    return UICollectionViewCell()
  }
  
  // MARK: - UICollectionViewDelegateFlowLayout
  
}
