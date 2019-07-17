//
//  SwipeView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SwipeView: UIButton {

  var pageNumber: Int = 10

  private lazy var pageControl: UIPageControl = {
    let page = UIPageControl()
    page.currentPage = 0
    page.numberOfPages = pageNumber
    page.hidesForSinglePage = true
    page.currentPageIndicatorTintColor = .white
    page.pageIndicatorTintColor = .darkGray
    addSubview(page)
    page.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    return page
  }()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 5)
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Item")
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    addSubview(colV)
    return colV
  }()

  private var timer = Timer()
  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]

  override init(frame: CGRect) {
    super.init(frame: frame)
    pageNumber = 0
    self.setupTimer()
  }

//  convenience init(pageCount: Int) {
//    self.init(frame: CGRect.zero)
//    self.pageNumber = pageCount
////    setupTimer()
//  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    timer.fire()  // scheduledTimer 해제
  }

  override func updateConstraints() {
    super.updateConstraints()
    print("updateConstraints")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews")

    scrollViewAutoLayout()

  }

  private func scrollViewAutoLayout() {
    if collectionView.translatesAutoresizingMaskIntoConstraints {

      collectionView.snp.makeConstraints {
//        $0.top.equalTo(self.snp.topMargin)
//        $0.leading.trailing.equalToSuperview()
//        $0.height.equalToSuperview()//.multipliedBy(0.2)
        $0.edges.equalToSuperview()
      }

      pageControl.snp.makeConstraints {
        $0.bottom.equalTo(collectionView.snp.bottom)//.offset(0)
        $0.leading.equalToSuperview().offset(5)
      }
    }
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

}

extension SwipeView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pageNumber
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath)
    cell.backgroundColor = colorList[indexPath.item]
    return cell
  }
}

extension SwipeView: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let itemAt = Int(targetContentOffset.pointee.x / frame.width + 0.5)

    pageControl.currentPage = itemAt
    collectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    pageControl.currentPage = indexPath.item
  }
}
