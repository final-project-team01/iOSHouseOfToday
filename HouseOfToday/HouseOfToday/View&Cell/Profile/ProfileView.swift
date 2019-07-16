//
//  ProfileView.swift
//  HouseOfToday
//
//  Created by Daisy on 16/07/2019.
//  Copyright © 2019 Daisy. All rights reserved.
//

import UIKit

final class ProfileView: UIView {

  // FIXME: - 사진 cell에 컬렉션뷰 추가

  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.tintColor = .lightGray
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    return refreshControl
  }()

  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()  //계속계속 뺑뺑이 안돌아가게
    tableView.reloadData()
  }

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: ProfileUserCell.self)
    tableView.register(cell: ProfileBaseCell.self)
    tableView.register(cell: VoucherCell.self) // FIXME: - 확인하기 위해 추가 나중에 삭제
    tableView.allowsSelection = false
    tableView.refreshControl = refreshControl

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

extension ProfileView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    switch indexPath.row {
    //유저 정보
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileUserCell.identifier, for: indexPath) as! ProfileUserCell
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    //나의 쇼핑
    case 1:
      //      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
      //      cell.setLabelItems(title: .myShoping, orderCount: "0", point: "0")
      //      cell.separatorInset = UIEdgeInsets.zero
      //
      //      return cell

      let cell = tableView.dequeueReusableCell(withIdentifier: VoucherCell.identifier, for: indexPath) as! VoucherCell
      return cell

    //사진
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
      cell.setLabelItems(title: .picture)
      cell.separatorInset = UIEdgeInsets.zero
      return cell
    //집들이
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
      cell.setLabelItems(title: .houseWarming, subTitle: "0", orderCount: "0", point: "0")
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    //리뷰쓰기
    case 4:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
      cell.setLabelItems(title: .reviewWriting)
      cell.separatorInset = UIEdgeInsets.zero
      return cell

    //리뷰
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBaseCell.identifier, for: indexPath) as! ProfileBaseCell
      cell.setLabelItems(title: .review, subTitle: "0", orderCount: "0", point: "0")
      cell.separatorInset = UIEdgeInsets.zero
      return cell
    }

  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
    case 0:
      return 200
    case 1:
      return 90
    default:
      return 60

    }

  }

}
