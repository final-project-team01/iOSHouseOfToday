//
//  HouseWarmingView.swift
//  HouseOfToday
//
//  Created by Daisy on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension Notification.Name {
  static let housewarmingID = Notification.Name("HousewarmingID")
}

class HouseWarmingView: UIView {

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private let notiCenter = NotificationCenter.default

  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.tintColor = .lightGray
    refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
    return refreshControl
  }()

  @objc func reloadData() {
    tableView.refreshControl?.endRefreshing()
    tableView.reloadData()
  }

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: HouseWarmingTableViewCell.self)
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .none
    tableView.refreshControl = refreshControl
    addSubview(tableView)
    return tableView
  }()

  private var housewarmingList: HousewarmingModel? {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  public func fetchHousewarmingList() {
    service.fetchHousewarmingList { result in
      switch result {
      case .success(let product):
        print("success!!! fetchHousewarmingList")
        self.housewarmingList = product

      case .failure(let error):

        print("fetchHousewarmingList Error: \(error.localizedDescription)")
      }
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    fetchHousewarmingList()
    tableViewAutoLayout()
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

extension HouseWarmingView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return housewarmingList?.housewarmingPosts.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HouseWarmingTableViewCell.identifier, for: indexPath) as! HouseWarmingTableViewCell
    cell.selectionStyle = .none
    cell.housewarmingInfo = housewarmingList?.housewarmingPosts[indexPath.row]

    if let url = URL(string: housewarmingList?.housewarmingPosts[indexPath.row].coverImage ?? "" ) {
      cell.housewarminMainImage(thumnailUrl: url)
    }

    if let url = URL(string: housewarmingList?.housewarmingPosts[indexPath.row].authorProfileImage ?? "" ) {
      cell.houseAuthorThumbButton(thumnailUrl: url)
    }

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let housewarmingID = housewarmingList?.housewarmingPosts[indexPath.row].id

    notiCenter.post(name: .housewarmingID, object: nil, userInfo: ["HousewarmingID": housewarmingID])
  }

}
