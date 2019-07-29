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

   private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: DetailRankingTableCell.self)
    tableView.showsVerticalScrollIndicator = false
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
    tableView.rowHeight = 120 // FIXME: - 임시
    view.addSubview(tableView)
    return tableView
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      fetchRankingList()
      configureAutoLayout()
    }

  var best100: [RankingList.Body] = []

  private var rankingList: RankingList? {
    didSet {
      guard let info = rankingList else {return logger()}

      self.best100 = info.best100

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  private func configureAutoLayout() {

    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()

    }
  }
  // MARK: - Fetch Product List
  private func fetchRankingList() {
    service.fetchRankingList { result in
      switch result {
      case .success(let list):
        print("success!!!ss")

        self.rankingList = list
      case .failure(let error):
        print("fetchProductList Error: \(error.localizedDescription)")
      }
    }
  }

  // 가격 세자리 수 formetter
  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }
}

extension DetailRankingVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return best100.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailRankingTableCell.identifier, for: indexPath) as! DetailRankingTableCell
    cell.countLabel.text = "\(indexPath.row + 1)"
    cell.productNameLabel.text = "\(best100[indexPath.row].productName)"
    cell.ratingStarRankLabel.text = "\(best100[indexPath.row].starAvg)"
    cell.reviewCountLabel.text = "리뷰 \(best100[indexPath.row].reviewCount)"
    cell.priceLabel.text = "\(best100[indexPath.row].price)원"
    if let discount = best100[indexPath.row].discountRate {
      cell.discountLabel.text = "\(discount)%"
    }
    if let url = URL(string: best100[indexPath.row].thumnailImages[0].image) {
      cell.setImage(thumnailUrl: url)
    }
    return cell
  }

}
