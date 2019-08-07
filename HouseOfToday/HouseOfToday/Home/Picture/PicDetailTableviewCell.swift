//
//  PicDetailTableviewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 06/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PicDetailTableviewCell: UITableViewCell {

  private lazy var categoryLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "30평대 | 내추럴 | 스타일아파트"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var createdLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1일전"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.image = UIImage(named: "test")
    //    imageView.contentMode = .scaleAspectFit
    addSubview(imageView)
    return imageView
  }()

  // MARK: - collectionview
  private lazy var layout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return layout
  }()

  internal lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(cell: PictureCollectionViewCell.self)
    collectionView.backgroundColor = .blue
    addSubview(collectionView)
    return collectionView
  }()

  private lazy var picBodyTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "sdgfdhgjhghgjfdhdgfssfdshfdjgfhkgjhklkjhkgfjdgs"
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    addSubview(label)
    return label
  }()

  // +버튼

  // MARK: - getData

  public var picDetailInfo: PicDetailModel? {
    didSet {
      guard let info = picDetailInfo else {return logger()}
      categoryLabel.text = info.category
      //등등 넣기

      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }

      //collectionView로 들어가는거 ㄱㄱ
    }
  }

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    makeConstraints()
    backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func makeConstraints() {

    //    categoryLabel.snp.makeConstraints { make in
    //      make.top.leading.equalToSuperview().inset(15)
    //      make.bottom.equalTo(productImageView.snp.top).inset(-10)
    //    }
    //
    //    createdLabel.snp.makeConstraints { make in
    //      make.top.trailing.equalToSuperview().inset(15)
    //      make.bottom.equalTo(productImageView.snp.top).inset(-10)
    ////    }
    //
    //    productImageView.snp.makeConstraints { make in
    //      make.leading.trailing.equalToSuperview()
    //      make.bottom.equalTo(collectionView.snp.top)
    //    }
    //
    //    collectionView.snp.makeConstraints { make in
    //      make.leading.trailing.equalToSuperview()
    //      make.bottom.equalToSuperview().inset(30)
    //      make.height.equalTo(100)
    //    }

    productImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      //      make.width.equalTo(500)
      //      make.height.equalTo(100)
    }
  }

  public func setMainProductImage(thumnailUrl: URL) {

    productImageView.kf.setImage(with: thumnailUrl,
                                 placeholder: nil,
                                 options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                 progressBlock: nil) { (_) in
    }
  }

  //stop download
  public func stopDownloadImage() {
    productImageView.kf.cancelDownloadTask()
  }
}

extension PicDetailTableviewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(PictureCollectionViewCell.self, indexPath)
    return cell //셀 재사용으로 해볼까?
  }

}
