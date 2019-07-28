//
//  DetailRankingVC.swift
//  HouseOfToday
//
//  Created by Daisy on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
// FIXME: - present 아니고 navi로 해야할듯

class DetailRankingVC: UIViewController {

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: DetailRankingTableCell.self)
    tableView.showsVerticalScrollIndicator = false
    tableView.allowsSelection = false
    tableView.rowHeight = 100 // FIXME: - 임시
    view.addSubview(tableView)
    return tableView
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .green
      configureAutoLayout()
    }

  private func configureAutoLayout() {

    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()

    }

  }

}

extension DetailRankingVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailRankingTableCell.identifier, for: indexPath) as! DetailRankingTableCell
    return cell
  }

}
