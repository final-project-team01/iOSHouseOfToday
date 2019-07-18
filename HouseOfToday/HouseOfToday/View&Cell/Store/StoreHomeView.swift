//
//  StoreHomeView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class StoreHomeView: UIView {

  // MARK: - Property
  var pageNumber: Int = 3
  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()

    let margin: CGFloat = self.safeAreaInsets.bottom
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2 - 25, height: UIScreen.main.bounds.height / 2 - margin)
//    layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    return layout
  }()

  private lazy var productCollectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.register(StoreHomeHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoreHomeHeaderView")
    colV.register(DefaultHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DefaultHeaderView")
    colV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Item")
    colV.backgroundColor = .yellow
    colV.dataSource = self
    colV.delegate = self
    addSubview(colV)
    return colV
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }

  override func updateConstraints() {
    super.updateConstraints()
//    print("updateConstraints")
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

}

// MARK: - UICollectionViewDataSource
extension StoreHomeView: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 4
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

    if indexPath.section == 0 {
      if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StoreHomeHeaderView", for: indexPath) as? StoreHomeHeaderView {

        return header
      }
    } else {
      if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DefaultHeaderView", for: indexPath) as? DefaultHeaderView {

        if indexPath.section == 1 {
          header.hideButton(false)
        } else {
          header.hideButton(true)
        }

        return header
      }
    }

    fatalError("Unable to Dequeue Reusable Supplementary View")
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 0
    default:
      break
    }
    return pageNumber
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath)
    cell.backgroundColor = colorList[indexPath.item]
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension StoreHomeView: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

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

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 1 {
      return CGSize(width: UIScreen.main.bounds.width - 25, height: UIScreen.main.bounds.height / 5)
    } else if indexPath.section == 2 {
      return CGSize(width: UIScreen.main.bounds.width/2 - 25, height: UIScreen.main.bounds.height / 10)
    } else {
      return CGSize(width: UIScreen.main.bounds.width/2 - 25, height: UIScreen.main.bounds.height / 2 - self.safeAreaInsets.bottom)
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    if section == 0 {
      return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    } else {
      return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
  }
}
