//
//  BeingOrderCell.swift
//  HouseOfToday
//
//  Created by Daisy on 16/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

class BeingOrderCell: UITableViewCell {

   private lazy var beingOrderTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "진행중인 주문 (최근 3개월)"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  // FIXME: - 글자 크기와 색상 부분적으로 변경

  let adjustfont = UIFont(name: "Helvetica", size: 17)

//  let attributedString = NSMutableAttributedString(string: beingOrderTitleLabel.text)

   private lazy var waittingInsert: UILabel = {
    let label = UILabel()
    label.text = "진행중인 주문 (최근 3개월)"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var userImageButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "userImage"), for: .normal)
    button.layer.cornerRadius = button.frame.width / 2
    button.clipsToBounds = true
    addSubview(button)
    return button
  }()

  private lazy var beingOrderCount: UILabel = {
    let label = UILabel()
    label.text = "0"
    label.textColor = #colorLiteral(red: 0.27849105, green: 0.8343001604, blue: 0.9591807723, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var seperateLabel: UILabel = {
    let label = UILabel()
    label.backgroundColor = .lightGray
    addSubview(label)
    return label
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

  }

}
