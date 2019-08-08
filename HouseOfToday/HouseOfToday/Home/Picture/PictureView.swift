//
//  PictureView.swift
//  HouseOfToday
//
//  Created by Daisy on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension Notification.Name {
  static let picDetailID = Notification.Name("PicDetailID")
}

class PictureView: UIView {

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
    tableView.register(cell: PictureTableViewCell.self)
    //    tableView.rowHeight = UITableView.automaticDimension
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .none
    tableView.refreshControl = refreshControl
    addSubview(tableView)
    return tableView
  }()

  private var pictureList: [PictureModel] = [] {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    fetchPictureList()
    tableViewAutoLayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func fetchPictureList() {
    service.fetchPictureList { result in
      switch result {
      case .success(let product):
        print("success!!! fetchPictureList")
        self.pictureList = product

      case .failure(let error):

        print("fetchPictureList Error: \(error.localizedDescription)")
      }
    }
  }

  // MARK: - AutoLayout
  private func tableViewAutoLayout() {
    if tableView.translatesAutoresizingMaskIntoConstraints {
      tableView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
}

extension PictureView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictureList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.identifier, for: indexPath) as! PictureTableViewCell
    cell.selectionStyle = .none
    cell.pictureInfo = pictureList[indexPath.row]

    if let url = URL(string: pictureList[indexPath.row].image) {
      cell.setImage(thumnailUrl: url)
    }

    if let url = URL(string: pictureList[indexPath.row].authorProfileImage) {
      cell.setUserprofileImage(thumnailUrl: url)
    }

    if let url = URL(string: pictureList[indexPath.row].comments[0].authorProfileImage) {
      cell.userThumbNailButton(thumnailUrl: url)
    }

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    let picDetailID = pictureList[indexPath.row].id

    notiCenter.post(name: .picDetailID, object: nil, userInfo: ["PicDetailID": picDetailID])

  }

}
