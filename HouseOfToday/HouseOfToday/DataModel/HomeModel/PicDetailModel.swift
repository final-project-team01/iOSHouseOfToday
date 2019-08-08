//
//  PicDetailModel.swift
//  HouseOfToday
//
//  Created by Daisy on 06/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct PicDetailModel: Decodable {

  let id: Int
  let category: String
  let created: String
  let image: String
  let axisLeft: CGFloat
  let axisTop: Double
  let productImage: String
  let productID: Int
  let text: String
  let author: String
  let authorProfileImage: String
  let authorProfileComment: String
  let likeCount: Int
  let scrapCount: Int
  let hitCount: Int
  let commentCount: Int
  let photoComments: [PhotoComments]

  enum CodingKeys: String, CodingKey {
    case id
    case category
    case created
    case image
    case axisLeft = "axis_left"
    case axisTop = "axis_top"
    case productImage = "product_image"
    case productID = "product_id"
    case text
    case author
    case authorProfileImage = "author_profile_image"
    case authorProfileComment = "author_profile_comment"
    case likeCount = "like_count"
    case scrapCount = "scrap_count"
    case hitCount = "hit_count"
    case commentCount = "comment_count"
    case photoComments = "photo_comments"
  }

  struct PhotoComments: Decodable {
    let id: Int
    let author: String
    let authorProfileImage: String
    let text: String
    let created: String
    let photo: Int

    enum CodingKeys: String, CodingKey {
      case id
      case author
      case authorProfileImage = "author_profile_image"
      case text
      case created
      case photo
    }
  }
}
