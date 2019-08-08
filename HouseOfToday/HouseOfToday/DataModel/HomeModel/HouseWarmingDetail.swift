//
//  HouseWarmingDetail.swift
//  HouseOfToday
//
//  Created by Sicc on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

struct HouseWarmingDetail: Decodable {
  let id: Int
  let coverImageUrlStr: String // 키값 바꾸기
  let title: String
  let created: String // 작성일자

  let structure: String // 건물
  let floorSpace: String // 평수
  let style: String // 스타일 : 내추럴,,등등
  let work: String // 작업 :  셀프 DIY
  let area: String // 분야 : 홈스타일링
  let period: String // 기간 : 4개월
  let budget: String // 예산 : 200만원
  let family: String // 가족형태 : 아기가 있는 집
  let detailPart: String // 세부공정 : - 이면 없음
  let location: String // 지역 : 경기도 이천시

  let likeCount: String
  let scrapCount: String
  let hitCount: String
  let commentCount: String

  private enum CodingKeys: String, CodingKey {
    case id
    case coverImageUrlStr = "cover_image"
    case title
    case created
    case structure
    case floorSpace = "floor_space"
    case style
    case work
    case area
    case period
    case budget
    case family
    case detailPart = "detail_part"
    case location
    case likeCount = "like_count"
    case scrapCount = "scrap_count"
    case hitCount = "hit_count"
    case commentCount = "comment_count"
  }

}
