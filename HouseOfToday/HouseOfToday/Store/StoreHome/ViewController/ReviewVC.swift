//
//  ReviewVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension ReviewVC {
  static var sort: Notification.Name {
    return Notification.Name("sort")
  }
}

final class ReviewVC: UIViewController {

  private lazy var folwLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = Metric.ReviewCellSize
    layout.minimumLineSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 0, left: Metric.marginX, bottom: 0, right: Metric.marginX)
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: folwLayout)
    colV.register(cell: ReviewCell.self)
    colV.register(ReviewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ReviewHeaderView")
    colV.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    colV.dataSource = self
    colV.delegate = self
    view.addSubview(colV)
    return colV
  }()

  let notiCenter = NotificationCenter.default

  private var sortedReviewList: [ProductDetail.Review] = [] {
    didSet {
      guard !sortedReviewList.isEmpty else { return print("sortedReviewList is empty")}

      collectionView.reloadData()
    }
  }

  private var reviewList: [ProductDetail.Review] = []

  public var productDetailData: ProductDetail? {
    didSet {
      guard let info = productDetailData else {return print("productDetailData is nil")}

      let reviewCount = "\(formetter(price: info.reviewCount))"
      reviewList = info.review
      //      starPointLabel.text = "\(info.starAvg)"
      //      reviewCountLabel.text = reviewCount
      //      purchaseSatisfactionLabel.text = "\(reviewCount)의 구매만족도"
      //      showTotalReviewButton.setTitle("\(reviewCount)개 리뷰 전체보기 ", for: .normal)

      sortedReviewList = reviewList.sorted(by: { $0.starScore > $1.starScore })

    }
  }

  deinit {
    notiCenter.removeObserver(self,
                              name: ReviewVC.sort,
                              object: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    notiCenter.addObserver(self,
                           selector: #selector(sortReviewList(_:)),
                           name: ReviewVC.sort,
                           object: nil)

    collectionViewAutolayout()
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }
  private func configureNaviBar() {
    self.title = "리뷰보기"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - configure
  private func collectionViewAutolayout() {

    if collectionView.translatesAutoresizingMaskIntoConstraints {
      collectionView.snp.makeConstraints {
        $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        $0.leading.trailing.equalToSuperview()
        $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      }
    }
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  @objc private func sortReviewList(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: String],
      let sort = userInfo["sortNumber"] else {
        return print("fail down casting: sortReviewList")
    }

//    print("print success \(sort)")
    switch sort {
    case "0":
      sortedReviewList = reviewList.sorted(by: { $0.starScore > $1.starScore })
    case "1":
      sortedReviewList = reviewList.sorted(by: { $0.created > $1.created })
    case "2":
      sortedReviewList = reviewList.sorted(by: { $0.starScore < $1.starScore })
    default:
      break
    }

  }
}

extension ReviewVC: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sortedReviewList.count
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ReviewHeaderView", for: indexPath) as! ReviewHeaderView

    header.productDetailData = productDetailData
    return header
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(ReviewCell.self, indexPath)
    guard let data = productDetailData else { return cell}
    cell.reviewList = sortedReviewList[indexPath.item]
    cell.reviewTitle.text = "[\(data.brandName)] \(data.name)"
    cell.optionLabel.text = "선택: \(data.productOption[Int.random(in: 0 ..< data.productOption.count)].name)"
    return cell
  }

}

extension ReviewVC: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    // FIXME: - cell change
  }
}

extension ReviewVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

//    if section == 0 {
      return CGSize(width: UIScreen.main.bounds.width, height: 200)
//    } else {
//      return CGSize(width: UIScreen.main.bounds.width, height: DefaultHeaderView.height)
//    }
  }
}
