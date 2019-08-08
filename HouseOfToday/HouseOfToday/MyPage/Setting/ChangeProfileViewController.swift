//
//  ChangeProfileViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ChangeProfileViewController: UIViewController {

  private lazy var changeProfileTableView: UITableView = {
    let tv = UITableView(frame: .zero)
    tv.allowsSelection = false
    tv.register(cell: SettingTableCell.self)
    tv.register(ChangeProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    tv.dataSource = self
    tv.delegate = self
    tv.tableFooterView = UIView()
    tv.backgroundColor = .white
    view.addSubview(tv)
    return tv
  }()

  private var profileData: (URL, String)? {
    didSet {
      DispatchQueue.main.async {
        self.changeProfileTableView.reloadData()
        print("url, nickName :", self.profileData)
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    fetchAccountList()
    makeConstraints()
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }

  private func configureNaviBar() {
    self.title = "프로필"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
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
          self.profileData = (url!, user.nickName)

        case .failure(let error):
          logger(error.localizedDescription)
        }
      }
    } else {
      logger("token is nothing")
    }
  }

  private func makeConstraints() {

    changeProfileTableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

}

extension ChangeProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeue(SettingTableCell.self)
    switch indexPath.row {
    case 0:
      cell.textLabel?.text = "닉네임"
      cell.isTextViewEditable = true
      if let profileData = self.profileData {
        cell.tailTextView.text = profileData.1
      } else {
        cell.tailTextView.text = ""
      }
    case 1:
      cell.textLabel?.text = "MY URL"
    default:
      break
    }
    return cell
  }

}

extension ChangeProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ChangeProfileHeaderView
    if let profileData = self.profileData {
      DispatchQueue.main.async {
        header.profileImageView.kf.setImage(with: profileData.0)
      }
    } else {
      header.profileImageView.backgroundColor = .white
    }
    return header
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UIScreen.main.bounds.height * 0.25
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 2 {
      return UIScreen.main.bounds.height * 0.1
    } else {
      return 45
    }
  }
}
