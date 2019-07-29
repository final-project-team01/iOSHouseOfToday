//
//  DetailRankingVC.swift
//  HouseOfToday
//
//  Created by Daisy on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class DetailRankingVC: UIViewController {

   private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: DetailRankingTableCell.self)
    tableView.register(RankingHeader.self, forHeaderFooterViewReuseIdentifier: "RankingHeader")
    tableView.showsVerticalScrollIndicator = false
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
    tableView.rowHeight = 120 // FIXME: - 임시
    tableView.backgroundColor = .white
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
        print("success!!!")

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

  // HeaderView Setting
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RankingHeader") as? RankingHeader else {
      return nil
    }

    return view
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return RankingHeader.height
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return best100.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailRankingTableCell.identifier, for: indexPath) as! DetailRankingTableCell
    cell.countLabel.text = "\(indexPath.row + 1)"
    cell.productNameLabel.text = "\(best100[indexPath.row].productName)"
    cell.ratingStarRankLabel.text = "\(best100[indexPath.row].starAvg)"
    cell.reviewCountLabel.text = "리뷰 \(best100[indexPath.row].reviewCount)"
    let price = "\(formetter(price: best100[indexPath.row].price))"
    cell.priceLabel.text = "\(price)원"
    if let discount = best100[indexPath.row].discountRate {
      cell.discountLabel.text = "\(discount)%"
    }
    if let url = URL(string: best100[indexPath.row].thumnailImages[0].image) {
      cell.setImage(thumnailUrl: url)
    }
    return cell
  }

}
