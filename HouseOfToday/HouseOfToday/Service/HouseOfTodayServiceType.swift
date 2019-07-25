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

  func postLoginUserInfo(withBody: Data?, completion: @escaping (Result<User, ServiceError>) -> Void)
}
