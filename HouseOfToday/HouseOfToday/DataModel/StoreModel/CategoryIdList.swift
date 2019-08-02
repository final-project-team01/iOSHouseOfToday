//
//  CategoryIdList.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 22/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct CategoryIdList: Decodable {

  let id: Int
  let name: String
  let image: String
  let products: [ProductListTemp]

  struct ProductListTemp: Decodable {

    let id: Int
    let brandName: String
    let productName: String
    let discountRate: String
    let price: Int
    let reviewCount: Int
    let starAvg: String

    let thumnailImages: [ThumnailImages]

    enum CodingKeys: String, CodingKey {
      case id
      case brandName = "brand_name"
      case productName = "name"
      case discountRate = "discount_rate"
      case price
      case reviewCount = "review_count"
      case starAvg = "star_avg"

      case thumnailImages = "thumnail_images"
    }

    struct ThumnailImages: Decodable {
      let image: String
    }
  }
}
