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
      fetchCategoryList()
    }
  }

  private func fetchCategoryList() {
    print("fetchCategoryList Start")
    service.fetchCategoryList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")
        self.product = list
      case .failure(let error):
        print("fetchCategoryList Error: \(error.localizedDescription)")
      }
    }
  }

  private func fetchProductList() {
    print("fetchProductList Start")
    service.fetchProductList { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.count)")
      case .failure(let error):
        print("fetchProductList Error: \(error.localizedDescription)")
      }
    }
  }

  // MARK: - getMethods

  public func getProduct() -> [CategoryList]? {
    return self.product
  }
}
