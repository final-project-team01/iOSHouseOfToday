//
//  PofileVC.swift
//  HouseOfToday
//
//  Created by Daisy on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class ProfileVC: UIViewController {

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: ProfileUserCell.self)
    tableView.register(cell: ProfileBaseCell.self)
    view.addSubview(tableView)
    return tableView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    tableViewAutoLayout()

  }

  private func tableViewAutoLayout() {

    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()

    }

  }

}

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserCell.identifier, for: indexPath) as! ProfileUserCell
      cell.backgroundColor = .red
      return cell

    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
      // subtitle 없애기
      return cell

    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
      return cell
    }

  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
    case 0:
      return 200
    case 1:
      return 100
    default:
      return 70

    }

  }

}
