//
//  StoreVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension StoreVC {
  static var presentProductList: Notification.Name {
    return Notification.Name("presentPL")
  }
  static var presentProductDetail: Notification.Name {
    return Notification.Name("presentPD")
  }
//  static var presentProduct: Notification.Name {
//    return Notification.Name("presentPL")
//  }
}

final class StoreVC: CategoryTabBarViewController {

  init() {
    super.init(withTitles: ["홈", "랭킹"],
               withViews: [StoreHomeView(), TempRankingView()],
               withScrollOption: false)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  let notiCenter = NotificationCenter.default

//  let storeHomeView = StoreHomeView()

  override func viewDidLoad() {
    super.viewDidLoad()
    print("StoreVC: viewDidLoad")

    customizeNaviBar()

    notiCenter.addObserver(self,
                           selector: #selector(presentCategoryListVC(_:)),
                           name: StoreVC.presentProductList,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(presentProductDetailVC(_:)),
                           name: StoreVC.presentProductDetail,
                           object: nil)
  }

  deinit {
    notiCenter.removeObserver(self,
                              name: StoreVC.presentProductList,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: StoreVC.presentProductDetail,
                              object: nil)
  }
//
//  override func loadView() {
//    view = storeHomeView
//    print("StoreVC: loadView")
//
//  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
  }

  // MARK: - Custumizing NavigationBar - 창식
  private func customizeNaviBar() {
//    let searchController = UISearchController(searchResultsController: nil)
//    searchController.searchBar.placeholder = "피자 검색!"
//    searchController.obscuresBackgroundDuringPresentation = false
//    let naviBar = self.navigationController?.navigationBar
//    naviBar?.isTranslucent = true
//    naviBar?.barStyle = .default
//    naviBar?.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//    let item = UINavigationItem(title: "gg")
//    self.navigationItem.searchController = searchController

    let button = UIButton(type: .system)
    button.setTitle("test", for: .normal)
    let barButtonItem = UIBarButtonItem(customView: button)
    navigationItem.rightBarButtonItem = barButtonItem
  }

  // MARK: - present VC
  @objc private func presentCategoryListVC(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: Int],
      let id = userInfo["categoryId"]
      else {
        return print("fail down casting")
    }

    let vc = CategoryProductListView()
    vc.fetchCategoryID(id: id)

    navigationController?.pushViewController(vc, animated: true)
  }

  @objc private func presentProductDetailVC(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: Int],
      let id = userInfo["productID"]
      else {
        return
    }

    let vc = ProductDetailVC()
    vc.fetchProductDetail(id: id)

    navigationController?.pushViewController(vc, animated: true)
  }
}
