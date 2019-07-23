//
//  HouseOfTodayServiceStub.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

final class HouseOfTodayServiceStub: HouseOfTodayServiceType {

  func fetchCategoryList(completion: @escaping (Result<[CategoryList], ServiceError>) -> Void) {

    if let categoryList = try? JSONDecoder().decode([CategoryList].self, from: StoreSampleData.storeData) {
      completion(.success(categoryList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchProductList(completion: @escaping (Result<[ProductListTemp], ServiceError>) -> Void) {

  }

  func fetchCategoryIdList(id: Int, completion: @escaping (Result<CategoryIdList, ServiceError>) -> Void) {

  }

  func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, ServiceError>) -> Void) {

  }

}
