//
//  SelectOptionView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 03/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SelectOptionView: UIView {

  // MARK: - Property

  private lazy var tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(cell: OptionCell.self)
    tableView.register(cell: OptionHeaderCell.self)
//    tableView.allowsSelection = false
    tableView.backgroundColor = .white
    tableView.showsVerticalScrollIndicator = false
    tableView.rowHeight = 30
    tableView.separatorStyle = .none
    addSubview(tableView)
    return tableView
  }()

  public var options: [ProductDetail.Option] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  private let nofiCenter = NotificationCenter.default

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)

    self.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    self.layer.borderWidth = 2
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if tableView.translatesAutoresizingMaskIntoConstraints {
      tableView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

}

extension SelectOptionView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("SelectOptionView: \(options.count)")
    return options.count + 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeue(OptionHeaderCell.self)
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      return cell
    } else {
      let cell = tableView.dequeue(OptionCell.self)
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      cell.productNameLabel.text = "\(options[indexPath.row - 1].name)"
      cell.priceLabel.text = "\(formetter(price: options[indexPath.row - 1].price))원"
      return cell
    }
  }

}

extension SelectOptionView: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard indexPath.row != 0 else { return }

    nofiCenter.post(name: BuyingVC.selectOption, object: nil, userInfo: ["indexPathRow": indexPath.row - 1])
  }
}
