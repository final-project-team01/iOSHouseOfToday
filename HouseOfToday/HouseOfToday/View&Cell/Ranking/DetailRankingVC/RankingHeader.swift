//
//  RankingHeader.swift
//  HouseOfToday
//
//  Created by Daisy on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension Notification.Name {
  static let presentRankingPickerVC = Notification.Name("presentPickerVC")
}

// FIXME: - 스크롤 어느정도 올리면 Header 없어지게 하는거 추가하기

class RankingHeader: UITableViewHeaderFooterView {

  let pickerVC = PickerViewController()

  private let notiCenter = NotificationCenter.default

  static var height = UIScreen.main.bounds.height/7

  // 시간설정
  private var today: String {
    get {
      let df = DateFormatter()
      df.locale = Locale(identifier: "ko")
      df.dateFormat = "MM월 dd일"
      return df.string(from: Date())
    }
  }

  private lazy var updateDateLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "매일 업데이트 • \(today)"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .darkGray
    addSubview(label)
    return label
  }()

  private lazy var filterButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "filter"), for: .normal)
//        button.addTarget(self, action: #selector(didTapfilterButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var categoryButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "category"), for: .normal)
//        button.addTarget(self, action: #selector(didTapCategoryButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var dailyPopularButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "dailypopular"), for: .normal)
        button.addTarget(self, action: #selector(didTapSortButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  override init(reuseIdentifier: String?) {
    super .init(reuseIdentifier: reuseIdentifier)
    configureAutoLayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //사용 안함
  @objc private func didTapfilterButton(_ sender: UIButton) {
    print("Tapped FilterButton")

  }
  //사용 안함
  @objc private func didTapCategoryButton(_ sender: UIButton) {
    print("Tapped CategoryButton")

  }

  @objc private func didTapSortButton(_ sender: UIButton) {
    print("Tapped SortButton")

    notiCenter.post(name: .presentRankingPickerVC, object: sender, userInfo: ["presentRankingPickerVC": pickerVC])

  }

  private func configureAutoLayout() {

    let margin: CGFloat = 10

    updateDateLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(margin)

    }

    filterButton.snp.makeConstraints { make in
      make.top.equalTo(updateDateLabel.snp.bottom).offset(margin/2)
      make.leading.bottom.equalToSuperview().inset(margin/2)
    }

    categoryButton.snp.makeConstraints { make in
      make.top.equalTo(updateDateLabel.snp.bottom).offset(margin/2)
      make.leading.equalTo(filterButton.snp.trailing)
      make.centerY.equalTo(filterButton.snp.centerY)
    }

    dailyPopularButton.snp.makeConstraints { make in
      make.trailing.equalToSuperview().inset(margin/2)
      make.bottom.equalTo(categoryButton.snp.bottom)

    }
  }

}
