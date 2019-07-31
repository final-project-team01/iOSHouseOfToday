//
//  ProfileVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

  override func loadView() {
    view = ProfileView()
  }

  override func viewDidLoad() {
      super.viewDidLoad()
    let navi = UINavigationController(rootViewController: ProfileVC())
    present(navi, animated: true)
  }

}
