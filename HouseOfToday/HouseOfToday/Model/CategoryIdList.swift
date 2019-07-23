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
    let price: Int

    let thumnailImages: [ThumnailImages]
    let review: [Score]

    enum CodingKeys: String, CodingKey {
      case id
      case brandName = "brand_name"
      case productName = "name"
      case price
      case thumnailImages = "thumnail_images"
      case review
    }

    struct ThumnailImages: Decodable {
      let image: String
    }

    struct Score: Decodable {
      let score: Int

      enum CodingKeys: String, CodingKey {
        case score = "star_score"
      }
    }
  }
}
