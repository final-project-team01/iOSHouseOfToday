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
    super.init(withTitles: ["홈"],
               withViews: [StoreHomeView() ],
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

    let bt = UIButton(type: .custom)
    bt.setTitle("스토어 검색", for: .normal)
    bt.setImage(UIImage(named: "search"), for: .normal)
    bt.setTitleColor(.lightGray, for: .normal)
    bt.imageView?.tintColor = .lightGray
    bt.imageEdgeInsets = UIEdgeInsets(top: 0, left: -140, bottom: 0, right: 0)
    bt.titleEdgeInsets = UIEdgeInsets(top: 0, left: -130, bottom: 0, right: 0)

    bt.layer.cornerRadius = 5
    bt.backgroundColor = #colorLiteral(red: 0.9607055783, green: 0.9606983066, blue: 0.9567378163, alpha: 1)
    navigationItem.titleView = bt

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

    let width = UIScreen.main.bounds.width - leftItem.width - rightItem.width
    bt.frame = CGRect(x: 0, y: 0, width: width, height: 60)
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

extension UIColor {

  /// Converts this `UIColor` instance to a 1x1 `UIImage` instance and returns it.
  ///
  /// - Returns: `self` as a 1x1 `UIImage`.
  func as1ptImage() -> UIImage {
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    setFill()
    UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
    let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    UIGraphicsEndImageContext()
    return image
  }
}
