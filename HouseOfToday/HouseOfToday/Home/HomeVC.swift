//
//  HomeVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

final class HomeVC: CategoryTabBarViewController {

  private let notiCenter = NotificationCenter.default

  let searchButton: UIButton = {
    let bt = UIButton(type: .custom)
    bt.frame = .zero
    bt.setTitle("오늘의 집 검색", for: .normal)
    bt.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    bt.setImage(UIImage(named: "search"), for: .normal)
    bt.setTitleColor(.lightGray, for: .normal)
    bt.imageView?.tintColor = .lightGray
    bt.layer.cornerRadius = 5
    bt.backgroundColor = #colorLiteral(red: 0.9607055783, green: 0.9606983066, blue: 0.9567378163, alpha: 1)
    return bt
  }()

  let pictureView = PictureView()

  init() {
    super.init(withTitles: ["사진"],
               withViews: [pictureView],
               withScrollOption: false)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    removeObservers()
  }

  //  required init?(coder aDecoder: NSCoder) {
  //    fatalError("init(coder:) has not been implemented")
  //  }

  override func viewDidLoad() {
    super.viewDidLoad()
    addObservers()
    configureNaviBar()
    //homeViewDidScroll()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    initializeSearchButton()
  }

  // 창식 - viewDidAppear 시점에서 초기화 할 부분 , 초기화 이기에 1번만 실행되게 할 것
  private func initializeSearchButton() {
    if searchButton.tag == 0 {
      guard let titleView = navigationItem.titleView else { return logger("titleView is nil")}
      let leftInset = -(titleView.frame.size.width / 2 + 30)
      searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: 0)
      searchButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: leftInset + 15, bottom: 0, right: 0)
      searchButton.tag += 1
    }
  }

  private func addObservers() {
    notiCenter.addObserver(self,
                           selector: #selector(presentReplyVC(_:)),
                           name: .replyVC,
                           object: nil

    )
    notiCenter.addObserver(self,
                           selector: #selector(presentActivityC(_:)),
                           name: .activityC,
                           object: nil

    )
    notiCenter.addObserver(self,
                           selector: #selector(presentPicAlert(_:)),
                           name: .picAlert,
                           object: nil

    )
    notiCenter.addObserver(self,
                           selector: #selector(presentProductDetailVC(_:)),
                           name: StoreVC.presentProductDetail,
                           object: nil
    )
    notiCenter.addObserver(self,
                           selector: #selector(presentpicDetailID(_:)),
                           name: .picDetailID,
                           object: nil
    )
  }

  private func removeObservers() {
    notiCenter.removeObserver(self, name: .replyVC, object: nil)
    notiCenter.removeObserver(self, name: .activityC, object: nil)
    notiCenter.removeObserver(self, name: .picAlert, object: nil)
    notiCenter.removeObserver(self,
                              name: StoreVC.presentProductList,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: .picDetailID,
                              object: nil)
  }

  // 창식
  private func configureNaviBar() {

    navigationItem.titleView = searchButton

    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()

    let rightItem = UIBarButtonItem.setButton(self, action: #selector(cartButtonDidTap(_:)), imageName: "cart2")

    navigationItem.setRightBarButton(rightItem, animated: true)

    let buttonWidth = UIScreen.main.bounds.width - rightItem.width
    searchButton.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: 35)
  }

  // MARK: - Action Methods
  // 창식
  @objc private func cartButtonDidTap(_ sender: Any) {
    print("Cart 버튼 클릭")
  }

  // MARK: Notification Action Methods
  @objc func presentRankingDetailView(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: UIViewController],
      let detailRankingVC = userInfo["presentRankingDetailView"]
      else {
        return print("fail downCasting")
    }
    navigationController?.pushViewController(detailRankingVC, animated: true)
  }

  @objc private func presentReplyVC(_ sender: Notification) {
    print("fail downCasting")
    guard let userInfo = sender.userInfo as? [String: UIViewController],
      let vc = userInfo["ReplyVC"]
      else {
        return print("fail downCasting")
    }
    navigationController?.pushViewController(vc, animated: true)
  }

  @objc private func presentActivityC(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: UIActivityViewController],
      let vc = userInfo["ActivityVC"]
      else {
        return print("fail downCasting")
    }

    present(vc, animated: true)

  }

  @objc private func presentPicAlert(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: UIAlertController],
      let alert = userInfo["PicAlert"]
      else {
        return print("fail downCasting")
    }

    present(alert, animated: true)

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

  // MARK: - Callback
  // 창식 -  스크롤 했을 때 받을 callback
  /*
   private func homeViewDidScroll() {
   tempRankingView.tempRankingViewDidScroll = {
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
   */

  @objc private func presentpicDetailID(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: Int],
      let id = userInfo["PicDetailID"]
      else {
        return
      }

    let vc = PicDetailVC()

    vc.fetchPicDetailList(id: id)
    navigationController?.pushViewController(vc, animated: true)
  }

}
