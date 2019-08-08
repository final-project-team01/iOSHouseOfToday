//
//  MyPageManager.swift
//  HouseOfToday
//
//  Created by Sicc on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct SocialUser: Decodable {
  let id: Int
  let type: String
  let email: String
  let nickName: String
  let profileImageUrlStr: String
  let gender: String?
  let birthday: String?
  let message: String?
  let profile: String?

  private enum CodingKeys: String, CodingKey {
    case id
    case type
    case email
    case nickName = "username"
    case profileImageUrlStr = "social_profile"
    case gender
    case birthday
    case message
    case profile
  }
}

final class MyPageManage {
  static let shared = MyPageManage()

  private init() {}

  private var users: [SocialUser] = []

  internal func getUsers() -> [SocialUser] {
    return users
  }

  internal func addUser(_ user: SocialUser) {
    self.users.append(user)
  }
}
