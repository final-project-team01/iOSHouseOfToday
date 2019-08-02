//
//  ChangeProfileViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ChangeProfileViewController: UIViewController {

  private lazy var backgroundImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.backgroundColor = .red
    view.addSubview(iv)
    return iv
  }()

  private lazy var profileImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.backgroundColor = .yellow
    backgroundImageView.addSubview(iv)
    return iv
  }()

  private lazy var changeProfileTableView: UITableView = {
    let tv = UITableView(frame: .zero)
    tv.allowsSelection = false
    tv.register(cell: SettingTableCell.self)
    tv.register(cell: UITableViewCell.self)
    tv.dataSource = self
    tv.backgroundColor = .green
    view.addSubview(tv)
    return tv
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureNaviBar()
    makeConstraints()
  }

  private func makeConstraints() {

    profileImageView.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.33)
      $0.height.equalTo(profileImageView.snp.width)
    }

    changeProfileTableView.snp.makeConstraints {
      $0.top.equalTo(backgroundImageView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }

  private func configureNaviBar() {
    self.title = "프로필 수정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)

    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}

extension ChangeProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeue(SettingTableCell.self)
    switch indexPath.row {
    case 1:
      cell.textLabel?.text = "닉네임"
      cell.tailTextView.text = "test"
    case 2:
      cell.textLabel?.text = "MY URL"
    case 3:
      cell.textLabel?.text = "한 줄 소개"
      cell.isNeedTextField = true
    default:
      break
    }
    return cell
  }
}
