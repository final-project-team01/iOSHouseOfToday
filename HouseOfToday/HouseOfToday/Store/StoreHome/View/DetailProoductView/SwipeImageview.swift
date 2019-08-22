//
//  SwipeImageview.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

final class SwipeImageview: UIView {
  // MARK: - Property
  static var height = UIScreen.main.bounds.width

  var pageNumber: Int = 10

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal

    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.register(cell: SwipeImageCell.self)
    colV.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    colV.dataSource = self
    colV.delegate = self
    colV.isPagingEnabled = true
    colV.showsHorizontalScrollIndicator = false

    return colV
  }()

  private var thumnailImages: [UIImage] = [] {
    didSet {
      guard thumnailImages.count + failImageCount == imageUrls.count else { return print("imageUrls not same")}

      collectionView.reloadData()
    }
  }

  private var failImageCount = 0

  public var imageUrls: [String] = [] {
    willSet {

      guard !newValue.isEmpty else { return }

      let downloader = ImageDownloader.default

      newValue.forEach {
        if let url = URL(string: $0) {

          downloader.downloadImage(with: url) { result in
            switch result {
            case .success(let value):
              self.thumnailImages.append(value.image)
            case .failure(let error):
              print(error)
              self.failImageCount += 1
            }
          }
        } else { self.failImageCount += 1}
      }
    }
  }

  private var timer = Timer()
  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
//    setupTimer()
    addSubview(collectionView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - configure
  override func updateConstraints() {
    super.updateConstraints()
    //    print("updateConstraints")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    scrollViewAutoLayout()
  }

  private func scrollViewAutoLayout() {
    if collectionView.translatesAutoresizingMaskIntoConstraints {

      collectionView.snp.makeConstraints {
        $0.edges.equalToSuperview()
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
//    let itemAt = pageControl.currentPage + 1 < 10 ? pageControl.currentPage + 1 : 0
//    collectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
  }

}

// MARK: - UICollectionViewDataSource
extension SwipeImageview: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    print("pageNumber: \(imageUrls.count)")
    return thumnailImages.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(SwipeImageCell.self, indexPath)
    cell.imageView.image = thumnailImages[indexPath.item]
    return cell
  }
}

// MARK: - UICollectionViewDelegate
extension SwipeImageview: UICollectionViewDelegate {

  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? DealOfTodayCell {
      cell.stopDownloadImage()
    } else if let cell = cell as? PopularityProductCell {
      cell.stopDownloadImage()
    }
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    let itemAt = Int(targetContentOffset.pointee.x / frame.width + 0.5)

//    collectionView.selectItem(at: IndexPath(item: itemAt, section: 0), animated: true, scrollPosition: .centeredHorizontally)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SwipeImageview: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: UIScreen.main.bounds.width, height: SwipeImageview.height)
  }

}
