//
//  SettingViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

  // MARK: - Properties
  private lazy var settingTableView: UITableView = {
    let tv = UITableView(frame: .zero)
    tv.register(cell: UITableViewCell.self)
    tv.dataSource = self
    tv.delegate = self

    view.addSubview(tv)
    return tv
  }()
  private var state = ""
  private let firstSection = ["프로필 수정", "맞춤정보 설정", "비밀번호 변경", "푸쉬 알림 설정"]
  private let secondSection = ["오늘의집이 궁금해요", "FAQ", "의견 보내기", "서비스 이용 약관", "개인정보 보호정책", "버전 정보"]
  private var thirdSection: String {
    get {
      if let _ = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String] {
        return "로그아웃"
      } else {
        return "로그인"
      }
    }
  }

  let noti = NotificationCenter.default

  // MARK: - VC LifeCycle
    override func viewDidLoad() {
      super.viewDidLoad()
      configureNaviBar()
      makeConstraints()
      observeNotifications()
    }

  deinit {
    noti.removeObserver(self, name: NSNotification.Name(rawValue: "Login"), object: nil)
    noti.removeObserver(self, name: NSNotification.Name(rawValue: "Logout"), object: nil)
  }

  // // MARK: - Notification Methods
  private func observeNotifications() {
    noti.addObserver(self, selector: #selector(loginOrLogoutNoti(_:)), name: NSNotification.Name(rawValue: "Login"), object: nil)
    noti.addObserver(self, selector: #selector(loginOrLogoutNoti(_:)), name: NSNotification.Name(rawValue: "Logout"), object: nil)
  }

  @objc private func loginOrLogoutNoti(_ sender: Notification) {
    self.settingTableView.reloadData()
  }

  private func configureNaviBar() {
    self.title = "설정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)

    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()

    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - Autolayout
  private func makeConstraints() {
    settingTableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
}

// MARK: - TableViewDataSource
extension SettingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return " "
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return firstSection.count
    case 1:
      return secondSection.count
    case 2:
      return 1
    default:
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(UITableViewCell.self)
    switch indexPath.section {
    case 0:
      cell.textLabel?.text = firstSection[indexPath.row]
    case 1:
      cell.textLabel?.text = secondSection[indexPath.row]
      if indexPath.row == 5 {
        cell.detailTextLabel?.text = "7.3.14"
      }
    case 2:
      cell.textLabel?.text = thirdSection
    default:
      cell.textLabel?.text = "error"
    }
    cell.textLabel?.textColor = .black
    cell.textLabel?.font = .systemFont(ofSize: 17, weight: .ultraLight)
    cell.selectionStyle = .none
    return cell
  }

}

// MARK: - TableView Delegate
extension SettingViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case 0: // 첫 번째 섹션
      switch indexPath.row {
      case 0:
        print("프로필 수정 클릭")
      case 1:
        print("맞춤정보 설정 클릭")
      case 2:
        print("비밀번호 변경")
        pushWebView(with: "https://ohou.se/users/4502981/edit_password")
      case 3:
        print("푸쉬 알림 설정 클릭")
        self.navigationController?.pushViewController(PushAlertViewController(), animated: true)
      default:
        break
      }
    case 1: // 두 번째 섹션
      switch indexPath.row {
      case 0:
        print("오늘의집이 궁금해요 클릭")
        pushWebView(with: "http://bucketplace.co.kr/brand-story")
      case 1:
        print("FAQ 클릭")
        pushWebView(with: "https://ohou.se/customer_center")
      case 2:
        print("의견 보내기")
        pushWebView(with: "https://ohou.se/contacts/new")
      case 3:
        print("서비스 이용 약관")
        pushWebView(with: "https://ohou.se/usepolicy")
      case 4:
        print("개인정보 보호정책")
        pushWebView(with: "https://ohou.se/privacy")
      default:
        break
      }
    case 2: // 마지막 섹션
      print("\(thirdSection) 버튼 클릭됨")
      configureLoginOrOut()
    default:
      break
    }
  }

  private func pushWebView(with urlString: String) {
    self.navigationController?.pushViewController(SecondSectionViewController(withURLString: urlString), animated: true)
  }

  private func configureLoginOrOut() {
    if let tokenInfo = UserDefaults.standard.object(forKey: "tokenInfo") as? [String: String],
      let type = tokenInfo["type"] {
      UserDefaults.standard.removeObject(forKey: "tokenInfo")
      NotificationCenter.default.post(name: NSNotification.Name("LoginDidChange"),
                                      object: nil,
                                      userInfo: ["type": (type, "logout")])
    } else {
      logger("로그아웃 하기 전인데 토큰 정보가 없습니다. 둘러보기로 왔으니 보내드립니다.")
      NotificationCenter.default.post(name: NSNotification.Name("LoginDidChange"),
                                      object: nil,
                                      userInfo: ["type": ("lookAround", "logout")])
    }
  }
}
