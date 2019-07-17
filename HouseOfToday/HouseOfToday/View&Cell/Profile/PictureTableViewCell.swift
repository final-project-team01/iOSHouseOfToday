//
//  PictureCollectionViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {

  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: frame,
                                             collectionViewLayout: layout)

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCollectionView()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(cell: PictureCollectionViewCell.self)

    collectionView.backgroundColor = .clear
    addSubview(collectionView)

    layout.minimumLineSpacing = 15
    layout.minimumInteritemSpacing = 15
    layout.itemSize = CGSize(width: 100, height: 100)

  }

  private func setupConstraints() {
    collectionView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(20)
    }
  }

}

extension PictureTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   return 9
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.identifier, for: indexPath) as! PictureCollectionViewCell

    return cell

  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }

}
