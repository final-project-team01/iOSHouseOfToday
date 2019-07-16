//
//  SeviceError.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

enum ServiceError: Error {
  case noData
  case clientError
  case invalidStatusCode
  case invalidFormat
}
