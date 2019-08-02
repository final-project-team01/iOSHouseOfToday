//
//  HouseOfTodayServiceType.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

protocol HouseOfTodayServiceType {

  func fetchStoreHome(completion: @escaping (Result<StoreHomeList, ServiceError>) -> Void)
  func fetchCategoryList(completion: @escaping (Result<[CategoryList], ServiceError>) -> Void)
  func fetchProductList(completion: @escaping (Result<[ProductListTemp], ServiceError>) -> Void)
  func fetchCategoryIdList(id: Int, completion: @escaping (Result<CategoryIdList, ServiceError>) -> Void)
  func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, ServiceError>) -> Void)
  func fetchRankingList(completion: @escaping (Result<RankingModel, ServiceError>) -> Void)
  func postSignUpUserData(withBody body: Data?, completion: @escaping (Result<User, ServiceError>) -> Void)
  func postLoginDataForGetToKen(toPath path: String, withBody body: Data?, completion: @escaping (Result<String, ServiceError>) -> Void)

}
