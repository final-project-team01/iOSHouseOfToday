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
    setAddNoti()
    configureNaviBar()
    profileViewDidScroll()
    myshoppingViewDidScroll()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchAccountList()
  }

  private func setAddNoti() {
    notiCenter.addObserver(self, selector: #selector(presentPicCollectionView(_:)), name: .presentPhotoView, object: nil)
    notiCenter.addObserver(self, selector: #selector(trackDeliveryHistoryVC(_:)), name: .trackDeliveryHistoryVC, object: nil)
    notiCenter.addObserver(self, selector: #selector(presentProductScrapBookVC(_:)), name: .productScrapBookVC, object: nil)
    notiCenter.addObserver(self, selector: #selector(myQuestionsListVC(_:)), name: .myQuestionsListVC, object: nil)
    notiCenter.addObserver(self, selector: #selector(myReViewVC(_:)), name: .myReViewVC, object: nil)
    notiCenter.addObserver(self, selector: #selector(customerCenterVC(_:)), name: .customerCenterVC, object: nil)
    notiCenter.addObserver(self, selector: #selector(userWriteReviewVC(_:)), name: .userWriteReviewVC, object: nil)
    notiCenter.addObserver(self, selector: #selector(myShoppingButtonDidTap(_:)), name: .presentpresentMyShoppingView, object: nil)
    notiCenter.addObserver(self, selector: #selector(accountNoti(_:)), name: NSNotification.Name(rawValue: "Login"), object: nil)
    notiCenter.addObserver(self, selector: #selector(accountNoti(_:)), name: NSNotification.Name(rawValue: "Logout"), object: nil)
  }

  deinit {
    notiCenter.removeObserver(self, name: .presentPhotoView, object: nil)
    notiCenter.removeObserver(self, name: .trackDeliveryHistoryVC, object: nil)
    notiCenter.removeObserver(self, name: .productScrapBookVC, object: nil)
    notiCenter.removeObserver(self, name: .myQuestionsListVC, object: nil)
    notiCenter.removeObserver(self, name: .myReViewVC, object: nil)
    notiCenter.removeObserver(self, name: .customerCenterVC, object: nil)
    notiCenter.removeObserver(self, name: .userWriteReviewVC, object: nil)
    notiCenter.removeObserver(self, name: .presentpresentMyShoppingView, object: nil)
    notiCenter.removeObserver(self, name: NSNotification.Name(rawValue: "Login"), object: nil)
    notiCenter.removeObserver(self, name: NSNotification.Name(rawValue: "Logout"), object: nil)
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
    announceActivity()
  }

  private func announceActivity() {
    let activityVC = UIActivityViewController(activityItems: ["공유"], applicationActivities: nil)
    activityVC.excludedActivityTypes = [.airDrop, .mail, .message, .print]
    self.present(activityVC, animated: true, completion: nil)
  }

  // MARK: - Networking
  private func fetchAccountList() {
    // MARK: - Networking
    if let tokenInfo = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String],
      let token = tokenInfo["token"] {
      DataManager.shard.service.fetchAccountList(with: token) {
        result in
        switch result {
        case .success(let socialUser):
          let user = socialUser.first!
          let url = URL(string: user.profileImageUrlStr)
          self.profileView.profileData = (url!, user.nickName)

        case .failure(let error):
          logger(error.localizedDescription)
        }
      }
    } else {
      logger("token is nothing")

    }
  }

  @objc private func myShoppingButtonDidTap(_ sender: Any) {

//    self.indicatorBarView.didSelectCategoryCell = IndexPath(item: 1, section: 0)
//    self.didSelectedCategoryCell = IndexPath(item: 1, section: 0)
//    UIView.animate(withDuration: 0.5,
//                    delay: 0,
//                    usingSpringWithDamping: 0.7,
//                    initialSpringVelocity: 1,
//                    options: .curveEaseInOut,
//                    animations: {
//                    self.view.layoutIfNeeded()
//    },
//                    completion: nil)
//    let xOffset = UIScreen.main.bounds.width
//    self.categoryView.pageCollectionView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
//    self.categoryTabBarView.categoryTabBarCollectionView.selectItem(at: IndexPath(item: 1, section: 0), animated: false, scrollPosition: .centeredHorizontally)
    self.categoryTabBarView.collectionView(self.categoryTabBarView.categoryTabBarCollectionView, didSelectItemAt: IndexPath(item: 1, section: 0))
    self.categoryTabBarView.categoryTabBarCollectionView.selectItem(at: IndexPath(item: 1, section: 0), animated: false, scrollPosition: .centeredHorizontally)
  }

  @objc private func accountNoti(_ sender: Any) {
    self.profileView.tableView.reloadData()
  }

  @objc private func settingDidTap(_ sender: Any) {
    print("설정 버튼 클릭됨")
    self.navigationController?.pushViewController(SettingViewController(), animated: true)
  }

  @objc func presentPicCollectionView(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: UICollectionViewController],
    let picCollectionView = userInfo["uploadPicCollectionView"]
      else {
        return print("fail downCasting")
    }
    present(picCollectionView, animated: true)
  }

  // selected row
  @objc func trackDeliveryHistoryVC(_ sender: Notification) {
    guard let vc = sender.userInfo as? [String: UIViewController],
      let trackDeliveryHistoryVC = vc["TrackDeliveryHistoryVC"]
      else {
        return print("fail downCasting")
    }
    print("trackDeliveryHistoryVC")
    navigationController?.pushViewController(trackDeliveryHistoryVC, animated: true)
  }

  @objc func presentProductScrapBookVC(_ sender: Notification) {
    guard let vc = sender.userInfo as? [String: UIViewController],
      let productScrapBookVC = vc["ProductScrapBookVC"]
      else {
        return print("fail downCasting")
    }
    navigationController?.pushViewController(productScrapBookVC, animated: true)
  }

  @objc func myQuestionsListVC(_ sender: Notification) {
    guard let vc = sender.userInfo as? [String: UIViewController],
      let myQuestionsListVC = vc["MyQuestionsListVC"]
      else {
        return print("fail downCasting")
    }
    navigationController?.pushViewController(myQuestionsListVC, animated: true)
  }

  @objc func myReViewVC(_ sender: Notification) {
    guard let vc = sender.userInfo as? [String: UIViewController],
      let myReViewVC = vc["MyReViewVC"]
      else {
        return print("fail downCasting")
    }
    navigationController?.pushViewController(myReViewVC, animated: true)
  }

  @objc func customerCenterVC(_ sender: Notification) {
    guard let vc = sender.userInfo as? [String: UIViewController],
      let customerCenterVC = vc["CustomerCenterVC"]
      else {
        return print("fail downCasting")
    }
    navigationController?.pushViewController(customerCenterVC, animated: true)
  }

  @objc func userWriteReviewVC(_ sender: Notification) {
    guard let vc = sender.userInfo as? [String: UIViewController],
    let userWriteReviewVC = vc["UserWriteReviewVC"]
      else {
        return print("fail downCasting")
    }
    navigationController?.pushViewController(userWriteReviewVC, animated: true)
  }

}

// MARK: - 창식 - Callback
extension MyPageVC {
  private func profileViewDidScroll() {
    profileView.profileViewDidScroll = {
      direction in
      hideNaviBarWhenUserDidScroll(to: direction, with: self.navigationController, where: "profileView")
    }
  }

  private func myshoppingViewDidScroll() {
    myshoppingView.myshoppingViewDidScroll = {
      direction in
      hideNaviBarWhenUserDidScroll(to: direction, with: self.navigationController, where: "myshoppingView")
    }
  }
}
