//
//  PicDetailVC.swift
//  HouseOfToday
//
//  Created by Daisy on 06/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PicDetailVC: UIViewController {

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  let picDetailTableViewcell = PicDetailTableviewCell()

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
    tableView.register(cell: PicDetailTableviewCell.self)
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .none
    tableView.refreshControl = refreshControl
    view.addSubview(tableView)
    return tableView
  }()

  private var picDetailList: PicDetailModel? {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    makeConstraints()
  }

  public func fetchPicDetailList(id: Int) {
    service.fetchPicDetailList(id: id) { result in
      switch result {
      case .success(let product):
        print("success!!! fetchPicDetailList")
        self.picDetailList = product

      case .failure(let error):

        print("fetchPicDetailList Error: \(error.localizedDescription)")
      }
    }
  }

  // MARK: - AutoLayout
  private func makeConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
}

extension PicDetailVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PicDetailTableviewCell.identifier, for: indexPath) as! PicDetailTableviewCell

    if let url = URL(string: picDetailList?.image ?? "") {
      cell.setMainProductImage(thumnailUrl: url)
    }
    cell.picDetailInfo = picDetailList

    return cell
  }

}
