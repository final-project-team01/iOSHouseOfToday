//
//  ProductScrapBookVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let productScrapBookVC = Notification.Name("ProductScrapBookVC")
}

class ProductScrapBookVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  lazy var announcementLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "스크랩한 제품이 없습니다."
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

  private func configureAutoLayout() {
    announcementLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().multipliedBy(0.4)
    }
  }
}
