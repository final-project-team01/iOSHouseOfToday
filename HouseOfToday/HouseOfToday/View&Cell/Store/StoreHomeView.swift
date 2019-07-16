//
//  StoreHomeView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class StoreHomeView: UIView {

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private let pageNumber: Int = 10

  private lazy var pageControl: UIPageControl = {
    let page = UIPageControl()
    page.currentPage = 0
    page.numberOfPages = pageNumber
    page.hidesForSinglePage = true
    page.currentPageIndicatorTintColor = .white
    page.pageIndicatorTintColor = .darkGray
//    page.contentScaleFactor = 0.5// = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 10)
    addSubview(page)
    page.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    return page
  }()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 1
    layout.minimumInteritemSpacing = 1
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 5)
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Item")
    colV.backgroundColor = .black
    colV.dataSource = self
    colV.delegate = self
    addSubview(colV)
    return colV
  }()

  private lazy var categoryButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "interiorQuestion"), for: .normal)
    btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    btn.setTitle("test", for: .normal)
    btn.setTitleColor(.darkGray, for: .normal)
    btn.titleEdgeInsets = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 30)
    btn.layer.borderColor = UIColor.black.cgColor
    btn.layer.borderWidth = 2
    addSubview(btn)
    return btn
  }()

  private var timer = Timer()

  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]

  override init(frame: CGRect) {
    super.init(frame: frame)

    service.fetchProductCategoryList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")
      case .failure(let error):
        print("fetchProductCategoryList Error: \(error.localizedDescription)")
      }
    }

    setupTimer()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    timer.fire()  // scheduledTimer 해제
  }

  private func setupTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self] (_) in
      guard let `self` = self else { return }

      self.nextImageShowing()
    })
  }

  // 5초에 한번 호출
  private func nextImageShowing() {
    let itemAt = pageControl.currentPage + 1 < 10 ? pageControl.currentPage + 1 : 0
    collectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    scrollViewAutoLayout()

    categoryListButtonsAutolayout()
  }

  private func scrollViewAutoLayout() {
    if collectionView.translatesAutoresizingMaskIntoConstraints {

      collectionView.snp.makeConstraints {
        $0.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.2)
      }

      pageControl.snp.makeConstraints {
        $0.bottom.equalTo(collectionView.snp.bottom).offset(0)
        $0.leading.equalToSuperview().offset(5)
      }
    }
  }

  private func categoryListButtonsAutolayout() {
    categoryButton.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom)
      $0.leading.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.33)
      $0.height.equalTo(categoryButton.snp.width)

    }
  }
}

extension StoreHomeView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pageNumber
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath)
    cell.backgroundColor = colorList[indexPath.item]
    return cell
  }
}

extension StoreHomeView: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let itemAt = Int(targetContentOffset.pointee.x / frame.width + 0.5)

    pageControl.currentPage = itemAt
    collectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    pageControl.currentPage = indexPath.item
  }
}
