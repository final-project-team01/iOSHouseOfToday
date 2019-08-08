//
//  OrderListModel.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct OrderList: Decodable {
  let id: Int
  let user: String
  let orderList: [OrderProductList]

  enum CodingKeys: String, CodingKey {
    case id
    case user
    case orderList = "order_list"
  }

  struct OrderProductList: Decodable {
    let brabdName: String
    let product: String
    let productOption: String
    let quantity: Int
    let thumnailImage: String
    let totalPrice: Int
    enum CodingKeys: String, CodingKey {
      case brabdName = "brand_name"
      case product
      case productOption = "product_option"
      case quantity
      case thumnailImage = "thumnail_image"
      case totalPrice = "total_price"
    }
  }
}

struct ShowOrderList {
  let id: Int
  let user: String
  let brabdName: String
  let product: String
  let productOption: String
  let quantity: Int
  let thumnailImage: String
  let totalPrice: Int
}
