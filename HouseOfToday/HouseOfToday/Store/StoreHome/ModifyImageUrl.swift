//
//  SetModifyImageUrl.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 20/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

enum Resizing {
  case url(String, Int)
//  case size100(String)// = "100"
//  case size200(String)// = "200"

  var get: String {
    switch self {
    case .url(let url, let size):

      if let imageExtensionPos = url.range(of: ".jpg", options: NSString.CompareOptions.literal, range: url.startIndex..<url.endIndex, locale: nil) {

        return String(url[url.startIndex..<imageExtensionPos.upperBound]) + "/\(size)/\(size)"

      } else if let imageExtensionPos = url.range(of: ".png", options: NSString.CompareOptions.literal, range: url.startIndex..<url.endIndex, locale: nil) {

        return String(url[url.startIndex..<imageExtensionPos.upperBound]) + "/\(size)/\(size)"
      }

      return url
    }
  }
}
