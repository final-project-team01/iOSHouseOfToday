//
//  HelperFunctions.swift
//  HouseOfToday
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

internal func hideNaviBarWhenUserDidScroll(to direction: String, with naviVC: UINavigationController?, where whereIs: String) {
  print("\(whereIs)에서 // \(direction)")
  switch direction {
  case "up":
    naviVC?.setNavigationBarHidden(false, animated: true)
  case "down":
    naviVC?.setNavigationBarHidden(true, animated: true)
  default:
    break
  }
}
