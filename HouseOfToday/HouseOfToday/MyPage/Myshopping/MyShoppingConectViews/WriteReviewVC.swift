//
//  WriteReviewVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class WriteReviewVC: UIViewController {

  private lazy var searchTitleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰를 쓰고 싶은 제품을 검색해 보세요."
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  private lazy var searchProductButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("제품명 또는 브랜드", for: .normal)
    button.setImage(UIImage(named: "magnifyingGlass"), for: .normal)
    button.contentHorizontalAlignment = .left
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.setTitleColor(.lightGray, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.9293106794, green: 0.929469943, blue: 0.9293007255, alpha: 1)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapSearchProductButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var reviewStatusLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰를 작성할 구입한 제품이 없습니다."
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = UIColor.lightGray
    view.addSubview(label)
    return label
  }()

  private lazy var goToWriteReviewButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("직접 입력하러 가기", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.addTarget(self, action: #selector(didTapGoToWriteReviewButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    alignButtonImageAndTitle(button: self.searchProductButton)
    makeConstraints()
  }

  // MARK: - Action Methods
  @objc private func didTapSearchProductButton(_ sender: UIButton) {
  print("didTapSearchProductButton")

  }

  @objc private func didTapGoToWriteReviewButton(_ sender: UIButton) {
    let userWriteReviewVC = UserWriteReviewVC()
    navigationController?.pushViewController(userWriteReviewVC, animated: true)
  }

  private func alignButtonImageAndTitle(button: UIButton) {
    let calculateWidth = button.frame.width/4
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0 )
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
  }

  // MARK: - AutoLayout
  private func makeConstraints() {

    let margin: CGFloat = 15

    searchTitleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(60)
      make.leading.trailing.equalToSuperview().inset(margin)
      make.bottom.equalTo(searchProductButton.snp.top).offset(-30)
      make.height.equalTo(10)
    }

    searchProductButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(margin)
      make.bottom.equalTo(reviewStatusLabel.snp.top)
      make.height.equalToSuperview().multipliedBy(0.05)
    }

    reviewStatusLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalTo(goToWriteReviewButton.snp.top)
    }

    goToWriteReviewButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(margin)
      make.bottom.equalTo(view.snp.centerY).offset(-20)
      make.height.equalToSuperview().multipliedBy(0.08)
    }

  }

}
