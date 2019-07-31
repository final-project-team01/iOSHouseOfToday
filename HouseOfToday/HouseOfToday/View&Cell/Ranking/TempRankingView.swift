//
//  TempRankingView.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

// FIXME: - 더보기 버튼 BEST100만 눌렀을 때만 넘어가기

class TempRankingView: UIView {

  private let sectionTitle = ["오늘의집 AWARDS", "인기", "생활용품 BEST", "패브릭 BEST", "주방용품 BEST", "가전제품 BEST", "반려동물 BEST", "가구 BEST"]
  private let sectionSubTitle = ["카테고리별 BEST 100", "조명&홈데코 BEST", "", "", "", "", "", ""]
  private let moreButtonCount = ["100", "14,836", "6,248", "8,101", "7,766", "3,161", "1,793", "15,003"]

  private let service: HouseOfTodayServiceType = HouseOfTodayService() //TDD를 위한 code

  private var cachedOffset: [Int: CGFloat] = [:]

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
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.dataSource = self.self
    tableView.delegate = self.self
    tableView.register(cell: RankingTableCell.self)
    tableView.register(cell: RankingHorizontalCell.self)
    tableView.register(HeaderTableCell.self, forHeaderFooterViewReuseIdentifier: "HeaderTableCell")
    tableView.register(FooterTableCell.self, forHeaderFooterViewReuseIdentifier: "FooterTableCell")
    tableView.allowsSelection = false
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorStyle = .none
    tableView.refreshControl = refreshControl
    addSubview(tableView)
    return tableView
  }()

  var best100: [RankingList.Body] = []
  var lightHomedeco: [RankingList.Body] = []
  var dailySupplies: [RankingList.Body] = []
  var fabric: [RankingList.Body] = []
  var kitchenware: [RankingList.Body] = []
  var homeAppliances: [RankingList.Body] = []
  var companionAnimal: [RankingList.Body] = []
  var furniture: [RankingList.Body] = []

  var rankingDatas: [[RankingList.Body]] = []

  private var rankingList: RankingList? {
    didSet {
      guard let info = rankingList else {return logger()}

      self.rankingDatas.append(info.best100)
      self.rankingDatas.append(info.lightHomedeco)
      self.rankingDatas.append(info.dailySupplies)
      self.rankingDatas.append(info.fabric)
      self.rankingDatas.append(info.kitchenware)
      self.rankingDatas.append(info.homeAppliances)
      self.rankingDatas.append(info.companionAnimal)
      self.rankingDatas.append(info.furniture)

      DispatchQueue.main.async {
        self.tableView.reloadData()
      }

    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    tableViewAutoLayout()
    tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

//    fetchRankingList(id: <#T##Int#>)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func tableViewAutoLayout() {
    if translatesAutoresizingMaskIntoConstraints {
      tableView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
    }
  }

  public func fetchRankingList(id: Int) {
    service.fetchRankingList(id: id) { result in
      switch result {
      case .success(let product):
        print("success!!! fetchRankingList")

        self.rankingList = product
      case .failure(let error):

        print("fetchRankingList Error: \(error.localizedDescription)")
      }
    }
  }
}

extension TempRankingView: UITableViewDataSource, UITableViewDelegate {

  // HeaderView Setting
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderTableCell") as? HeaderTableCell else {
      return nil
    }
    view.titleLabel.text = sectionTitle[section]
    view.subtitleLabel.text = sectionSubTitle[section]
    return view
  }

  // FooterView Setting
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterTableCell") as? FooterTableCell else {
      return nil
    }

    view.moreButton.setTitle("더보기 (\(moreButtonCount[section]))", for: .normal)
    return view
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return HeaderTableCell.height
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return FooterTableCell.height
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 8
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rankingList != nil ? 1 : 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: RankingTableCell.identifier, for: indexPath) as! RankingTableCell
      let totalHeight = (JMetric.rankkingCellSize.height * 3) + (JMetric.verticalPadding * 2)
      tableView.rowHeight = totalHeight
      cell.best100 = rankingDatas[indexPath.section]
      return cell

    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: RankingHorizontalCell.identifier, for: indexPath) as! RankingHorizontalCell
      let totalHeight = JMetric.rankkingCellSize.height + (JMetric.verticalPadding)
      tableView.rowHeight = totalHeight
      cell.productList = rankingDatas[indexPath.section]
      return cell
    }
  }

  // cell 재사용시 collectionView cell의 위치가 변경되는 문제 해결
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? RankingHorizontalCell else { return }
    cell.offset = cachedOffset[indexPath.section] ?? 0
  }

  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let cell = cell as? RankingHorizontalCell else { return }
    cachedOffset[indexPath.section] = cell.offset

  }

}
