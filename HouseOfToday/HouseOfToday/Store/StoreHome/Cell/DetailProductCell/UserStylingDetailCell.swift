//
//  UserStylingDetailCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 24/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class UserStylingDetailCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "UserStylingDetailCell"

  public lazy var thumnailImageView: UIImageView = {
    let iv = UIImageView(frame: CGRect.zero)
    iv.layer.masksToBounds = true
    iv.layer.cornerRadius = Metric.StylingShotSmallCellSize.width / 10
    addSubview(iv)
    return iv
  }()

  private lazy var grayView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
    thumnailImageView.addSubview(view)
    return view
  }()

  public lazy var userImageView: UIImageView = {
    let iv = UIImageView(frame: CGRect.zero)
    iv.layer.masksToBounds = true
    iv.layer.cornerRadius = 5
    iv.backgroundColor = .white
    grayView.addSubview(iv)
    return iv
  }()

  public lazy var userNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "TitleName"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    grayView.addSubview(label)
    return label
  }()

  public lazy var totalShotCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1/9999"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    grayView.addSubview(label)
    return label
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    autolayoutViews()
  }

  // MARK: - configure

  private func autolayoutViews() {

    if thumnailImageView.translatesAutoresizingMaskIntoConstraints {
      thumnailImageView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }

    if grayView.translatesAutoresizingMaskIntoConstraints {
      grayView.snp.makeConstraints {
        $0.leading.trailing.bottom.equalToSuperview()
        $0.height.equalTo(UIScreen.main.bounds.width/10)
      }
    }

    if userImageView.translatesAutoresizingMaskIntoConstraints {
      userImageView.snp.makeConstraints {
        $0.centerY.equalTo(grayView.snp.centerY)
        $0.leading.equalTo(Metric.marginX)
        $0.height.equalTo(grayView.snp.height).multipliedBy(0.5)
        $0.width.equalTo(userImageView.snp.height)
      }
    }

    if userNameLabel.translatesAutoresizingMaskIntoConstraints {
      userNameLabel.snp.makeConstraints {
        $0.centerY.equalTo(userImageView.snp.centerY)
        $0.leading.equalTo(userImageView.snp.trailing).offset(10)
      }
    }

    if totalShotCountLabel.translatesAutoresizingMaskIntoConstraints {
      totalShotCountLabel.snp.makeConstraints {
        $0.centerY.equalTo(userImageView.snp.centerY)
        $0.trailing.equalTo(grayView.snp.trailing).offset(-10)
      }
    }

  }

}
