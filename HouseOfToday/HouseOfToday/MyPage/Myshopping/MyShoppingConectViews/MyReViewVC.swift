//
//  MyReViewVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let myReViewVC = Notification.Name("myReViewVC")
}

class MyReViewVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  // FIXME: - fommatta로 `숫자`색상 바꾸기
  lazy var reviewLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰 0"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  private lazy var bestButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("베스트순", for: .normal)
     button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var newestButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("최신순", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var rowAvgButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("낮은 평점순", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var writeReviewButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("리뷰 쓰기", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    //    button.addTarget(self, action: #selector(didTapWriteReviewButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  lazy var reviewStatusLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰가 없어요"
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  @objc func didTapButton(_ sender: UIButton) {
    bestButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    newestButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    rowAvgButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    sender.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
  }

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      configureAutoLayout()
    }

  private func configureAutoLayout() {

    let margin: CGFloat = 15

    reviewLabel.snp.makeConstraints { make in
      make.centerY.equalToSuperview().multipliedBy(0.3)
      make.leading.trailing.equalToSuperview().inset(margin)
      make.width.equalToSuperview()
    }

    bestButton.snp.makeConstraints { make in
      make.top.equalTo(reviewLabel.snp.bottom).offset(50)
      make.leading.equalToSuperview().inset(margin)
      make.trailing.equalTo(newestButton.snp.leading).offset(-10)
      make.bottom.equalTo(reviewStatusLabel.snp.top)
      make.width.equalToSuperview().multipliedBy(0.25)
    }

    newestButton.snp.makeConstraints { make in
      make.top.equalTo(bestButton.snp.top)
      make.trailing.equalTo(rowAvgButton.snp.leading).offset(-10)
      make.bottom.equalTo(reviewStatusLabel.snp.top)
      make.width.equalToSuperview().multipliedBy(0.25)
    }

    rowAvgButton.snp.makeConstraints { make in
      make.top.equalTo(bestButton.snp.top)
      make.trailing.equalToSuperview()
      make.bottom.equalTo(reviewStatusLabel.snp.top)
      make.width.equalToSuperview().multipliedBy(0.25)
    }

    reviewStatusLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalTo(writeReviewButton.snp.top)
    }

    writeReviewButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
      make.height.equalToSuperview().multipliedBy(0.07)
    }

  }

}
