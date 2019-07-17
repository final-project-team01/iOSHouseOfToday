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

  private lazy var categoryButtonArray: [UIButton] = {
    var btnArray = Array<UIButton>()
    for _ in 0..<(categoryList?.count ?? 0) {
      btnArray.append(UIButton(type: .custom))
      if let last = btnArray.last {
        last.setImage(UIImage(named: "interiorQuestion"), for: .normal)
        last.setTitle("test", for: .normal)
        last.setTitleColor(.darkGray, for: .normal)
        last.layer.borderColor = UIColor.lightGray.cgColor
        last.layer.borderWidth = 0.5
        addSubview(last)
      }
    }
    return btnArray
  }()

  private lazy var swipeView: SwipeView = {
    let view = SwipeView()
    view.pageNumber = 10
    addSubview(view)
    return view
  }()

  private var timer = Timer()

  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]

  private var categoryList: [CategoryList]?

  override init(frame: CGRect) {
    super.init(frame: frame)

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

  private func fetchProductCategoryList() {
    service.fetchProductCategoryList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")
        self.categoryList = list
      case .failure(let error):
        print("fetchProductCategoryList Error: \(error.localizedDescription)")
      }
    }
  }

  override func updateConstraints() {
    super.updateConstraints()
    print("updateConstraints")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews")

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

    if swipeView.translatesAutoresizingMaskIntoConstraints {
      swipeView.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.2)
      }
    }
  }

  private func categoryListButtonsAutolayout() {

    for categoryButton in categoryButtonArray {
      categoryButton.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom)
        $0.leading.equalToSuperview()
        $0.width.equalToSuperview().multipliedBy(0.33)
        $0.height.equalTo(categoryButton.snp.width)
      }
    }

    setupCategoryListButtonImageTitleEdgeInset()
  }

  private func setupCategoryListButtonImageTitleEdgeInset() {
    let spacing: CGFloat = 6.0
//    if let imageSize = categoryButton.imageView?.frame.size {
//      categoryButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
//    }
//    if let titleSize = categoryButton.titleLabel?.frame.size {
//      categoryButton.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
//    }
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
