//
//  HousewarmingModel.swift
//  HouseOfToday
//
//  Created by Daisy on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct HousewarmingModel: Decodable {

  let housewarmingPosts: [HousewarmingPost]

  enum CodingKeys: String, CodingKey {
    case housewarmingPosts = "housewarming_posts"
  }

  struct HousewarmingPost: Decodable {
   let id: Int
   let coverImage: String
   let title: String
   let authorProfileImage: String
   let author: String
   let scrapCount: Int
   let hitCount: Int

    enum CodingKeys: String, CodingKey {
      case id
      case coverImage = "cover_image"
      case title
      case authorProfileImage = "author_profile_image"
      case author
      case scrapCount = "scrap_count"
      case hitCount = "hit_count"
    }
  }
}
