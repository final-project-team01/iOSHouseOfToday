//
//  RankingHorizontalCell.swift
//  HouseOfToday
//
//  Created by Daisy on 25/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class RankingHorizontalCell: UITableViewCell {

  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
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
    collectionView.register(cell: MoreCollectionCell.self)
    collectionView.showsHorizontalScrollIndicator = false
    addSubview(collectionView)
    return collectionView
  }()

  var offset: CGFloat {
    get {
      return collectionView.contentOffset.x
    }
    set {
      collectionView.contentOffset.x = newValue
    }
  }

  var productList: [RankingList.Body] = [] {
    didSet {
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super .init(style: style, reuseIdentifier: reuseIdentifier)
    cellAutolayout()
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

extension RankingHorizontalCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 11
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    switch indexPath.item {
    case 10:
      let cell = collectionView.dequeue(MoreCollectionCell.self, indexPath)
      return cell
    default:
      let cell = collectionView.dequeue(RankingCollectionCell.self, indexPath)
      cell.countLabel.text = "\(indexPath.item + 1)"
      cell.productNameLabel.text = "\(productList[indexPath.item].productName)"
      cell.ratingStarRankLabel.attributedText =  getAttributeString(rate: "\(productList[indexPath.item].starAvg)")
      cell.reviewCountLabel.text = "리뷰 \(productList[indexPath.item].reviewCount)"

      if let url = URL(string: productList[indexPath.item].thumnailImages[0].image) {
        cell.setImage(thumnailUrl: url)
      }

      return cell
    }
  }

}

extension RankingHorizontalCell: UICollectionViewDelegateFlowLayout {

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
    return JMetric.rankingHorizontalInset
  }

}
