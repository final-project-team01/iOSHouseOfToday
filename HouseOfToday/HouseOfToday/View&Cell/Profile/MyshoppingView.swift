//
//  MyshoppingView.swift
//  HouseOfToday
//
//  Created by Daisy on 16/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

final class MyshoppingView: UIView {

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: VoucherCell.self)
    tableView.register(cell: BeingOrderCell.self)
    tableView.register(cell: MyshoppingBaseCell.self)
    tableView.allowsSelection = false

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

    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()

    }

  }

}

extension MyshoppingView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: VoucherCell.identifier, for: indexPath) as! VoucherCell
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: BeingOrderCell.identifier, for: indexPath) as! BeingOrderCell
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: MyshoppingBaseCell.identifier, for: indexPath) as! MyshoppingBaseCell
      cell.setLabelItems(title: .orderCheck)
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: MyshoppingBaseCell.identifier, for: indexPath) as! MyshoppingBaseCell
      cell.setLabelItems(title: .productScrap, subTitle: "0")
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: MyshoppingBaseCell.identifier, for: indexPath) as! MyshoppingBaseCell
      cell.setLabelItems(title: .myinquiry, subTitle: "0")
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    case 5:
      let cell = tableView.dequeueReusableCell(withIdentifier: MyshoppingBaseCell.identifier, for: indexPath) as! MyshoppingBaseCell
      cell.setLabelItems(title: .myReview, subTitle: "0")
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    default:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyshoppingBaseCell.identifier, for: indexPath) as! MyshoppingBaseCell
            cell.setLabelItems(title: .customerService)
            cell.separatorInset = UIEdgeInsets.zero
            return cell

    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
    case 0:
      return 100
    case 1:
      return 150
    default:
      return 80

    }

  }

}
