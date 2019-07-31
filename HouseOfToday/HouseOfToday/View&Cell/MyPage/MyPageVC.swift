//
//  MyPageVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class MyPageVC: CategoryTabBarViewController {

  private let notiCenter = NotificationCenter.default

  let profileView = ProfileView()
  let myshoppingView = MyshoppingView()

  init() {
    super.init(withTitles: ["프로필", "나의 쇼핑"],
             withViews: [ profileView, myshoppingView ],
             withScrollOption: false)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    configureNaviBar()
    profileViewDidScroll()
    myshoppingViewDidScroll()
  }

  deinit {
    notiCenter.removeObserver(self, name: .presentPhotoView, object: nil)
    notiCenter.removeObserver(self, name: .presentpresentMyShoppingView, object: nil)
  }

  // 정아 - Notification Observers 
  private func addObservers() {
    notiCenter.addObserver(self, selector: #selector(presentPicCollectionView(_:)), name: .presentPhotoView, object: nil)

    notiCenter.addObserver(self, selector: #selector(presentpresentMyShoppingView(_:)), name: .presentpresentMyShoppingView, object: nil)
  }

  // MARK: - 창식 - Custumizing NavigationBar
  private func configureNaviBar() {

    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()

    let cartItem = UIBarButtonItem.setButton(self, action: #selector(cartDidTap(_:)), imageName: "cart2")
    let shareItem = UIBarButtonItem.setButton(self, action: #selector(shareDidTap(_:)), imageName: "share2")
    let settingItem = UIBarButtonItem.setButton(self, action: #selector(settingDidTap(_:)), imageName: "setting")

    let items = [cartItem, shareItem, settingItem]
    navigationItem.setRightBarButtonItems(items, animated: true)
  }

  @objc private func cartDidTap(_ sender: Any) {
    print("장바구니 클릭됨")
  }

  @objc private func shareDidTap(_ sender: Any) {
    print("공유하기 버튼 클릭됨")
  }

  @objc private func settingDidTap(_ sender: Any) {
    print("설정 버튼 클릭됨")
  }

//  @objc func uploadPictureAlertPresent(_ sender: Notification) {
//    guard let userInfo = sender.userInfo as? [String: UIAlertController],
//      let alert = userInfo["alert"]
//      else {
//        return print("fail downCasting")
//    }
//    present(alert, animated: true)
//
//  }

  @objc func presentPicCollectionView(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: UICollectionViewController],
    let picCollectionView = userInfo["uploadPicCollectionView"]
      else {
        return print("fail downCasting")
    }
    present(picCollectionView, animated: true)
  }

  @objc func presentpresentMyShoppingView(_ sender: Notification) {
//    guard let userInfo = sender.userInfo as? [String: UIViewController],
//      let shoppingView = userInfo["presentMyShoppingView"]
//      else {
//        return print("fail downCasting")
//    }
//     navigationController?.pushViewController(shoppingView, animated: true)
  }
}

// MARK: - 창식 - Callback
extension MyPageVC {
  private func profileViewDidScroll() {
    profileView.profileViewDidScroll = {
      direction in
      switch direction {
      case "up":
        print("rankingViewDidScroll // up")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
      case "down":
        print("rankingViewDidScroll // down")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
      default:
        break
      }
    }
  }

  private func myshoppingViewDidScroll() {
    myshoppingView.myshoppingViewDidScroll = {
      direction in
      switch direction {
      case "up":
        print("rankingViewDidScroll // up")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
      case "down":
        print("rankingViewDidScroll // down")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
      default:
        break
      }
    }
  }
}
