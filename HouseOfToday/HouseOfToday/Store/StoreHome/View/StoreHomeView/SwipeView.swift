//
//  SwipeView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class SwipeView: UIView {

  // MARK: - Property
  static var height = UIScreen.main.bounds.height / 5

  var pageNumber: Int = 7

  private lazy var pageControl: UIPageControl = {
    let page = UIPageControl()
    page.currentPage = 0
    page.numberOfPages = 7
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
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: StoreHomeHeaderView.height)
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
//    colV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Item")
    colV.register(cell: SwipeCell.self)
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    colV.isPagingEnabled = true
    colV.showsHorizontalScrollIndicator = false
    addSubview(colV)
    return colV
  }()

  private var timer = Timer()
  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    pageNumber = 0
    self.setupTimer()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    timerFire()//timer.fire()  // scheduledTimer 해제
  }

  // MARK: - configure
  override func updateConstraints() {
    super.updateConstraints()
//    print("updateConstraints")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
//    print("layoutSubviews")

    scrollViewAutoLayout()
  }

  private func scrollViewAutoLayout() {
    if collectionView.translatesAutoresizingMaskIntoConstraints {

      collectionView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }

      pageControl.snp.makeConstraints {
        $0.bottom.equalTo(collectionView.snp.bottom)
        $0.leading.equalToSuperview().offset(5)
      }
    }
  }

  // MARK: - Swipe Timer
  private func setupTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self] (_) in
      guard let `self` = self else { return }

      self.nextImageShowing()
    })
  }

  // 5초에 한번 호출
  private func nextImageShowing() {
    let itemAt = pageControl.currentPage + 1 < 7 ? pageControl.currentPage + 1 : 0
    collectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    pageControl.currentPage = itemAt
  }

  public func timerFire() {
    timer.fire()  // scheduledTimer 해제
  }
}

// MARK: - UICollectionViewDataSource
extension SwipeView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 7
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Item", for: indexPath)
    let cell = collectionView.dequeue(SwipeCell.self, indexPath)
    cell.imageView.image = UIImage(named: "banner\(indexPath.item + 1)")
//    cell.backgroundColor = colorList[indexPath.item]
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension SwipeView: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let itemAt = Int(targetContentOffset.pointee.x / frame.width + 0.5)

    pageControl.currentPage = itemAt
//    collectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

//    pageControl.currentPage = indexPath.item
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SwipeView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: UIScreen.main.bounds.width, height: SwipeView.height)
  }

}
