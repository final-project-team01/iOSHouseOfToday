//
//  UIBarButtonItemExtensions.swift
//  HouseOfToday
//
//  Created by Sicc on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

extension UIBarButtonItem {

  static func setButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
    let button = UIButton(type: .custom)

    // 버튼 이미지에 색 넣는 전처리
    button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
    button.addTarget(target, action: action, for: .touchUpInside)
    button.tintColor = .darkGray

    let menuBarItem = UIBarButtonItem(customView: button)
    menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
    menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true

    return menuBarItem
  }
}
