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
//    tableView.register(cell: ProfileUserCell.self)
    tableView.register(cell: ProfileBaseCell.self)
//    tableView.rowHeight = 220 // FIXME: - 셀높이 임시 저장
    tableView.rowHeight = 120
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

// FIXME: - 각각의 셀높이 조정
extension ProfileVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell

    return cell

//    switch indexPath.row {
//    case 0:
//      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserCell.identifier, for: indexPath) as! ProfileUserCell
//      cell.backgroundColor = .red
//      return cell

//      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserCell.identifier, for: indexPath) as! ProfileUserCell
//      cell.backgroundColor = .yellow
//      return cell
//
//    default:
//      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
//      return cell
//    }

  }

}
