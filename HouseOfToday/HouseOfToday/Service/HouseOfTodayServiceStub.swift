//
//  HouseOfTodayServiceStub.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 18/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

final class HouseOfTodayServiceStub: HouseOfTodayServiceType {

  func fetchStoreHome(completion: @escaping (Result<StoreHomeList, ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode(StoreHomeList.self, from: storeAllSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchRankingList(completion: @escaping (Result<RankingModel, ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode(RankingModel.self, from: storeRankingSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchCategoryList(completion: @escaping (Result<[CategoryList], ServiceError>) -> Void) {

    if let categoryList = try? JSONDecoder().decode([CategoryList].self, from: storeCategoryListSample) {
      completion(.success(categoryList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchProductList(completion: @escaping (Result<[ProductListTemp], ServiceError>) -> Void) {

    if let categoryList = try? JSONDecoder().decode([ProductListTemp].self, from: storeProductListSample) {
      completion(.success(categoryList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchCategoryIdList(id: Int, completion: @escaping (Result<CategoryIdList, ServiceError>) -> Void) {
    if let categoryList = try? JSONDecoder().decode(CategoryIdList.self, from: storeCategoryIdSample) {
      completion(.success(categoryList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchProductDetail(id: Int, completion: @escaping (Result<ProductDetail, ServiceError>) -> Void) {
    if let categoryList = try? JSONDecoder().decode(ProductDetail.self, from: storeProductDetailSample) {
      completion(.success(categoryList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  // FIXME: - Make Sample Data
  func fetchPictureList(completion: @escaping (Result<[PictureModel], ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode([PictureModel].self, from: storeRankingSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchPicDetailList(id: Int, completion: @escaping (Result<PicDetailModel, ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode(PicDetailModel.self, from: storeRankingSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchCartList(completion: @escaping (Result<[ShoppingOptionCart], ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode([ShoppingOptionCart].self, from: storeRankingSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchAccountList(with token: String, completion: @escaping (Result<[SocialUser], ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode([SocialUser].self, from: storeRankingSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchHouseWarmingDetail(with id: Int, completion: @escaping (Result<HouseWarmingDetail, ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode(HouseWarmingDetail.self, from: storeRankingSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

  func fetchHousewarmingList(completion: @escaping (Result<HousewarmingModel, ServiceError>) -> Void) {
    if let storeHomeList = try? JSONDecoder().decode(HousewarmingModel.self, from: storeRankingSample) {
      completion(.success(storeHomeList))
    } else {
      completion(.failure(.invalidFormat))
    }
  }

}
