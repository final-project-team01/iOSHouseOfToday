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

  // MARK: - Properties
  let searchButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("스토어 검색", for: .normal)
    bt.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    bt.setImage(UIImage(named: "search"), for: .normal)
    bt.setTitleColor(.lightGray, for: .normal)
    bt.imageView?.tintColor = .lightGray
    bt.layer.cornerRadius = 5
    bt.backgroundColor = #colorLiteral(red: 0.9607055783, green: 0.9606983066, blue: 0.9567378163, alpha: 1)
    return bt
  }()

  let storeHomeView = StoreHomeView()

  init() {
    super.init(withTitles: ["홈"],
               withViews: [storeHomeView ],
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

    //storeHomeView.productCollectionView.delegate = self

    configureNaviBar()
    storeHomeViewDidScroll()

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
    initializeSearchButton()
  }

  // 창식 - viewDidAppear 시점에서 초기화 할 부분 , 초기화 이기에 1번만 실행되게 할 것
  private func initializeSearchButton() {
    if searchButton.tag == 0 {
      guard let titleView = navigationItem.titleView else { return logger("titleView is nil")}
      let leftInset = -(titleView.frame.size.width / 2 + 20)
      searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: 0)
      searchButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: leftInset + 15, bottom: 0, right: 0)
      searchButton.tag += 1
    }
  }

  // 창식 - storeHomeView 에서 스크롤 했을 때 받을 callback
  private func storeHomeViewDidScroll() {
    storeHomeView.storeHomeViewDidScroll = {
      direction in
      switch direction {
      case "up":
        print("storeHomeViewDidScroll // up")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
      case "down":
        print("storeHomeViewDidScroll // down")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
      default:
        break
      }
    }
  }

  // MARK: - 창식 - Custumizing NavigationBar
  private func configureNaviBar() {

    navigationItem.titleView = searchButton

    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()

    let leftItem = UIBarButtonItem(image: UIImage(named: "menu"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(menuButtonDidTap(_:)))
    leftItem.tintColor = .gray
    let rightItem = UIBarButtonItem(image: UIImage(named: "cart"),
                                    style: .plain,
                                    target: self,
                                    action: #selector(cartButtonDidTap(_:)))
    rightItem.tintColor = .gray

    navigationItem.setLeftBarButton(leftItem, animated: true)
    navigationItem.setRightBarButton(rightItem, animated: true)

    let buttonWidth = UIScreen.main.bounds.width - leftItem.width - rightItem.width
    searchButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: 35)
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

  @objc private func menuButtonDidTap(_ sender: Any) {
    print("Menu 버튼 클릭")
  }

  @objc private func cartButtonDidTap(_ sender: Any) {
    print("Cart 버튼 클릭")
  }

}
