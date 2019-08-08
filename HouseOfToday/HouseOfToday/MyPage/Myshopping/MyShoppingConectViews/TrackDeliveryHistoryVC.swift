//
//  TrackDeliveryHistory.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension  Notification.Name {
  static let trackDeliveryHistoryVC = Notification.Name("trackDeliveryHistoryVC")
}

class TrackDeliveryHistoryVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  private lazy var pastOrderCheckButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("3개월", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setImage(UIImage(named: "downArrow"), for: .normal)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
    button.addTarget(self, action: #selector(didTapPastOrderCheckBtn(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var productStatusButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("전체상태", for: .normal)
    button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setImage(UIImage(named: "downArrow"), for: .normal)
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(didTapProductStatusBtn(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var seperateLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.backgroundColor = .lightGray
    view.addSubview(label)
    return label
  }()

//  private lazy var announcementLabel: UILabel = {
//    let label = UILabel(frame: CGRect.zero)
//    label.text = "해당 내역이 없습니다."
//    label.font = UIFont.systemFont(ofSize: 15)
//    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
//    view.addSubview(label)
//    return label
//  }()

  private lazy var tableView: UITableView = {
    let tv = UITableView(frame: .zero, style: .plain)
    tv.register(cell: OrderListCell.self)
    tv.alwaysBounceVertical = true
    tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    tv.dataSource = self
    tv.delegate = self
    tv.rowHeight = 130
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

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureAutolayout()
    alignButtonImageAndTitle(button: self.productStatusButton)
    alignButtonImageAndTitle(button: self.pastOrderCheckButton)

    tableViewAutolayout()
    fetchOrderList()
    configureNaviBar()
  }

  private func configureNaviBar() {
    self.title = "리뷰보기"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  private func alignButtonImageAndTitle(button: UIButton) {
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10 )
  }

  @objc func didTapPastOrderCheckBtn(_ sender: UIButton) {
    print("didTapPastOrderCheckBtn")
  }

  @objc func didTapProductStatusBtn(_ sender: UIButton) {
    print("didTapProductStatusBtn")
  }

  private func configureAutolayout() {

    let margin: CGFloat = 10
    let buttonWidth = ((view.frame.width) - (margin * 3)) / 2

    pastOrderCheckButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(margin)
      make.trailing.equalTo(productStatusButton.snp.leading).inset(-margin)
      make.bottom.equalTo(seperateLabel.snp.top).offset(-margin)
      make.width.equalTo(buttonWidth)
      make.height.equalToSuperview().multipliedBy(0.05)
    }

    productStatusButton.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(margin)
      make.bottom.equalTo(seperateLabel.snp.top).offset(-margin)
      make.width.equalTo(buttonWidth)
      make.height.equalToSuperview().multipliedBy(0.05)
    }

    seperateLabel.snp.makeConstraints { make in
      make.width.equalToSuperview()
      make.height.equalTo(1)
      make.centerX.equalToSuperview()
    }

//    announcementLabel.snp.makeConstraints { make in
//      make.centerX.equalToSuperview()
//      make.centerY.equalToSuperview().multipliedBy(0.4)
//    }

  }
  // MARK: - tableViewAutolayout
  private func tableViewAutolayout() {
    tableView.snp.makeConstraints {

      $0.top.equalTo(seperateLabel.snp.bottom).offset(Metric.marginY/2)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
//      $0.edges.equalTo(view.safeAreaLayoutGuide)
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

extension TrackDeliveryHistoryVC: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return showOrderList.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1//showOrderList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(OrderListCell.self)

    let info = showOrderList[indexPath.section]//showOrderList[indexPath.row]

    if let url = URL(string: info.thumnailImage) {
      cell.thumnailImageView.kf.setImage(with: url,
                                         placeholder: nil,
                                         options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                         progressBlock: nil) { (_) in
      }
    }

    cell.productTitle.text = "[\(info.brabdName)] \(info.product)"
    cell.optionLabel.text = "\(info.productOption)"
    cell.priceLabel.text = "\(formetter(price: info.totalPrice))원"
    cell.quantityLabel.text = "\(info.quantity)개"

    return cell
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return Metric.marginY
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: OptionHeaderView.identifier)
    if let header = header as? OptionHeaderView {
      header.contentView.backgroundColor = .white
    }

    return header
  }

}

extension TrackDeliveryHistoryVC: UITableViewDelegate {

}
