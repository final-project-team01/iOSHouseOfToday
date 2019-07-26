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

  init() {
    super.init(withTitles: ["랭킹"],
               withViews: [TempRankingView()],
               withScrollOption: false)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
