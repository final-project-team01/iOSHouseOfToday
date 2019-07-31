//
//  CustomerServiceVC.swift
//  HouseOfToday
//
//  Created by Daisy on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let customerServiceVC = Notification.Name("customerServiceVC")
}

class CustomerServiceVC: UIViewController {

   private let notiCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
    }

}
