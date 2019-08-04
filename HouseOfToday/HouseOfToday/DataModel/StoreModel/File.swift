//
//  File.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

//final class ShoppingList {
//  var shoppingCart: [ShoppingCart] = []
//}

//struct ShoppingCart {
//  var productId: Int
//  var optionId: Int
//  var optionName: String
//  var quantity: Int
//  var price: Int
//
//  mutating func quantityManage(_ quantity: Int) {
//    print("mutating pre: \(quantity)")
//    self.quantity = quantity
//    print("mutating: \(quantity)")
//  }
//}

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
