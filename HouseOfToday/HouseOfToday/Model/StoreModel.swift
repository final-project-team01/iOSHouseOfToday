//
//  StoreModel.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 15/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct CategoryList: Decodable {

  let id: Int
  let name: String
  let imageURL: String

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case imageURL = "image"
  }

}
