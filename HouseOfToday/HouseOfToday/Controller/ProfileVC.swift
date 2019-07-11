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
    tableView.register(cell: ProfileUserCell.self)
    tableView.rowHeight = 220 // FIXME: - 셀높이 임시 저장
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

extension ProfileVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserCell.identifier, for: indexPath) as! ProfileUserCell
    // FIXME: - 각각의 셀높이 조정
    return cell

//    switch indexPath.row {
//    case 0:
//      let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileUserCell", for: indexPath) as! ProfileUserCell
//
//      return cell
//    default:
//      let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileUserCell", for: indexPath) as! ProfileUserCell
//      return cell
//    }

  }

}
