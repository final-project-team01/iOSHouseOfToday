//
//  StoreVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class StoreVC: UIViewController {

  let service = HouseOfTodayService()

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func loadView() {
    view = StoreHomeView()
  }

}
