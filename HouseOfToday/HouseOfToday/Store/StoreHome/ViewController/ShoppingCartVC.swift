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
  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()

    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

    return colV
  }()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    collectionViewAutolayout()
  }

  // MARK: - configure
  private func collectionViewAutolayout() {
    collectionView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

}
