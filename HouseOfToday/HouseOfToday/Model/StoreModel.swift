//
//  StoreModel.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
/*
struct AllCategoryList: Decodable {

  let id: Int
  let name: String
  let imageURL: String
//  var image: UIImage?

  let products: [Products]

  struct Products: Decodable {
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

    let thumnailImages: [ProductImages]

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
      case thumnailImages = "thumnail_images"
    }

    struct ProductImages: Decodable {
      let id: Int
      let image: String
      let product: Int
    }
  }

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case imageURL = "image"
    case products
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
    imageURL = try values.decode(String.self, forKey: .imageURL)
    products = try values.decode([Products].self, forKey: .products)

//    thumnailImages = try values.decode([ProductImages].self, forKey: .thumnailImages)

//    if let url = URL(string: imageURL) {
//      let data = try Data(contentsOf: url)
//      image = UIImage(data: data)
//    }
  }
}*/

//extension CategoryList {
//
//}
//
//extension CategoryList.Products {
//
//}
