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

struct ProductList {
  let id: Int
  let brandName: String
  let productName: String
  let price: Int

  let thumnailUrl: [String]
  let review: [Int]
}
