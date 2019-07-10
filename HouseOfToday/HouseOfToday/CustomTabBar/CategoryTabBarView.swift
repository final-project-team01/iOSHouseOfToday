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
  
  /// 스크롤 가능한지 값 설정하기
  /// 마이페이지는 false 로 설정하고
  /// 홈은 true 로 설정해야 한다.
  var isScrollEnabled: Bool {
    get {
      return categoryTabBarCollectionView.isScrollEnabled
    }
    set {
      categoryTabBarCollectionView.isScrollEnabled = newValue
    }
  }

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

  // MARK: - UICollectionViewDelegateFlowLayout
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let widthSize = self.frame.width / CGFloat(menuTitles.count)

    // CollectionView 의 Cell Size 결정할 때 indicatorBar 의 layout 도 같이 잡아준다.
    indicatorBar.snp.makeConstraints {
      $0.width.equalTo(widthSize)
    }
    return CGSize(width: widthSize, height: self.frame.height)
  }

  // MARK: - UICollectionViewDelegate
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    let widthSize = self.frame.width / CGFloat(menuTitles.count)

    indicatorBar.snp.updateConstraints {
      $0.leading.equalTo( widthSize * CGFloat(indexPath.item) )
    }
    UIView.animate(withDuration: 0.5,
                   delay: 0,
                   usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 1,
                   options: .curveEaseInOut,
                   animations: {
                    self.layoutIfNeeded()
    },
                   completion: nil)
  }

}
