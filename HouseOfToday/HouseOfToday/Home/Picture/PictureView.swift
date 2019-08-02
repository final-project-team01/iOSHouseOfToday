//
//  PictureView.swift
//  HouseOfToday
//
//  Created by Daisy on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureView: UIView {

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
    let tableView = UITableView() // FIXME: - (frame: .zero, style: .grouped) 이거로 안해도 될꺼 같긴한데 나중에 확인해보기
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: PictureTableViewCell.self)
//    tableView.register(HeaderTableCell.self, forHeaderFooterViewReuseIdentifier: "HeaderTableCell") 나중에 헤더 만들면 넣기
//    tableView.allowsSelection = false
    //    tableView.rowHeight = UITableView.automaticDimension
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .none
    tableView.refreshControl = refreshControl
    addSubview(tableView)
    return tableView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    tableViewAutoLayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - AutoLayout
  private func tableViewAutoLayout() {
    if translatesAutoresizingMaskIntoConstraints {
      tableView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }
}

extension PictureView: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PictureTableViewCell.identifier, for: indexPath) as! PictureTableViewCell
    return cell
  }

}
