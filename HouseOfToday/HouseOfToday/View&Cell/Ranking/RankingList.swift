//
//  RankingList.swift
//  HouseOfToday
//
//  Created by Daisy on 26/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

// FIXME: - Ranking Model 쪽으로 폴더 이동하기
// FIXME: - 폴더정리하기

struct RankingList: Decodable {

  let best100: [Body]
  let lightHomedeco: [Body]
  let dailySupplies: [Body]
  let fabric: [Body]
  let kitchenware: [Body]
  let homeAppliances: [Body]
  let companionAnimal: [Body]
  let furniture: [Body]

  enum CodingKeys: String, CodingKey {
    case best100
    case lightHomedeco = "light_homedeco"
    case dailySupplies = "daily_supplies"
    case fabric
    case kitchenware
    case homeAppliances = "home_appliances"
    case companionAnimal = "companion_animal"
    case furniture
  }

  struct Body: Decodable {
    let id: Int
    let brandName: String
    let productName: String
    let discountRate: String?
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
      let id: Int
      let image: String
      let product: Int
    }
  }
}
