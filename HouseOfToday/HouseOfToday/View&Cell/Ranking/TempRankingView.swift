//
//  TempRankingView.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class TempRankingView: UIView {

  // FIXME: - 셀 크기 가져와서 높이 조절
  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: RankingTableCell.self)
    tableView.register(cell: RankingHorizontalCell.self)
    tableView.register(HeaderTableCell.self, forHeaderFooterViewReuseIdentifier: "HeaderTableCell")
    tableView.register(FooterTableCell.self, forHeaderFooterViewReuseIdentifier: "FooterTableCell")
    tableView.allowsSelection = false
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.rowHeight = UITableView.automaticDimension

    tableView.separatorStyle = .none
    addSubview(tableView)
    return tableView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    tableViewAutoLayout()
    tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func tableViewAutoLayout() {
    if translatesAutoresizingMaskIntoConstraints {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      }
    }
  }
}

extension TempRankingView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderTableCell") as? HeaderTableCell else {
      return nil
    }
    return view
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterTableCell") as? FooterTableCell else {
      return nil
    }
    return view
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return HeaderTableCell.height
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return FooterTableCell.height
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableCell.identifier, for: indexPath) as! RankingTableCell
       let totalHeight = (JMetric.rankkingCellSize.height * 3) + (JMetric.verticalPadding * 2)
            tableView.rowHeight = totalHeight
      return cell
    default:
       let cell = tableView.dequeueReusableCell(withIdentifier: RankingHorizontalCell.identifier, for: indexPath) as! RankingHorizontalCell
       let totalHeight = JMetric.rankkingCellSize.height + (JMetric.verticalPadding)
             tableView.rowHeight = totalHeight
      return cell
    }

  }

}
