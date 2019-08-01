//
//  ProductList.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 19/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct ProductListTemp: Decodable {

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
    let image: String
  }
}

struct ProductList {
  let id: Int
  let brandName: String
  let productName: String
  let discountRate: String
  let price: Int
  let reviewCount: Int
  let starAvg: String

  let thumnailUrl: [String]
}

// MARK: - Welcome
struct Welcome: Codable {
  let id: Int
  let brandName, name, discountRate: String
  let price, reviewCount: Int
  let starAvg: String
  let thumnailImages: [ThumnailImage]

  enum CodingKeys: String, CodingKey {
    case id
    case brandName = "brand_name"
    case name
    case discountRate = "discount_rate"
    case price
    case reviewCount = "review_count"
    case starAvg = "star_avg"
    case thumnailImages = "thumnail_images"
  }
}

// MARK: - ThumnailImage
struct ThumnailImage: Codable {
  let id: Int
  let image: String
  let product: Int
}
