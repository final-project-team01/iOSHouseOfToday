//
//  VoucherCell.swift
//  HouseOfToday
//
//  Created by Daisy on 16/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

final class VoucherCell: UITableViewCell {

  private lazy var firstSeperateLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.9281312823, green: 0.9253783226, blue: 0.9316661358, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var secondSeperateLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = #colorLiteral(red: 0.9281312823, green: 0.9253783226, blue: 0.9316661358, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var couponButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "coupon"), for: .normal)
    button.layer.borderColor = UIColor.lightGray.cgColor
    addSubview(button)
    return button
  }()

  private lazy var couponLabel: UILabel = {
    let label = UILabel()
    label.text = "쿠폰"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var couponCount: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var pointButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "point"), for: .normal)
    button.layer.borderColor = UIColor.lightGray.cgColor
    addSubview(button)
    return button
  }()

  private lazy var pointLabel: UILabel = {
    let label = UILabel()
    label.text = "포인트"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var pointCount: UILabel = {
    let label = UILabel()
    label.text = "1000"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var gradeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "grade"), for: .normal)
    button.imageView?.contentMode = ContentMode.scaleToFill
    button.setTitleColor(.blue, for: .normal)
    addSubview(button)
    return button
  }()

  private lazy var gradeLabel: UILabel = {
    let label = UILabel()
    label.text = "구매등급"
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var gradeCount: UILabel = {
    let label = UILabel()
    label.text = "Welcome"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private let padding: CGFloat = 10

  private lazy var couponLabelStackView: UIStackView = {
    let couponLabelStackView = UIStackView(arrangedSubviews: [couponLabel, couponCount])
    couponLabelStackView.axis = .horizontal
    couponLabelStackView.alignment = .leading
    couponLabelStackView.distribution = .equalCentering
    couponLabelStackView.spacing = padding
    return couponLabelStackView
  }()

  private lazy var pointLabelStackView: UIStackView = {
    let pointLabelStackView = UIStackView(arrangedSubviews: [pointLabel, pointCount])
    pointLabelStackView.axis = .horizontal
    pointLabelStackView.alignment = .leading
    pointLabelStackView.distribution = .equalCentering
    pointLabelStackView.spacing = padding
    return pointLabelStackView
  }()

  private lazy var gradeLabelStackView: UIStackView = {
    let gradeLabelStackView = UIStackView(arrangedSubviews: [gradeLabel, gradeCount])
    gradeLabelStackView.axis = .horizontal
    gradeLabelStackView.alignment = .leading
    gradeLabelStackView.distribution = .equalCentering
    gradeLabelStackView.spacing = padding
    return gradeLabelStackView
  }()

  private lazy var couponStackView: UIStackView = {
    let couponStackView = UIStackView(arrangedSubviews: [couponButton, couponLabelStackView])
    couponStackView.axis = .vertical
    couponStackView.alignment = .center
    couponStackView.distribution = .fillEqually
    couponStackView.spacing = padding

    return couponStackView
  }()

  private lazy var pointStackView: UIStackView = {
    let pointStackView = UIStackView(arrangedSubviews: [pointButton, pointLabelStackView])
    pointStackView.axis = .vertical
    pointStackView.alignment = .center
    pointStackView.distribution = .fillEqually
    pointStackView.spacing = padding

    return pointStackView
  }()

  private lazy var gradeStackView: UIStackView = {
    let gradeStackView = UIStackView(arrangedSubviews: [gradeButton, gradeLabelStackView])
    gradeStackView.axis = .vertical
    gradeStackView.alignment = .center
    gradeStackView.distribution = .fillEqually
    gradeStackView.spacing = padding

    return gradeStackView
  }()

  private lazy var buttonStackView: UIStackView = {
    let buttonStackView = UIStackView(arrangedSubviews: [couponStackView, firstSeperateLabel, pointStackView, secondSeperateLabel, gradeStackView])
    buttonStackView.axis = .horizontal
    buttonStackView.alignment = .fill
    buttonStackView.distribution = .equalCentering

    addSubview(buttonStackView)
    return buttonStackView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    updateConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func updateConstraints() {
    super.updateConstraints()

    buttonStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    firstSeperateLabel.snp.makeConstraints { make in
      make.width.equalTo(1.1)
    }

    secondSeperateLabel.snp.makeConstraints { make in
      make.width.equalTo(1.1)
    }

  }

}
