//
//  File.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

final class ShoppingCart {
  public let productId: Int
  public let optionId: Int
  public let optionName: String
  public let price: Int
  public var quantity: Int

  init(productId: Int, optionId: Int, optionName: String, price: Int, quantity: Int) {
    self.productId = productId
    self.optionId = optionId
    self.optionName = optionName
    self.price = price
    self.quantity = quantity
  }
}

struct PostShoppingCart: Encodable {
  let product: Int
  let productOption: Int
  let quantity: Int

  enum CodingKeys: String, CodingKey {
    case product = "product"
    case productOption = "product_option"
    case quantity = "quantity"
  }
}

struct ShoppingOptionCart: Decodable {
  let id: Int
  let user: String
  let brandName: String
  let product: String
  let productId: String
  let deliverFee: String
  let deliver: String
  let productOption: String
  let quantity: Int
  let thumnailImage: String
  let totalPrice: Int

  enum CodingKeys: String, CodingKey {
    case id
    case user
    case brandName = "brand_name"
    case product
    case productId = "product_id"
    case deliverFee = "deliver_fee"
    case deliver
    case productOption = "product_option"
    case quantity
    case thumnailImage = "thumnail_image"
    case totalPrice = "total_price"
  }
}

struct OrderProductList: Decodable {
  let id: Int
  let user: String
  let orderList: [OrderProduct]

  enum CodingKeys: String, CodingKey {
    case id
    case user
    case orderList = "order_list"
  }
}

struct OrderProduct: Decodable {
  let brandName: String
  let product: String
  let productOption: String
  let quantity: Int
  let thumnailImage: String
  let totalPrice: Int

  enum CodingKeys: String, CodingKey {
    case brandName = "brand_name"
    case product
    case productOption = "product_option"
    case quantity
    case thumnailImage = "thumnail_image"
    case totalPrice = "total_price"
  }
}
