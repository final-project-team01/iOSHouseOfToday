//
//  AddUserActivityVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class AddUserActivityVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
//    view.backgroundColor = .yellow
  }

  override func loadView() {
    view = AddUserActivityView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    if let userView = view as? AddUserActivityView {
      userView.showView()
    }

  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    if let userView = view as? AddUserActivityView {
      userView.hideView()

    }
  }

}
