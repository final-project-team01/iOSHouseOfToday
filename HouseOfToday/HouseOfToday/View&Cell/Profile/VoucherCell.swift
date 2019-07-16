//
//  VoucherCell.swift
//  HouseOfToday
//
//  Created by Daisy on 16/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class VoucherCell: UITableViewCell {

  private lazy var couponButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "coupon"), for: .normal)
    button.layer.borderColor = UIColor.lightGray.cgColor
    addSubview(button)
//    button.addTarget(action: #selector(buttonTest))
    return button
  }()

//  @objc func buttonTest() {
//    print("button Tapped")
//  }

  private lazy var couponLabel: UILabel = {
    let label = UILabel()
    label.text = "쿠폰"
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var couponCount: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
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
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var pointCount: UILabel = {
    let label = UILabel()
    label.text = "1000"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var gradeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "grade"), for: .normal)
    button.imageView?.contentMode = ContentMode.scaleToFill // FIXME: - 왜 버튼이 짜부될까?
    button.layer.borderColor = UIColor.lightGray.cgColor // FIXME: - 왜 안먹냥?
    button.setTitle("구매등급 Welcomoe", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(.blue, for: .normal)
    addSubview(button)
    return button
  }()

  private lazy var gradeLabel: UILabel = {
    let label = UILabel()
    label.text = "구매등급"
    label.textColor = .lightGray
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var gradeCount: UILabel = {
    let label = UILabel()
    label.text = "Welcome"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
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

  private lazy var buttonStackView: UIStackView = {
  let buttonStackView = UIStackView(arrangedSubviews: [couponButton, pointButton, gradeButton])
  buttonStackView.axis = .horizontal
  buttonStackView.alignment = .fill
  buttonStackView.distribution = .fillEqually
  buttonStackView.spacing = padding

  addSubview(buttonStackView)
  return buttonStackView
}()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    updateConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super .layoutSubviews()

  }

  override func updateConstraints() {
    super.updateConstraints()

    buttonStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0,
                                                       left: 10,
                                                       bottom: 0,
                                                       right: 10)
      )
    }
  }

}
