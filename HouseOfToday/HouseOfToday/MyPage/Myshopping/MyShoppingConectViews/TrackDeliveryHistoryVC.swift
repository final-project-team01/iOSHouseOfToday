//
//  TrackDeliveryHistory.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let trackDeliveryHistoryVC = Notification.Name("trackDeliveryHistoryVC")
}

class TrackDeliveryHistoryVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  private lazy var pastOrderCheckButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("3개월", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setImage(UIImage(named: "downArrow"), for: .normal)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
    button.addTarget(self, action: #selector(didTapPastOrderCheckBtn(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var productStatusButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("전체상태", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
//    button.imageView?.contentMode = .scaleAspectFill
    button.setImage(UIImage(named: "downArrow"), for: .normal)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(didTapProductStatusBtn(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var seperateLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.backgroundColor = .lightGray
    view.addSubview(label)
    return label
  }()

  private lazy var announcementLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "해당 내역이 없습니다."
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureAutolayout()
    alignButtonImageAndTitle(button: self.productStatusButton)
    alignButtonImageAndTitle(button: self.pastOrderCheckButton)
  }

  private func alignButtonImageAndTitle(button: UIButton) {
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10 )
  }

  @objc func didTapPastOrderCheckBtn(_ sender: UIButton) {
    print("didTapPastOrderCheckBtn")
  }

  @objc func didTapProductStatusBtn(_ sender: UIButton) {
    print("didTapProductStatusBtn")
  }

  private func configureAutolayout() {

    let margin: CGFloat = 10
    let buttonWidth = ((view.frame.width) - (margin * 3)) / 2

    pastOrderCheckButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(margin)
      make.trailing.equalTo(productStatusButton.snp.leading).inset(-margin)
      make.bottom.equalTo(seperateLabel.snp.top).offset(-margin)
      make.width.equalTo(buttonWidth)
      make.height.equalToSuperview().multipliedBy(0.05)
    }

    productStatusButton.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(margin)
      make.bottom.equalTo(seperateLabel.snp.top).offset(-margin)
      make.width.equalTo(buttonWidth)
      make.height.equalToSuperview().multipliedBy(0.05)
    }

    seperateLabel.snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.height.equalTo(1)
      make.centerX.equalToSuperview()
    }

    announcementLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().multipliedBy(0.4)
    }

  }

}
