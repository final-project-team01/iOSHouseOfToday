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

  // MARK: - VC LifeCycle
    override func viewDidLoad() {
      super.viewDidLoad()
      configureNaviBar()
      makeConstraints()
    }
  
  private func configureNaviBar() {
    self.title = "설정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
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
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 6
    case 1:
      return 6
    case 2:
      return 1
    default:
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(UITableViewCell.self)
    cell.textLabel?.text = "프로필"
    return cell
  }

}

// MARK: - TableView Delegate
extension SettingViewController: UITableViewDelegate {

}
