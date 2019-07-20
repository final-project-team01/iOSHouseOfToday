//
//  StoreVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension StoreVC {
  static var presentViewController: Notification.Name {
    return Notification.Name("present")
  }
}

final class StoreVC: UIViewController {

  let storeHomeView = StoreHomeView()

  override func viewDidLoad() {
    super.viewDidLoad()
    print("StoreVC: viewDidLoad")
  }

  override func loadView() {
    view = storeHomeView
    print("StoreVC: loadView")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
  }
  
  deinit {
    
  }

}
