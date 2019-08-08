//
//  MyQuestionsListVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let myQuestionsListVC = Notification.Name("myQuestionsListVC")
}

class MyQuestionsListVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  lazy var announcementLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "문의내역이 없습니다."
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureAutoLayout()
    view.backgroundColor = .white
  }

  private func configureAutoLayout() {
    announcementLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().multipliedBy(0.4)
    }
  }
}
