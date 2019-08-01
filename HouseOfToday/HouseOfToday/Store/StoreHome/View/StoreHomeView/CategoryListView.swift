//
//  CategoryView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 22/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CategoryListView: UIView {

  // MARK: - Property
  static var height = (UIScreen.main.bounds.width / 4) * 3

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private let notiCenter = NotificationCenter.default

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4, height: UIScreen.main.bounds.width / 4)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    colV.register(cell: CategoryListCell.self)
    addSubview(colV)
    return colV
  }()

  public var categoryList: [CategoryList] = [] {
    didSet {
      guard !categoryList.isEmpty else { return print( "categoryList fail")}
      DispatchQueue.main.async { [weak self] in
        self?.collectionView.reloadData()
      }
    }
  }

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
//    fetchCategoryList()
//    if collectionView.translatesAutoresizingMaskIntoConstraints {
//      collectionView.snp.makeConstraints {
//        $0.edges.equalToSuperview()
//      }
//    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if collectionView.translatesAutoresizingMaskIntoConstraints {
      collectionView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }

  // MARK: - Fetch Category List
//  private func fetchCategoryList() {
//    print("fetchCategoryList Start")
//    service.fetchCategoryList { result in
//      switch result {
//      case .success(let list):
//        print("success!!! List Count: \(list.count)")
//
//        self.categoryList = list
//      case .failure(let error):
//
//        print("fetchCategoryList Error: \(error.localizedDescription)")
//      }
//    }
//  }
}

// MARK: - UICollectionViewDataSource
extension CategoryListView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.categoryList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeue(CategoryListCell.self, indexPath)
    cell.layer.borderColor = UIColor.lightGray.cgColor
    cell.layer.borderWidth = 0.25
    cell.cateforyLabel.text = categoryList[indexPath.item].name

    return cell
  }
}

extension CategoryListView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? CategoryListCell,
      let url = URL(string: categoryList[indexPath.item].imageURL) {

      cell.categoryImageView.kf.setImage(with: url,
                                         placeholder: nil,
                                         options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                         progressBlock: nil) { (_) in
      }
    }
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    let categoryId = categoryList[indexPath.item].id

    notiCenter.post(name: StoreVC.presentProductList, object: nil, userInfo: ["categoryId": categoryId])
  }
}
