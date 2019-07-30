//
//  FooterTableCell.swift
//  HouseOfToday
//
//  Created by Daisy on 25/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

extension Notification.Name {
  static let presentRankingDetailView = Notification.Name("presentRankingDetailView")
}

class FooterTableCell: UITableViewHeaderFooterView {

  private let notiCenter = NotificationCenter.default

  let detailRankingView = DetailRankingVC()

  static var height = UIScreen.main.bounds.height/15

  lazy var moreButton: UIButton = {
    let button = UIButton(type: .custom)
    button.titleLabel?.textAlignment = .center
    button.setTitle("Loading...", for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.9043933749, green: 0.9526636004, blue: 0.9818997979, alpha: 1)
    button.setTitleColor( #colorLiteral(red: 0.2017701268, green: 0.7704548836, blue: 0.9419474006, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    button.layer.cornerRadius =  5
    button.addTarget(self, action: #selector(moreButtondidTap(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  override init(reuseIdentifier: String?) {
    super .init(reuseIdentifier: reuseIdentifier)
    configureLabel()

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func moreButtondidTap(_ sender: UIButton) {

    notiCenter.post(name: .presentRankingDetailView, object: sender, userInfo: ["presentRankingDetailView": detailRankingView])

  }

  private func configureLabel() {

    moreButton.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(JMetric.inset.left)
      make.top.bottom.equalToSuperview()
    }

  }

}
