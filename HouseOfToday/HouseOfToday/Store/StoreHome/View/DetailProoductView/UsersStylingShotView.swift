//
//  UserStylingShotView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 24/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class UsersStylingShotView: UIView {

  // MARK: - Property

  static var height = Metric.StylingShotBigCellSize.height + Metric.StylingShotSmallCellSize.height + 120

  var pageNumber: Int = 10

  private let colorList: [UIColor] = [.red, .blue, .black, .brown, .cyan, .darkGray, .green, .magenta, .orange, .yellow]

  private lazy var usersStylingShotLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "유저들의 스타일링샷 "
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    addSubview(label)
    return label
  }()

  private lazy var shotCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    label.textColor =  #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var showTotalShotButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("전체보기", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    addSubview(btn)
    return btn
  }()

  private lazy var bigerFlowLayout: CenteringFlowLayout = {
    let layout = CenteringFlowLayout()
    layout.minimumInteritemSpacing = Metric.marginX / 3
    layout.scrollDirection = .horizontal
    layout.sectionInset = Metric.stylingInset
    layout.itemSize = Metric.StylingShotBigCellSize
    return layout
  }()

  private lazy var bigerCollectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: bigerFlowLayout)
    colV.tag = 0
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    colV.decelerationRate = UIScrollView.DecelerationRate.fast
    colV.register(cell: UserStylingDetailCell.self)
    addSubview(colV)
    return colV
  }()

  private lazy var SmallerFlowLayout: CenteringFlowLayout = {
    let layout = CenteringFlowLayout()
    layout.minimumLineSpacing = Metric.marginX / 3
    layout.scrollDirection = .horizontal
    layout.sectionInset = Metric.stylingInset
    layout.itemSize = Metric.StylingShotSmallCellSize
    return layout
  }()

  private lazy var smallerCollectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: SmallerFlowLayout)
    colV.tag = 1
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    colV.decelerationRate = UIScrollView.DecelerationRate.fast
    colV.register(cell: UserStylingImageCell.self)
    addSubview(colV)
    return colV
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: CGRect.zero)
    backgroundColor = .white

    fetchPictureList()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    autolayoutViews()
  }

  private func autolayoutViews() {

    if usersStylingShotLabel.translatesAutoresizingMaskIntoConstraints {
      usersStylingShotLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY * 2)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if shotCountLabel.translatesAutoresizingMaskIntoConstraints {
      shotCountLabel.snp.makeConstraints {
        $0.centerY.equalTo(usersStylingShotLabel.snp.centerY)
        $0.leading.equalTo(usersStylingShotLabel.snp.trailing)
      }
    }

    if showTotalShotButton.translatesAutoresizingMaskIntoConstraints {
      showTotalShotButton.snp.makeConstraints {
        $0.centerY.equalTo(usersStylingShotLabel.snp.centerY)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
      }
    }

    if bigerCollectionView.translatesAutoresizingMaskIntoConstraints {
      bigerCollectionView.snp.makeConstraints {
        $0.top.equalTo(usersStylingShotLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(Metric.StylingShotBigCellSize.height)
      }
    }

    if smallerCollectionView.translatesAutoresizingMaskIntoConstraints {
      smallerCollectionView.snp.makeConstraints {
        $0.top.equalTo(bigerCollectionView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(Metric.StylingShotSmallCellSize.height)
      }
    }
  }

  private var pictureList: [PictureModel] = [] {
    didSet {
      DispatchQueue.main.async {
        self.bigerCollectionView.reloadData()
        self.smallerCollectionView.reloadData()
      }
    }
  }

  private let service: HouseOfTodayServiceType = HouseOfTodayService()
  public func fetchPictureList() {
    service.fetchPictureList { result in
      switch result {
      case .success(let product):
        print("success!!! fetchPictureList")
        self.pictureList = product

      case .failure(let error):

        print("fetchPictureList Error: \(error.localizedDescription)")
      }
    }
  }

}

// MARK: - UICollectionViewDataSource
extension UsersStylingShotView: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pictureList.count//colorList.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    if bigerCollectionView == collectionView {
      let cell = collectionView.dequeue(UserStylingDetailCell.self, indexPath)
//      cell.backgroundColor = colorList[indexPath.item]

      if let url = URL(string: pictureList[indexPath.item].image),
        let authorUrl = URL(string: pictureList[indexPath.item].authorProfileImage) {

        cell.thumnailImageView.kf.setImage(with: url,
                                           placeholder: nil,
                                           options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                           progressBlock: nil)

        cell.userImageView.kf.setImage(with: authorUrl,
                                       placeholder: nil,
                                       options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                       progressBlock: nil)
        cell.userNameLabel.text = "\(pictureList[indexPath.item].author)"
        cell.totalShotCountLabel.text = "\(indexPath.item+1)/\(pictureList.count)"
      }

      return cell
    }

//    if smallerCollectionView == collectionView {
    let cell = collectionView.dequeue(UserStylingImageCell.self, indexPath)
    if let url = URL(string: pictureList[indexPath.item].image) {
      cell.thumnailImageView.kf.setImage(with: url,
                                         placeholder: nil,
                                         options: [.transition(.fade(1)), .loadDiskFileSynchronously],
                                         progressBlock: nil)
    }
    return cell
//    }
  }
}

extension UsersStylingShotView: UICollectionViewDelegate {

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    print(scrollView.contentOffset)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    if collectionView == bigerCollectionView {
      print("selectItem2: ", indexPath.item)
//

      NotificationCenter.default.post(name: ProductDetailVC.presentPicDetail, object: nil, userInfo: ["picDetail": Int(indexPath.item + 1)])

    } else if collectionView == smallerCollectionView {
      bigerCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
      collectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
    }

  }

  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if let cell = cell as? UserStylingDetailCell {
      cell.thumnailImageView.kf.cancelDownloadTask()
      cell.userImageView.kf.cancelDownloadTask()
    }

    if let cell = cell as? UserStylingImageCell {
      cell.thumnailImageView.kf.cancelDownloadTask()
//      cell.userImageView.kf.cancelDownloadTask()
    }
  }

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    guard let collectionView = scrollView as? UICollectionView ,
          collectionView.tag == 0
    else { return print("scrollView as? UICollectionView fail!!!")}

    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
    var offset = targetContentOffset.pointee
    let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
    var roundedIndex = round(index)

    if scrollView.contentOffset.x > targetContentOffset.pointee.x {
      roundedIndex = floor(index)
    } else {
      roundedIndex = ceil(index)
    }

    offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
    targetContentOffset.pointee = offset

    let cellPosistion = CGPoint(x: offset.x + CGFloat(UIScreen.main.bounds.width/2), y: offset.y)

    if let indexPath = collectionView.indexPathForItem(at: cellPosistion) {
       smallerCollectionView.scrollToItem(at: indexPath, at: [.centeredHorizontally], animated: true)
    }
  }
}

extension UsersStylingShotView: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    if bigerCollectionView == collectionView {
      return Metric.StylingShotBigCellSize
    } else {
      return Metric.StylingShotSmallCellSize
    }
  }

}
