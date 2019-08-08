//
//  FirstReplyTableViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class FirstReplyTableViewCell: UITableViewCell {

  static var height = UIScreen.main.bounds.height/15

  private lazy var commentStatusLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "첫 번째 댓글을 남겨주세요!"
    label.font = UIFont.boldSystemFont(ofSize: 22)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    addSubview(label)
    return label
  }()

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    makeConstraints()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - AutoLayout
  private func makeConstraints() {

    commentStatusLabel.snp.makeConstraints { make in
      make.top.leading.bottom.equalToSuperview().inset(15)
    }
  }
}
