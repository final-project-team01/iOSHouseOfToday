//
//  BeingOrderCell.swift
//  HouseOfToday
//
//  Created by Daisy on 16/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit
import SnapKit

class BeingOrderCell: UITableViewCell {

   private lazy var beingOrderTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "진행중인 주문 (최근 3개월)"
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 18)
//    attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.darkGray, range: (fontSize as! NSString).range(of: "(최근 3개월)"))
    addSubview(label)
    return label
  }()

  // FIXME: - 폰트크기랑 색상 바꾸기
  let fontSize = UIFont.systemFont(ofSize: 15)
  lazy var attributedStr = NSMutableAttributedString(string: beingOrderTitleLabel.text ?? "")

  var arrowArray: [UILabel] = []

   private lazy var waittingDepositLabel: UILabel = {
    let label = UILabel()
    label.text = "입금\n대기"
    label.textColor = #colorLiteral(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var waittingDepositCount: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(#colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.setTitle("0", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    addSubview(button)
    return button
  }()

  private lazy var completePaymentLabel: UILabel = {
    let label = UILabel()
    label.text = "결제\n완료"
    label.textColor = #colorLiteral(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var completePaymentCount: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(#colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.setTitle("0", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    addSubview(button)
    return button
  }()

  private lazy var waithingDeliveryLabel: UILabel = {
    let label = UILabel()
    label.text = "배송\n준비"
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var waithingDeliveryCount: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(#colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.setTitle("0", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    addSubview(button)
    return button
  }()

  private lazy var beingDeliveryLabel: UILabel = {
    let label = UILabel()
    label.text = "배송중"
    label.textColor = #colorLiteral(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var beingDeliveryCount: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(#colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.setTitle("0", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    addSubview(button)
    return button
  }()

  private lazy var completeDeliveryLabel: UILabel = {
    let label = UILabel()
    label.text = "배송\n완료"
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var completeDeliveryCount: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(#colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.setTitle("0", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    addSubview(button)
    return button
  }()

  private lazy var writeReviewLabel: UILabel = {
    let label = UILabel()
    label.text = "리뷰\n쓰기"
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0.1326085031, green: 0.1326085031, blue: 0.1326085031, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 12)
    addSubview(label)
    return label
  }()

  private lazy var writeReviewCount: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitleColor(#colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1), for: .normal)
    button.setTitle("0", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    addSubview(button)
    return button
  }()

  let padding: CGFloat = 10

  private var deliveryFlowStackView: UIStackView = UIStackView()

  private lazy var depositStackView: UIStackView = {
    let depositStackView = UIStackView(arrangedSubviews: [waittingDepositLabel, waittingDepositCount])
    depositStackView.axis = .vertical
    depositStackView.alignment = .fill
    depositStackView.distribution = .equalCentering
    depositStackView.spacing = padding

    addSubview(depositStackView)

    return depositStackView
  }()

  private func makeArrowArray() {
    for _ in 0...4 {
      let label = UILabel()
      label.text = "〉"
      label.textColor = .lightGray
      label.font = UIFont.boldSystemFont(ofSize: 15)
      addSubview(label)
      arrowArray.append(label)
    }

    deliveryFlowStackView = UIStackView(arrangedSubviews: [waittingDepositLabel, arrowArray[0], completePaymentLabel, arrowArray[1], waithingDeliveryLabel, arrowArray[2], beingDeliveryLabel, arrowArray[3], completeDeliveryLabel, arrowArray[4], writeReviewLabel])
    deliveryFlowStackView.axis = .horizontal
    deliveryFlowStackView.alignment = .center
    deliveryFlowStackView.distribution = .equalSpacing
    deliveryFlowStackView.spacing = padding
    addSubview(deliveryFlowStackView)
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    makeArrowArray()
    updateConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func updateConstraints() {
    super.updateConstraints()

    beingOrderTitleLabel.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview().inset(UIEdgeInsets(top: padding * 2,
                                                             left: padding * 1.5,
                                                             bottom: 0,
                                                             right: 0)
      )
    }

    deliveryFlowStackView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview().inset(UIEdgeInsets(top: 0,
                                                       left: padding * 2,
                                                       bottom: 0,
                                                       right: padding * 1.5)
      )
      make.top.equalTo(beingOrderTitleLabel.snp.bottom).inset(padding * 3)
    }

    waittingDepositCount.snp.makeConstraints { make in
      make.centerX.equalTo(waittingDepositLabel.snp.centerX)
      make.top.equalTo(waittingDepositLabel.snp.bottom)
    }

    completePaymentCount.snp.makeConstraints { make in
      make.centerX.equalTo(completePaymentLabel.snp.centerX)
      make.top.equalTo(completePaymentLabel.snp.bottom)
    }

    waithingDeliveryCount.snp.makeConstraints { make in
      make.centerX.equalTo(waithingDeliveryLabel.snp.centerX)
      make.top.equalTo(waithingDeliveryLabel.snp.bottom)
    }

    beingDeliveryCount.snp.makeConstraints { make in
      make.centerX.equalTo(beingDeliveryLabel.snp.centerX)
      make.centerY.equalTo(waithingDeliveryCount.snp.centerY)
      make.top.equalTo(beingDeliveryLabel.snp.bottom)
    }

    completeDeliveryCount.snp.makeConstraints { make in
      make.centerX.equalTo(completeDeliveryLabel.snp.centerX)
      make.top.equalTo(completeDeliveryLabel.snp.bottom)
    }

    writeReviewCount.snp.makeConstraints { make in
      make.centerX.equalTo(writeReviewLabel.snp.centerX)
      make.top.equalTo(writeReviewLabel.snp.bottom)
    }

  }

}
