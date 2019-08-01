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
    tv.sectionHeaderHeight = 30
    //tv.sectionIndexBackgroundColor = #colorLiteral(red: 0.9373082519, green: 0.9340973496, blue: 0.9528850913, alpha: 1)
    view.addSubview(tv)
    return tv
  }()

  private let sectionView: UIView = {
    let v = UIView(frame: .zero)
    v.backgroundColor = #colorLiteral(red: 0.9373082519, green: 0.9340973496, blue: 0.9528850913, alpha: 1)
    return v
  }()

  private let firstSection = ["프로필 수정", "맞춤정보 설정", "비밀번호 변경", "푸쉬 알림 설정", "내가 본 콘텐츠", "내 활동"]
  private let secondSection = ["오늘의집이 궁금해요", "FAQ", "의견 보내기", "서비스 이용 약관", "개인정보 보호정책", "버전 정보"]
  private var thirdSection = "로그인"

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

  private func configureNaviBar() {
    self.title = "설정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
  }

  // 로그인 로그아웃 정보 받는 Notification
  private func observeNotifications() {
    noti.addObserver(self, selector: #selector(loginOrLogoutNoti(_:)), name: NSNotification.Name(rawValue: "Login"), object: nil)
    noti.addObserver(self, selector: #selector(loginOrLogoutNoti(_:)), name: NSNotification.Name(rawValue: "Logout"), object: nil)
  }

  // MARK: - Action Methods
  @objc private func loginOrLogoutNoti(_ sender: Notification) {
    switch sender.name.rawValue {
    case "Login":
      self.thirdSection = "로그아웃"
    case "Logout":
      self.thirdSection = "로그인"
    default:
      break
    }
    self.settingTableView.reloadData()
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
    case 2:
      cell.textLabel?.text = thirdSection
    default:
      cell.textLabel?.text = "error"
    }
    cell.textLabel?.textColor = .darkGray
    cell.textLabel?.font = .systemFont(ofSize: 17, weight: .ultraLight)
    return cell
  }

}

// MARK: - TableView Delegate
extension SettingViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case 0:
      switch indexPath.row {
      case 0:
        print("프로필 수정 클릭")
      default:
        break
      }
    case 1:
      switch indexPath.row {
      case 0:
        print("오늘의집이 궁금해요 클릭")
        self.navigationController?.pushViewController(SecondSectionViewController(withURL: "http://bucketplace.co.kr/brand-story"), animated: true)
      case 1:
        print("FAQ 클릭")
      case 2:
        print("의견 보내기")
      case 3:
        print("서비스 이용 약관")
      case 4:
        print("개인정보 보호정책")
      default:
        break
      }
    case 2:
      print("\(thirdSection) 버튼 클릭됨")
      configureLoginOrOut()
    default:
      break
    }
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
