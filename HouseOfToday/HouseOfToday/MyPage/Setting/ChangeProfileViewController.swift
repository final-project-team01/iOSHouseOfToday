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
    tv.backgroundColor = .green
    view.addSubview(tv)
    return tv
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    makeConstraints()
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }
  private func configureNaviBar() {
    self.title = "프로필 수정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  private func makeConstraints() {

    changeProfileTableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

}

extension ChangeProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeue(SettingTableCell.self)
    switch indexPath.row {
    case 0:
      cell.textLabel?.text = "닉네임"
      cell.isTextViewEditable = true
      cell.tailTextView.text = "test"
    case 1:
      cell.textLabel?.text = "MY URL"
    case 2:
      cell.textLabel?.text = "한 줄 소개"
      cell.isNeedTextField = true
    default:
      break
    }
    return cell
  }

}

extension ChangeProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ChangeProfileHeaderView

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
