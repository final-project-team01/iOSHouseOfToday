//
//  ProfileBaseCell.swift
//  HouseOfToday
//
//  Created by Daisy on 11/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit
import SnapKit

final class MyshoppingBaseCell: UITableViewCell {

  enum TitleName: String {

    case orderCheck        = "주문배송내역 조회"
    case productScrap      = "제품 스크랩북"
    case myinquiry         = "나의 문의내역"
    case myReview          = "나의 리뷰"
    case customerService   = "고객센터"
  }

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "주문배송내역 조회"
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 18)
    addSubview(label)
    return label
  }()

  private lazy var countLabel: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var arrowView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "rightArrow")
    addSubview(view)
    return view
  }()

  let padding: CGFloat = 10

  //각각 cell에 맞게 속성 변경
  func setLabelItems(title: TitleName, subTitle: String = "") {

    switch title {
    case .orderCheck:
      titleLabel.text = title.rawValue
      countLabel.isHidden = true

    case .productScrap:
      titleLabel.text = title.rawValue

    case .myinquiry:
      titleLabel.text = title.rawValue

    case .myReview:
      titleLabel.text = title.rawValue

    case .customerService:
      titleLabel.text = title.rawValue
      countLabel.isHidden = true

//    default:
//      break
    }

  }

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

    titleLabel.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(padding * 2)
      make.leading.equalToSuperview().inset(padding * 1.5)
      make.trailing.equalTo(countLabel.snp.leading).inset(-padding)
    }

    countLabel.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(padding * 2)
    }

    arrowView.snp.makeConstraints { make in
      make.width.height.equalTo(15)
      make.top.bottom.equalToSuperview().inset(padding * 3.25)
      make.trailing.equalToSuperview().inset(padding * 1.2)
    }
  }
}
