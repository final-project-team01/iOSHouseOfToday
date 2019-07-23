//
//  ProductDetail.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 22/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct ProductDetail: Decodable {
  let id: Int
  let name: String
  let price: Int
  let brandName: String
  let detailName: String
  let detailColor: String
  let detailSize: String
  let detailComponent: String
  let detailAuth: String
  let detailCost: String
  let detailStandard: String
  let detailMfc: String
  let detailMis: String
  let detailAs: String
  let returnFee: String
  let exchangeFee: String
  let returnAddress: String
  let deliver: String
  let deliverFee: String
  let deliverNoGo: String
  let deliverFeeDiff: String
  let created: String
  let category: Int

//  let thumnailImages: [ProductImages]
//  let detailImages: [ProductImages]
//  let productOption: [Option]
//  let review: [Review]
//  let qna: [QnAList]

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case price
    case brandName = "brand_name"
    case detailName = "detail_name"
    case detailColor = "detail_color"
    case detailSize = "detail_size"
    case detailComponent = "detail_component"
    case detailAuth = "detail_auth"
    case detailCost = "detail_cost"
    case detailStandard = "detail_standard"
    case detailMfc = "detail_mfc"
    case detailMis = "detail_mis"
    case detailAs = "detail_as"
    case returnFee = "return_fee"
    case exchangeFee = "exchange_fee"
    case returnAddress = "return_address"
    case deliver
    case deliverFee = "deliver_fee"
    case deliverNoGo = "deliver_no_go"
    case deliverFeeDiff = "deliver_fee_diff"
    case created
    case category

//    case thumnailImages = "thumnail_images"
//    case detailImages = "detail_images"
//    case productOption = "product_option"
//    case review
  }
/*
  struct ProductImages: Decodable {
    let id: Int
    let image: String
    let product: Int
  }

  struct Option: Decodable {
    let id: Int
    let type: String
    let name: String
    let price: Int
    let product: Int
  }

  struct Review: Decodable {
    let id: Int
    let starScore: Int
    let image: String?
    let comment: String
    let created: String
    let user: Int
    let product: Int
    //    let helpful

    enum CodingKeys: String, CodingKey {
      case id
      case starScore = "star_score"
      case image
      case comment
      case created
      case user
      case product
    }
  }

  struct QnAList: Decodable {
    let id: Int
    let type: String
    let comment: String
    let completed: Int
    let created: String
    let aAuthor: String
    let aComment: String
    let aCreated: String
    let user: Int
    let product: Int

    enum CodingKeys: String, CodingKey {
      case id
      case type
      case comment
      case completed
      case created
      case aAuthor = "a_author"
      case aComment = "a_comment"
      case aCreated = "a_created"
      case user
      case product
    }
  }*/

}
