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
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .none
    tableView.refreshControl = refreshControl
    //    tableView.rowHeight = UITableView.automaticDimension
    //    tableView.estimatedRowHeight = 250 // FIXME: - 강제 적으로 주면 안될꺼같음 오토디멘션으로 해보자
    tableView.rowHeight = 250
    tableView.backgroundColor = .yellow
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
    //    fetchPicDetailList()
  }

  public func fetchPicDetailList(id: Int) {
    service.fetchPicDetailList(id: id) { result in
      switch result {
      case .success(let product):
        print("success!!! fetchPictureList")
        self.picDetailList = product

      case .failure(let error):

        print("fetchPictureList Error: \(error.localizedDescription)")
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

    if let url = URL(string: "\(picDetailList?.productImage)") {
      cell.setMainProductImage(thumnailUrl: url)
    }
    return cell
  }

  //  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
  //    let currentImage = images[indexPath.row]
  //    let image = UIImage(named: "test")
  //    guard let imagecrop = image?.getCropRatio() else { return 0.0 }
  //    return tableView.frame.width * imagecrop

  //  }

}

extension UIImage {

  func getCropRatio() -> CGFloat {
    var widthRatio = CGFloat( self.size.width / self.size.height )
    return widthRatio
  }

}
