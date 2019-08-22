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
  private lazy var reviewLabel: UILabel = {
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
    button.backgroundColor = #colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1)
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
    button.backgroundColor = #colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1)
        button.addTarget(self, action: #selector(didTapWriteReviewButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var reviewStatusLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰가 없어요"
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureAutoLayout()
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }
  private func configureNaviBar() {
    self.title = "푸쉬 알림 설정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - Action Methods
  @objc private func didTapButton(_ sender: UIButton) {
    bestButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    newestButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    rowAvgButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    sender.backgroundColor = #colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1)
  }

  @objc private func didTapWriteReviewButton(_ sender: UIButton) {
    let writeReviewVC = WriteReviewVC()
    navigationController?.pushViewController(writeReviewVC, animated: true)
  }

  // MARK: - AutoLayout
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
      make.bottom.equalTo(view.safeAreaLayoutGuide)
      make.height.equalToSuperview().multipliedBy(0.07)
    }

  }

}
