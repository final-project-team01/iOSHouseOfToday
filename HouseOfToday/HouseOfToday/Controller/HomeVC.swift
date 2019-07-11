//
//  HomeVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

final class HomeVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "addPostsSeleted"), for: .normal)
    button.addTarget(self, action: #selector(test(_:)), for: .touchUpInside)

    view.addSubview(button)

    button.translatesAutoresizingMaskIntoConstraints = false
    button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    print("viewDidLoad")

  }

  @objc func test(_ sender: UIButton) {

  }
}
