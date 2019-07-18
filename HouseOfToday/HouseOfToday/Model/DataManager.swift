//
//  DataManager.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

class DataManager {

  // MARK: - Property
  static let shard = DataManager()
  let service: HouseOfTodayServiceType = HouseOfTodayService()

  private var product: [CategoryList]?

  // MARK: - download data
  func loadProductData() {

    if product == nil {
      fetchProductCategoryList()
    }
  }

  private func fetchProductCategoryList() {
    print("fetchProductCategoryList Start")
    service.fetchProductCategoryList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")
        self.product = list
      case .failure(let error):
        print("fetchProductCategoryList Error: \(error.localizedDescription)")
      }
    }
  }

  // MARK: - getMethods

  public func getProduct() -> [CategoryList]? {
    return self.product
  }
}
