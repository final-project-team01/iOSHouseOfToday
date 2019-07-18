//
//  HouseOfTodayService.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 14/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

final class HouseOfTodayService: HouseOfTodayServiceType {
  let baseURL = "http://52.78.112.247"

  func fetchProductCategoryList(completion: @escaping (Result<[CategoryList], ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/category/list/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

//      if let jsonObject = try? JSONSerialization.jsonObject(with: data) {
//        print("fetchProductCategoryList: \(jsonObject)")
//      }

      if let categoryList = try? JSONDecoder().decode([CategoryList].self, from: data) {
        completion(.success(categoryList))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()

  }

}
