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
    imageView.image = UIImage(named: "ahhh")
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
//    collectionView.dataSource = self
//    collectionView.delegate = self
//    collectionView.register(cell: PictureCollectionViewCell.self)
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

//  private lazy var scrapButton: UIButton = {
//    let button = UIButton(type: .custom)
//    button.setTitle("author", for: .normal)
//    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
//    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
//    //    button.addTarget(self, action: #selector(didTapReplyButton(_:)), for: .touchUpInside)
//    addSubview(button)
//    return button
//  }()

  // +버튼

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

    categoryLabel.snp.makeConstraints { make in
      make.top.leading.equalToSuperview()
      make.bottom.equalTo(productImageView.snp.top)
    }

    createdLabel.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview()
      make.bottom.equalTo(productImageView.snp.top)
    }

    productImageView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
    }

  }

}
