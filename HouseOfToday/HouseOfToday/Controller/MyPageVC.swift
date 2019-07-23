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

  init() {
    super.init(withTitles: ["프로필", "나의 쇼핑"],
             withViews: [ProfileView(), MyshoppingView() ],
             withScrollOption: false)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    notiCenter.addObserver(self, selector: #selector(presentPicCollectionView(_:)), name: .presentPhotoView, object: nil)
  }

  deinit {
    notiCenter.removeObserver(self, name: .presentPhotoView, object: nil)
  }

  @objc func uploadPictureAlertPresent(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: UIAlertController],
      let alert = userInfo["alert"]
      else {
        return print("fail downCasting")
    }
    present(alert, animated: true)

  }

  @objc func presentPicCollectionView(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: UICollectionViewController],
    let picCollectionView = userInfo["uploadPicCollectionView"]
      else {
        return print("fail downCasting")
    }
    present(picCollectionView, animated: true)
  }

}
