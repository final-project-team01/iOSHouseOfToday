//
//  FontFoundation.swift
//  HouseOfToday
//
//  Created by Daisy on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

enum FontFoundation {

  //오늘의딜
  static var titleFont: UIFont {
  return UIFont.boldSystemFont(ofSize: 20)
  }

  //최대 81% 타임특가
  static var subtitleFont: UIFont {
    return UIFont.boldSystemFont(ofSize: 15)
  }

  //더보기 버튼 ex)최대 78% 타임특가 보기 〉
  static var moreButtinFont: UIFont {
    return UIFont.boldSystemFont(ofSize: 17)
  }

  //브랜드 폰트 크기
  static var brandnameFont: UIFont {
    return UIFont.systemFont(ofSize: 15)
  }

  //별점,리뷰 폰트 크기
  static var starReviewFont: UIFont {
    return UIFont.boldSystemFont(ofSize: 12)
  }

  //브랜드, 리뷰 색상
  static var brandnameReviewColor: UIColor {
    return #colorLiteral(red: 0.6406203994, green: 0.6406203994, blue: 0.6406203994, alpha: 1)
  }

  //브랜드 타이틀 크기
  static var brandTitleFont: UIFont {
    return UIFont.systemFont(ofSize: 15)
  }

  //브랜드 타이틀 색상
  static var brandTitleColor: UIColor {
    return #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
  }

  //가격 크기
  static var priceFont: UIFont {
    return UIFont.boldSystemFont(ofSize: 20)
  }

  //가격 색상
  static var priceColor: UIColor {
    return #colorLiteral(red: 0.1772814812, green: 0.1772814812, blue: 0.1772814812, alpha: 1)
  }

  //메인 색상
  static var mainColor: UIColor {
    return #colorLiteral(red: 0.08574206382, green: 0.7608343959, blue: 0.9359433651, alpha: 1)
  }

}
