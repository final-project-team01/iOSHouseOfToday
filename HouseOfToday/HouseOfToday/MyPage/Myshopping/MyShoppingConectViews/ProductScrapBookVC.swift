//
//  ProductScrapBookVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let presentProductScrapBookVC = Notification.Name("PresentProductScrapBookVC")
}

class ProductScrapBookVC: UIViewController {

    private let notiCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }

}
