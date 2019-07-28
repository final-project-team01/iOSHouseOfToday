//
//  HomeVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

final class HomeVC: CategoryTabBarViewController {

  private let notiCenter = NotificationCenter.default

  init() {
    super.init(withTitles: ["랭킹"],
               withViews: [TempRankingView()],
               withScrollOption: false)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    notiCenter.addObserver(self, selector: #selector(presentRankingDetailView(_:)), name: .presentRankingDetailView, object: nil)
  }

  deinit {
    notiCenter.removeObserver(self, name: .presentRankingDetailView, object: nil)
  }

@objc func presentRankingDetailView(_ sender: Notification) {
  guard let userInfo = sender.userInfo as? [String: UIViewController],
    let DetailRankingVC = userInfo["presentRankingDetailView"]
    else {
      return print("fail downCasting")
  }
  present(DetailRankingVC, animated: true)
}
}
