//
//  BuyingProductOptionsHeaderView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class BuyingProductOptionsHeaderView: UICollectionReusableView {

  // MARK: - Property
  static var identifier: String = "BuyingProductOptionsHeaderView"

  public lazy var optionButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "downArrow"), for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.setTitle("option", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.layer.borderWidth = 1
    btn.addTarget(self, action: #selector(showOptionView(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  private lazy var formatButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "downArrow"), for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.setTitle("format", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.layer.borderWidth = 1
    addSubview(btn)
    return btn
  }()

  private let notiCenter = NotificationCenter.default

  //  weak var shoppingCartList: ShoppingList? {
  //    didSet {
  //      guard let info = shoppingCartList else { return print("shoppingCartList is nil")}
  //
  //    }
  //  }

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .white
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

    if optionButton.translatesAutoresizingMaskIntoConstraints {
      optionButton.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview().inset(Metric.marginX)
        $0.bottom.equalToSuperview().offset(-Metric.marginY)

        if let titleLabel = optionButton.titleLabel,
          let imageView = optionButton.imageView {

          $0.leading.equalTo(titleLabel.snp.leading).offset(-Metric.marginX)
          $0.trailing.equalTo(titleLabel.snp.trailing).offset(Metric.marginX*3)
          $0.trailing.equalTo(imageView.snp.trailing).offset(Metric.marginX)
          $0.trailing.equalTo(imageView.snp.leading).offset(Metric.marginX*2)

          imageView.snp.makeConstraints {
            $0.height.equalTo(optionButton.snp.height).multipliedBy(0.5)
          }
        }
      }
    }

    /*
    if formatButton.translatesAutoresizingMaskIntoConstraints {
      formatButton.snp.makeConstraints {
        $0.height.equalTo(optionButton)
        $0.top.equalTo(optionButton.snp.bottom).offset(Metric.marginY/2)
        $0.bottom.equalToSuperview().inset(Metric.marginY)
        $0.leading.trailing.equalToSuperview().inset(Metric.marginX)

        if let titleLabel = formatButton.titleLabel,
          let imageView = formatButton.imageView {

          $0.leading.equalTo(titleLabel.snp.leading).offset(-Metric.marginX)
          $0.trailing.equalTo(titleLabel.snp.trailing).offset(Metric.marginX*3)
          $0.trailing.equalTo(imageView.snp.trailing).offset(Metric.marginX)
          $0.trailing.equalTo(imageView.snp.leading).offset(Metric.marginX*2)

          imageView.snp.makeConstraints {
            $0.height.equalTo(formatButton.snp.height).multipliedBy(0.5)
          }
        }
      }
    }*/
  }

  // MARK: - touch button
  @objc private func showOptionView(_ sender: UIButton) {

    notiCenter.post(name: BuyingVC.showOptionsView, object: nil, userInfo: ["option": 0])
  }

}
