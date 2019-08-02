//
//  ErrorLog.swift
//  HouseOfToday
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

// 창식 - 에러 문자열 정리 
enum ErrorLogs: String {
  case coderInit = "init(coder:) has not been implemented"

  var message: String {
    return self.rawValue
  }
}
