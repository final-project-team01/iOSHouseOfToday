//
//  RankingTableCell.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit
import SnapKit

class RankingTableCell: UITableViewCell {

  private lazy var layout: UICollectionViewFlowLayout = {
  let layout = UICollectionViewFlowLayout()
  layout.scrollDirection = .vertical
  layout.sectionHeadersPinToVisibleBounds = false
  layout.sectionFootersPinToVisibleBounds = false
  return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
    collectionView.register(cell: RankingCollectionCell.self)
    addSubview(collectionView)
    return collectionView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    cellAutolayout()
    backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func cellAutolayout() {
    if translatesAutoresizingMaskIntoConstraints {
      collectionView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
}

extension RankingTableCell: UICollectionViewDataSource, UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return 9
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeue(RankingCollectionCell.self, indexPath)
    cell.countLabel.text = "\(indexPath.item + 1)"

    return cell

  }

}

extension RankingTableCell: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return JMetric.rankkingCellSize
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return JMetric.lineSpacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return JMetric.itemSpacing
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return JMetric.inset
  }

}
