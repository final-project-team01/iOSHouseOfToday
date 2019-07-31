//
//  TrackDeliveryHistory.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let trackDeliveryHistoryVC = Notification.Name("trackDeliveryHistoryVC")
}

class TrackDeliveryHistoryVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .red

  }

}
