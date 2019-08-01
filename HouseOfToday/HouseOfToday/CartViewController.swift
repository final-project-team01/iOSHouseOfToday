//
//  CartViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNaviBar()
    }

  // MARK: - 창식 - Custumizing NavigationBar
  private func configureNaviBar() {

    title = "장바구니"
    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()

    let leftItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(leftItem, animated: true)
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    print("뒤로가기 버튼 클릭 됨")
  }

}
