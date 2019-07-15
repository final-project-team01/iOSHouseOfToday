//
//  StoreVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class StoreVC: UIViewController {

  let service = HouseOfTodayService()

  override func viewDidLoad() {
    super.viewDidLoad()

    service.fetchProductCategoryList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")
      case .failure(let error):
        print("fetchProductCategoryList Error: \(error.localizedDescription)")
      }
    }

  }

}
