//
//  ProductList.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 19/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

/*
struct ProductListTemp {

  let id: Int
  let brandName: String
  let productName: String
  let price: Int

  let thumnailImages: [String]
  let review: [Int]

  enum CodingKeys: String, CodingKey {
    case id
    case brandName = "brand_name"
    case productName = "name"
    case price
    case thumnailImages = "thumnail_images"
    case review
  }

  enum AddingImageKey: String, CodingKey {
    case id
    case image
    case product
  }

  enum AddingScoreKey: String, CodingKey {
    case score = "star_score"
  }
  
}*/

//extension ProductListTemp: Decodable {
//    init(from decoder: Decoder) throws {
//      let values = try decoder.container(keyedBy: CodingKeys.self)
//      id = try values.decode(Int.self, forKey: .id)
//      brandName = try values.decode(String.self, forKey: .brandName)
//      productName = try values.decode(String.self, forKey: .productName)
//      price = try values.decode(Int.self, forKey: .price)
//
//      var imageValues = try values.nestedUnkeyedContainer(forKey: .thumnailImages)
//
////      let imageValues = try values.nestedContainer(keyedBy: AddingImageKey.self, forKey: .thumnailImages)
//      var allUrl: [String] = []
//
//      while !imageValues.isAtEnd {
//        let url = try imageValues.decode(String.self)
//        allUrl += [url]
//      }
//
//      let scoreValues = try values.nestedContainer(keyedBy: AddingScoreKey.self, forKey: .review)
//      review = try scoreValues.decode([Int].self, forKey: .score)
//    }
//}
//

struct ProductListTemp11: Decodable {

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
