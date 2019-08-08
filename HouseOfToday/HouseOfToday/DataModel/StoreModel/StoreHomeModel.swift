//
//  StoreHomeModel.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 01/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct StoreHomeList: Decodable {
  let todayDeal: [ProductListTemp]
  let categories: [CategoryList]
  let popularProducts: [ProductListTemp]

  enum CodingKeys: String, CodingKey {
    case todayDeal = "todaydeal"
    case categories
    case popularProducts = "popular_products"
  }
}
