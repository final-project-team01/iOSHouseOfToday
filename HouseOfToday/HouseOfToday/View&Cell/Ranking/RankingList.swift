//
//  RankingList.swift
//  HouseOfToday
//
//  Created by Daisy on 26/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

// FIXME: - Ranking Model 쪽으로 폴더 이동하기

struct RankingList: Decodable {

  let id: Int
  let name: String
  let starAvrg: String
  let reviewCount: Int

  let thumbnailImages: [ThumbnailImages]

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case starAvrg = "star_avg"
    case reviewCount = "review_count"

    case thumbnailImages = "thumnail_images"
  }
}

struct ThumbnailImages: Decodable {
  let image: String
}

/*
{
  id: 135,
  brand_name: "마켓비",
  name: "MUPAN 원목 조립마루(30x30/10개입)",
  discount_rate: "47",
  price: 26900,
  review_count: 15,
  star_avg: "4.87",
  thumnail_images: [
  {
  id: 722,
  image: "https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-productions-1545192774187_phFLySKv8.jpg/1700/1700",
  product: 135
  }
  ]
},
*/
