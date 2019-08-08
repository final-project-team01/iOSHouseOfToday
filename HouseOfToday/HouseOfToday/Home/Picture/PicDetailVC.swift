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
    tableView.register(cell: ReplyTableViewCell.self)
    tableView.register(cell: TextfieldTableviewCell.self)
    tableView.register(TableViewFooter.self, forHeaderFooterViewReuseIdentifier: "TableViewFooter")
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

//  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableViewFooter") as? TableViewFooter else {
//
//      return nil
//    }
//
//    return view
//  }
//
//  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//    return TableViewFooter.height
//  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (picDetailList?.photoComments.count ?? 0 ) + 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    var textFieldCaseNum = (picDetailList?.photoComments.count ?? 0 ) + 1

    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: PicDetailTableviewCell.identifier, for: indexPath) as! PicDetailTableviewCell

      cell.selectionStyle = UITableViewCell.SelectionStyle.none

      if let url = URL(string: picDetailList?.image ?? "") {
        cell.setMainProductImage(thumnailUrl: url)
      }

      if let url = URL(string: picDetailList?.authorProfileImage ?? "") {
        cell.getAuthorImage(thumnailUrl: url)
      }

      cell.picDetailInfo = picDetailList

      return cell

    case textFieldCaseNum:
      let cell = tableView.dequeueReusableCell(withIdentifier: TextfieldTableviewCell.identifier, for: indexPath) as! TextfieldTableviewCell
      cell.selectionStyle = UITableViewCell.SelectionStyle.none

      return cell

    default:

      let cell = tableView.dequeueReusableCell(withIdentifier: ReplyTableViewCell.identifier, for: indexPath) as! ReplyTableViewCell
      //데이터 받기
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      cell.CommentsList = picDetailList?.photoComments[indexPath.row - 1]

      if let url = URL(string: picDetailList?.photoComments[indexPath.row - 1].authorProfileImage ?? "") {
        cell.getReplyAuthorImage(thumnailUrl: url)
      }
      return cell

    }

  }

}
