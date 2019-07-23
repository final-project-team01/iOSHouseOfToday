//
//  RankingVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit
import SnapKit

class RankingVC: UIViewController {

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self.self
    tableView.register(cell: RankingTableCell.self)
    tableView.allowsSelection = false
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

extension RankingVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableCell.identifier, for: indexPath) as! RankingTableCell
    return cell
  }

}
