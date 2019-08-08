//
//  OrderListVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class OrderListVC: UIViewController {

  // MARK: - Property
  private lazy var tableView: UITableView = {
    let tv = UITableView(frame: .zero, style: .plain)
    tv.register(cell: OrderListCell.self)
//    tv.register(cell: ShoppingCartCell.self)
//    tv.register(ShoppingHeaderView.self, forHeaderFooterViewReuseIdentifier: ShoppingHeaderView.identifier)
//    tv.register(ShoppingFooterView.self, forHeaderFooterViewReuseIdentifier: ShoppingFooterView.identifier)
    tv.alwaysBounceVertical = true
    tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    tv.dataSource = self
    tv.delegate = self
    tv.rowHeight = 100
    tv.backgroundColor = .white
    tv.allowsSelection = true
    view.addSubview(tv)
    return tv
  }()

  private var showOrderList: [ShowOrderList] = []

  private var orderList: [OrderList] = [] {
    didSet {
      guard !orderList.isEmpty else { return print("orderList is empty")}

      for order in orderList {

        for list in order.orderList {
          showOrderList.append(ShowOrderList(id: order.id,
                                             user: order.user,
                                             brabdName: list.brabdName,
                                             product: list.product,
                                             productOption: list.productOption,
                                             quantity: list.quantity,
                                             thumnailImage: list.thumnailImage,
                                             totalPrice: list.totalPrice
          ))
        }
      }

      DispatchQueue.main.async { [weak self] in
        self?.tableView.reloadData()
      }
    }
  }

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    tableViewAutolayout()
    fetchOrderList()
  }

  // MARK: - configure
  private func tableViewAutolayout() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  private let service = HouseOfTodayService()
  // MARK: - fetchCartList
  private func fetchOrderList() {

    service.fetchOrderList { result in
      switch result {
      case .success(let list):
        print("success!!! fetchOrderList)")

        self.orderList = list
      case .failure(let error):
        print("fetchOrderList Error: \(error.localizedDescription)")
      }
    }
  }
}

extension OrderListVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return showOrderList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(OrderListCell.self)

    let info = showOrderList[indexPath.row]

    if let url = URL(string: info.thumnailImage) {
      cell.thumnailImageView.kf.setImage(with: url,
                                    placeholder: nil,
                                    options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                    progressBlock: nil) { (_) in
      }
    }

    cell.productTitle.text = "[\(info.brabdName)] \(info.product)"
    cell.optionLabel.text = "\(info.productOption)"
    cell.priceLabel.text = "\(formetter(price: info.totalPrice) )"
    cell.quantityLabel.text = "\(info.quantity)"

    return cell
  }

}

extension OrderListVC: UITableViewDelegate {

}
