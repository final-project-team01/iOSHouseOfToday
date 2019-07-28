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

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

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

  var best100: [RankingList.Body] = [] {

    didSet {
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }

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

  private func getAttributeString(rate: String) -> NSMutableAttributedString {
    let mutableAttributedString = NSMutableAttributedString()

    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10),
      .foregroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    ]
    let attributeString = NSMutableAttributedString(string: "★",
                                                    attributes: attributes)
    let attributes1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 10, weight: .bold),
      .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    ]
    let attributeString1 = NSMutableAttributedString(string: rate,
                                                     attributes: attributes1)
    mutableAttributedString.append(attributeString)
    mutableAttributedString.append(attributeString1)

    return mutableAttributedString
  }

}

extension RankingTableCell: UICollectionViewDataSource, UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    let count = best100.count > 9 ? 9 : best100.count
    return count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeue(RankingCollectionCell.self, indexPath)
    cell.countLabel.text = "\(indexPath.item + 1)"
    cell.productNameLabel.text = "\(best100[indexPath.item].productName)"
    cell.ratingStarRankLabel.attributedText = getAttributeString(rate: "\(best100[indexPath.item].starAvg)")
    cell.reviewCountLabel.text = "리뷰 \(best100[indexPath.item].reviewCount)"

    if let url = URL(string: best100[indexPath.item].thumnailImages[0].image) {
      cell.setImage(thumnailUrl: url)
    }

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
