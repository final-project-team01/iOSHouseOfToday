//
//  MyPageModel.swift
//  HouseOfToday
//
//  Created by chang sic jung on 25/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct User: Codable {
  let email: String
  let password: String
  let username: String?

  func percentEscaped() -> String {

    let mirror = Mirror(reflecting: self)

    var query: [String] = []
    for i in mirror.children {
      guard let varName = i.label else { logger("Can't get varName"); return "" }
      if let varValue = i.value as? String {
        let key = varName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let value = varValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        query.append(key + "=" + value)
      }
    }

    return query.joined(separator: "&")
  }
}
