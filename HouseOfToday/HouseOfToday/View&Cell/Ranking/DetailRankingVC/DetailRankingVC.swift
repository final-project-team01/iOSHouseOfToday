//
//  DetailRankingVC.swift
//  HouseOfToday
//
//  Created by Daisy on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class DetailRankingVC: UIViewController {

  private struct Key {
    static let sortStandard = "Sortstandard"
  }
    private let service: HouseOfTodayServiceType = HouseOfTodayService()

    private let notiCenter = NotificationCenter.default

    private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: DetailRankingTableCell.self)
    tableView.register(RankingHeader.self, forHeaderFooterViewReuseIdentifier: "RankingHeader")
    tableView.showsVerticalScrollIndicator = false
    tableView.separatorStyle = .none
    tableView.rowHeight = 120 // FIXME: - 임시
    tableView.backgroundColor = .white
    view.addSubview(tableView)
    return tableView
  }()

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // show animation 실행 // FIXME: - PickerVC 왜 애니메이션 안먹힐까나
    if let userView = view as? PickerViewController { //흐음 여기가 문젠데 나중에 해결 하자
      userView.showView()
    }
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      configureAutoLayout()
      fetchRankingList()
//      notiCenter.addObserver(self, selector: #selector(presentRankingPickerVC(_:)), name: .presentRankingPickerVC, object: nil)
  }

  deinit {
    notiCenter.removeObserver(self, name: .presentRankingPickerVC, object: nil)
  }

  // FIXME: - 다시 시도해보기
//  @objc func presentRankingPickerVC(_ sender: Notification) {
//    guard let userInfo = sender.userInfo as? [String: UIViewController],
//      let rankingPickerVC = userInfo["presentRankingPickerVC"]
//      else {
//        return print("fail downCasting")
//    }
//
//    rankingPickerVC.modalPresentationStyle = .overCurrentContext
//    present(rankingPickerVC, animated: false)
//
//  }

  private var sortedList: [RankingList.Body] = []

  var best100: [RankingList.Body] = [] {
    didSet {
      sortedList = best100
    }
  }

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

  public func sortList(_ sort: Int) {

    switch sort {
    case 0:
      sortedList = best100.sorted(by: { (Double($0.starAvg) ?? 0.0) > (Double($1.starAvg) ?? 0.0) })
    case 1:
      sortedList = best100.sorted(by: { $0.reviewCount > $1.reviewCount })
    case 2:
      sortedList = best100.sorted(by: { (Int($0.discountRate ?? "") ?? 0) > (Int($1.discountRate ?? "") ?? 0) })
    default:
      break
    }

    tableView.reloadData()
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
    return sortedList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DetailRankingTableCell.identifier, for: indexPath) as! DetailRankingTableCell

    cell.countLabel.text = "\(indexPath.row + 1)"
    cell.productNameLabel.text = "\(sortedList[indexPath.row].productName)"
    cell.ratingStarRankLabel.text = "\(sortedList[indexPath.row].starAvg)"
    cell.reviewCountLabel.text = "리뷰 \(sortedList[indexPath.row].reviewCount)"
    let price = "\(formetter(price: sortedList[indexPath.row].price))"
    cell.priceLabel.text = "\(price)원"
    if let discount = sortedList[indexPath.row].discountRate {
      cell.discountLabel.text = "\(discount)%"
    }
    if let url = URL(string: sortedList[indexPath.row].thumnailImages[0].image) {
      cell.setImage(thumnailUrl: url)
    }
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let productID = sortedList[indexPath.row].id
    notiCenter.post(name: StoreVC.presentProductDetail, object: nil, userInfo: ["productID": productID])
  }

}
