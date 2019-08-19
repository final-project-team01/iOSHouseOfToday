//
//  ReviewModel.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct ReviewType: Decodable {
  let product: Int
  let starScore: Int
  let comment: String

  enum CodingKeys: String, CodingKey {
    case product
    case starScore = "star_score"
    case comment
  }
}
