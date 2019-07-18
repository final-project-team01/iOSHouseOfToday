//
//  PictureCollectionViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {

  private enum UI {
    static let edge: CGFloat = 15
    static let itemsInLine: CGFloat = 3
    static let itemSpacing: CGFloat = 1.0
    static let lineSpacing: CGFloat = 1.0
  }

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "사진"
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 18)
    addSubview(label)
    return label
  }()

  private lazy var subTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var rightSideCellButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("전체보기", for: .normal)
    button.backgroundColor = .clear
    button.setTitleColor( #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.contentHorizontalAlignment = .right
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.addTarget(action: #selector(viewAllPhoto))
    addSubview(button)
    return button
  }()

  @objc func viewAllPhoto() {

  }

  // FIXME: - 이미지 추가
  // FIXME: - imagePicker
  private lazy var uploadPictureButton: UIButton = {
    let button = UIButton(type: .custom)
//    button.setTitle("사진올리기", for: .normal)
//    button.setTitleColor( #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
//    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.setBackgroundImage(UIImage(named: "camera"), for: .normal)
    button.layer.borderColor = UIColor.darkGray.cgColor
    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    addSubview(button)
    return button
  }()

  private lazy var titleStackView: UIStackView = {
    let titleStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
    titleStackView.axis = .horizontal
    titleStackView.alignment = .fill
    titleStackView.distribution = .equalSpacing
    titleStackView.spacing = 10
    addSubview(titleStackView)
    return titleStackView
  }()

  //layout
  let layout = UICollectionViewFlowLayout()

  lazy private var collectionView: UICollectionView = {
    //view
    let collectionView = UICollectionView(frame: frame,
                                          collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(cell: PictureCollectionViewCell.self)
    collectionView.backgroundColor = .clear

    addSubview(collectionView)
    return collectionView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCollectionViewLayout()
    setupConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super .layoutSubviews()
    self.centerButtonImageAndTitle(button: uploadPictureButton)
  }

  private func centerButtonImageAndTitle (button: UIButton) {
    let spacing: CGFloat = 6.0
    let imageSize = button.imageView!.frame.size
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)

    let titleSize = button.titleLabel!.frame.size
    button.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
  }

  func setupCollectionViewLayout() {
    layout.minimumInteritemSpacing = UI.itemSpacing
    layout.minimumLineSpacing = UI.lineSpacing

    let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1)
    let edgeSpacing = UI.edge * 2
    let width = (UIScreen.main.bounds.width - itemSpacing - edgeSpacing) / 3

    layout.itemSize = CGSize(width: width, height: width ) //이렇게 하면 다이나믹하게는 안됨. 초기화 할 때 사이즈 고정
  }

  private func setupConstraints() {
    titleStackView.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(20)
      make.leading.equalToSuperview().inset(UI.edge)
      make.trailing.lessThanOrEqualTo(rightSideCellButton.snp.leading)
      make.bottom.equalTo(collectionView.snp.top).inset(-20)
    }

    rightSideCellButton.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(UI.edge)
      make.bottom.equalTo(collectionView.snp.top).inset(-20)
    }

    collectionView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(UI.edge)
    }

    uploadPictureButton.snp.makeConstraints { make in

      make.top.equalTo(collectionView.snp.bottom)
      make.leading.trailing.equalToSuperview().inset(UI.edge)
      make.bottom.equalToSuperview().inset(10)
      make.height.equalTo(50)
    }

  }

}

extension PictureTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return 9

  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PictureCollectionViewCell.identifier, for: indexPath) as! PictureCollectionViewCell

    return cell

  }

}
