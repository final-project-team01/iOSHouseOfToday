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
  
//  let baseURL = "http://clonehouseoftodayapi.jinukk.me/"

  func fetchStoreHome(completion: @escaping (Result<StoreHomeList, ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/storehome/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      if let storeHomeList = try? JSONDecoder().decode(StoreHomeList.self, from: data) {
        completion(.success(storeHomeList))
      } else {
        completion(.failure(.invalidFormat))
      }
      }.resume()

  }

  func fetchCategoryList(completion: @escaping (Result<[CategoryList], ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/category/list/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      if let categoryList = try? JSONDecoder().decode([CategoryList].self, from: data) {
        completion(.success(categoryList))
      } else {
        completion(.failure(.invalidFormat))
      }
      }.resume()

  }

  func fetchProductList(completion: @escaping (Result<[ProductListTemp], ServiceError>) -> Void) {
    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/product/list/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      //      guard let str = try? JSONSerialization.jsonObject(with: data, options: []) else { return print("JSONSerialization")}

      //      print(str)

      if let productList = try? JSONDecoder().decode([ProductListTemp].self, from: data) {
        print("success")
        completion(.success(productList))
      } else {
        completion(.failure(.invalidFormat))
      }
      }.resume()
  }

  func fetchCategoryIdList(id: Int, completion: @escaping (Result<CategoryIdList, ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/category/\(id)/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      //      guard let str = try? JSONSerialization.jsonObject(with: data, options: []) else { return print("JSONSerialization")}

      //            print(str)

      if let productList = try? JSONDecoder().decode(CategoryIdList.self, from: data) {
        completion(.success(productList))
      } else {
        completion(.failure(.invalidFormat))
      }
    }.resume()
  }

  func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, ServiceError>) -> Void) {
    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/product/\(id)/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      if let productList = try? JSONDecoder().decode(ProductDetail.self, from: data) {
        completion(.success(productList))
      } else {
        completion(.failure(.invalidFormat))
      }
    }.resume()
  }

  func fetchRankingList(completion: @escaping (Result<RankingModel, ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/ranking/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else {return completion(.failure(.clientError))}

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {return completion(.failure(.noData))}

      guard let data = data else {return completion(.failure(.noData))}

      if let rankingList = try? JSONDecoder().decode(RankingModel.self, from: data) {
        completion(.success(rankingList))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()

  }

  func postSignUpUserData(withBody body: Data?, completion: @escaping (Result<User, ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/accounts/create/"
    guard let url = urlComp?.url else { return logger("guard get url fail")}

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"

    urlRequest.httpBody = body
    urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      let statusCode = (response as! HTTPURLResponse).statusCode
      if statusCode == 400 {
        if let data = data,
          let errorMessage = try? JSONSerialization.jsonObject(with: data) as? [String: String] {
          print("postSignUpUserData Status Code : \(statusCode) / error Message : \(errorMessage)")
        } else {
          logger(" error message parsing error ")
        }
      }

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      if let user = try? JSONDecoder().decode(User.self, from: data) {
        completion(.success(user))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()
  }

  func postLoginDataForGetToKen(toPath path: String, withBody body: Data?, completion: @escaping (Result<String, ServiceError>) -> Void) {
    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = path
    guard let url = urlComp?.url else { return logger("guard get url fail")}

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"

    urlRequest.httpBody = body
    urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

      print("postLoginDataForGetToKen response Status Code : ", (response as! HTTPURLResponse).statusCode)

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: String],
        let token = jsonObject["token"] {
        completion(.success(token))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()
  }

  func fetchPictureList(completion: @escaping (Result<[PictureModel], ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/community/photo/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else {return completion(.failure(.clientError))}

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {return completion(.failure(.noData))}

      guard let data = data else {return completion(.failure(.noData))}

      if let pictureThumbList = try? JSONDecoder().decode([PictureModel].self, from: data) {
        completion(.success(pictureThumbList))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()

  }

  func postShoppingCartItem(cartData: Data, completion: @escaping (Result<ShoppingOptionCart, ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/orderitem/"
    guard let url = urlComp?.url else { return logger("guard get url fail")}

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"

    urlRequest.httpBody = cartData
    urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    //    urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    urlRequest.addValue("Token 69e86dfbeca27eec3f6a96c0addffd9f272449e2", forHTTPHeaderField: "Authorization")

    print(urlRequest.allHTTPHeaderFields)
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

      print("response Status Code : ", (response as! HTTPURLResponse).statusCode)

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      guard let str = try? JSONSerialization.jsonObject(with: data, options: []) else { return print("JSONSerialization Error")}

      print(str)

      if let shoppingOptionCart = try? JSONDecoder().decode(ShoppingOptionCart.self, from: data) {
        completion(.success(shoppingOptionCart))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()

  }

  func fetchPicDetailList(id: Int, completion: @escaping (Result<PicDetailModel, ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/community/photo/\(id)/"

    guard let url = urlComp?.url else { return print("guard get url fail")}

    URLSession.shared.dataTask(with: url) { (data, response, error) in

      guard error == nil else {return completion(.failure(.clientError))}

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode else {return completion(.failure(.noData))}

      guard let data = data else {return completion(.failure(.noData))}

      if let picDetailList = try? JSONDecoder().decode(PicDetailModel.self, from: data) {
        completion(.success(picDetailList))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()

  }

  func postOrderProducts(data: Data, completion: @escaping (Result<OrderProductList, ServiceError>) -> Void) {

    var urlComp = URLComponents(string: baseURL)
    urlComp?.path = "/products/order_direct/create/"
    guard let url = urlComp?.url else { return logger("guard get url fail")}

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"

    urlRequest.httpBody = data
    urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    urlRequest.addValue("Token 69e86dfbeca27eec3f6a96c0addffd9f272449e2", forHTTPHeaderField: "Authorization")

    //    print(urlRequest.allHTTPHeaderFields)
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in

      print("response Status Code : ", (response as! HTTPURLResponse).statusCode)

      guard error == nil else { return completion(.failure(.clientError)) }

      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return completion(.failure(.invalidStatusCode)) }

      guard let data = data else { return completion(.failure(.noData)) }

      guard let str = try? JSONSerialization.jsonObject(with: data, options: []) else { return print("JSONSerialization Error")}

      print(str)

      if let orderProducts = try? JSONDecoder().decode(OrderProductList.self, from: data) {
        completion(.success(orderProducts))
      } else {
        completion(.failure(.invalidFormat))
      }

    }.resume()
  }
}
