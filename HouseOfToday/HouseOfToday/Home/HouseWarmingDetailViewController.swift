//
//  HouseWarmingDetailViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

class HouseWarmingDetailViewController: UIViewController {

  // MARK: - Properties
  private lazy var detailCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.dataSource = self
    cv.delegate = self
    cv.register(cell: CoverImageCollectionCell.self)
    cv.register(cell: TitleCollectionCell.self)
    cv.register(cell: ContentCollectionCell.self)
    cv.backgroundColor = .red
    view.addSubview(cv)
    return cv
  }()

  // MARK: - ViewController LifeCyle
  override func viewDidLoad() {
    super.viewDidLoad()
    makeConstraints()

    DataManager.shard.service.fetchHouseWarmingDetail(with: 1) {
      [weak self] result in
      switch result {
      case .success(let detail):
        print("success")
        print("detail : ", detail)
      case .failure(let error):
        logger(error.localizedDescription)
      }
    }
  }

  private func makeConstraints() {
    self.detailCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}

// MARK: - CollectionView DataSource
extension HouseWarmingDetailViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(CoverImageCollectionCell.self, indexPath)
    return cell
  }

}
// MARK: - Collection FlowLayout and Delegate
extension HouseWarmingDetailViewController: UICollectionViewDelegateFlowLayout {

}
