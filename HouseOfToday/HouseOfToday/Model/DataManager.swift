//
//  DataManager.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 17/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

class DataManager {

  let shared = DataManager()

  let service: HouseOfTodayServiceType = HouseOfTodayService()

  private init() {

  }
}
