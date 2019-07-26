//
//  HouseOfTodayServiceType.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

protocol HouseOfTodayServiceType {
  func fetchProductCategoryList(completion: @escaping (Result<[CategoryList], ServiceError>) -> Void)

  func postSignUpUserData(withBody body: Data?, completion: @escaping (Result<User, ServiceError>) -> Void)

  func postLoginDataForGetToKen(toPath path: String, withBody body: Data?, completion: @escaping (Result<String, ServiceError>) -> Void)

}
