//
//  CartVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 07/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension CartVC {
  static var checkedButton: Notification.Name {
    return Notification.Name("checkedButton")
  }
  static var buyingButton: Notification.Name {
    return Notification.Name("BuyingButton")
  }
}

final class CartVC: UIViewController {

  struct ShoppingCart {

    var checked: Bool

    var options: [ShoppingOptionCart] = []
  }

  private lazy var tableView: UITableView = {
    let tv = UITableView(frame: .zero, style: .plain)
    tv.register(cell: TotalPriceCell.self)
    tv.register(cell: ShoppingCartCell.self)
    tv.register(ShoppingHeaderView.self, forHeaderFooterViewReuseIdentifier: ShoppingHeaderView.identifier)
    tv.register(ShoppingFooterView.self, forHeaderFooterViewReuseIdentifier: ShoppingFooterView.identifier)
    tv.alwaysBounceVertical = true
    tv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    tv.dataSource = self
    tv.delegate = self
    tv.rowHeight = UITableView.automaticDimension
    tv.backgroundColor = .white
    tv.allowsSelection = true
    view.addSubview(tv)
    return tv
  }()

  private var totalPrice = 0
  private var totalOption = 0

  private var productOptions: [ShoppingCart] = []
//  private var productOptions: [[ShoppingOptionCart]] = []

  public var shoppingOptionCart: [ShoppingOptionCart] = [] {
    didSet {
      guard !shoppingOptionCart.isEmpty else { return print("shoppingOptionCart is empty") }
      let cartList = shoppingOptionCart

      var tampArray: [ShoppingOptionCart] = []

//      for index in 0..<cartList.sorted (by: { $0.productId < $1.productId }).count {
//
//        if tampArray.isEmpty {
//          tampArray.append(cartList[index])
//        } else if let last = tampArray.last {
//
//          if last.productId
//        }
//
//
//
//        if index != cartList.count - 1 {
//          continue
//        }
//
//        productOptions.append(ShoppingCart(checked: true, options: tampArray))
//      }
      let sortCart = cartList.sorted (by: { $0.productId < $1.productId })
      for index in 0..<sortCart.count {

        if tampArray.isEmpty {

          tampArray.append(sortCart[index])

          if index == sortCart.count - 1 {
            productOptions.append(ShoppingCart(checked: true, options: tampArray))
          }

          continue
        }

        if let last = tampArray.last {

          if last.productId == sortCart[index].productId {

            tampArray.append(sortCart[index])

            if index == sortCart.count - 1 {
              productOptions.append(ShoppingCart(checked: true, options: tampArray))
            }

            continue
          } else {

            productOptions.append(ShoppingCart(checked: true, options: tampArray))
            tampArray.removeAll()

            if index == sortCart.count - 1 {
              tampArray.append(sortCart[index])
              productOptions.append(ShoppingCart(checked: true, options: tampArray))
            }
          }
        }

      }

      print("productOptions \(productOptions.count)")

      productOptions.forEach { print("productOptions\($0.options.count)") }

      DispatchQueue.main.async { [weak self] in
        self?.tableView.reloadData()
      }
    }
  }

  private lazy var selectAll: (_ selected: Bool) -> Void = {[weak self] selected in
    guard let `self` = self else { return }

//    self.tableView.cellForRowAtIndexPath()
    for index in 0..<self.productOptions.count {
      let indexPath = IndexPath(row: index, section: 0)
      if let cell = self.tableView.cellForRow(at: indexPath) as? ShoppingCartCell {
        cell.checkButton.isSelected = selected
      }

      self.productOptions[index].checked = selected

    }

    if let header = self.tableView.headerView(forSection: 0) as? ShoppingHeaderView,
      let footer = self.tableView.footerView(forSection: 0) as? ShoppingFooterView {

      let isAllchecked = self.productOptions.reduce(true) { $0 && $1.checked }
      let countingProduct = self.productOptions.reduce(0) {
        $0 + ($1.checked == true ? $1.options.reduce(0, {$0 + $1.quantity}) : 0)
      }
      let countingPrice = self.productOptions.reduce(0) {
        $0 + ($1.checked == true ? $1.options.reduce(0, {$0 + $1.totalPrice}) : 0)
      }

      header.allItemButton.isSelected = isAllchecked
      header.allItemLabel.text = "모두선택 (\(countingProduct)개)"

      footer.selectedItemLabel.text = "\(countingProduct)개"
      footer.selectedTotalPriceLabel.text = "\(self.formetter(price: countingPrice)))원"
    }

    //return //"모두선택 (\(countingProduct)개)"
  }
  private lazy var deleteAll: () -> Void = {[weak self] in self?.productOptions.removeAll() }

  private var footerCapture: ((_ footer: ShoppingFooterView) -> Void)?
  private var headerButtonCapture: ((_ check: Bool) -> Void)?

  private let service = HouseOfTodayService()

  let notiCenter = NotificationCenter.default

  // MARK: - View life cycle

  deinit {
    notiCenter.removeObserver(self,
                              name: CartVC.checkedButton,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: CartVC.buyingButton,
                              object: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    fetchCartList()
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    configureNaviBar()
    tableViewAutolayout()
    setNoti()
  }

  // MARK: - Setting Notification
  private func setNoti() {
    notiCenter.addObserver(self,
                           selector: #selector(checkedButton(_:)),
                           name: CartVC.checkedButton,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(buyingButton(_:)),
                           name: CartVC.buyingButton,
                           object: nil)
  }

  // MARK: - configure

  private func configureNaviBar() {
    self.title = "장바구니"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    self.navigationController?.navigationBar.barTintColor = .white
    self.navigationController?.navigationBar.layer.borderWidth = 0
    self.navigationController?.navigationBar.layer.borderColor = UIColor.clear.cgColor
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  private func tableViewAutolayout() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    let transition = CATransition()
    transition.duration = 0.5
    transition.type = CATransitionType.push
    transition.subtype = CATransitionSubtype.fromLeft
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    view.window!.layer.add(transition, forKey: kCATransition)
    self.presentingViewController?.dismiss(animated: true, completion: nil)
  }

  // MARK: - posted Noti
  @objc private func checkedButton(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: Any],
      let index = userInfo["index"] as? Int, let checked = userInfo["check"] as? Bool
      else {
        return print("userInfo down casting is fail")
    }

    productOptions[index].checked = checked

    if let header = self.tableView.headerView(forSection: 0) as? ShoppingHeaderView,
      let footer = self.tableView.footerView(forSection: 0) as? ShoppingFooterView {

      let isAllchecked = productOptions.reduce(true) { $0 && $1.checked }
      let countingProduct = productOptions.reduce(0) {
        $0 + ($1.checked == true ? $1.options.reduce(0, {$0 + $1.quantity}) : 0)
      }
      let countingPrice = productOptions.reduce(0) {
        $0 + ($1.checked == true ? $1.options.reduce(0, {$0 + $1.totalPrice}) : 0)
      }

      header.allItemButton.isSelected = isAllchecked
      header.allItemLabel.text = "모두선택 (\(countingProduct)개)"

      footer.selectedItemLabel.text = "\(countingProduct)개"
      footer.selectedTotalPriceLabel.text = "\(formetter(price: countingPrice)))원"

      tableView.reloadRows(at: [IndexPath(row: productOptions.count, section: 0)], with: .none)
    }
  }

  @objc private func buyingButton(_ sender: Notification) {
    print("noti buyingButton")

//    print(getCheckedCartList())
    postCartList()
  }

  private func getCheckedCartList() -> Data {

    var optionIds = productOptions.reduce("") {
      $0 + ($1.checked == true ? $1.options.reduce("", {$0 + "\($1.id),"}) : "")
    }

    optionIds.removeLast()

    print("optionIds: \(optionIds)")

    let postData = NSMutableData(data: "pk_list=\(optionIds)".data(using: String.Encoding.utf8)!)

    return postData as Data
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  private func alertBuying() {
    let alert = UIAlertController(title: "주문", message: "주문을 완료했습니다.", preferredStyle: .alert)
    let okAlert = UIAlertAction(title: "확인", style: .default) { [weak self] (_) in

      self?.navigationController?.popViewController(animated: true)
    }

    alert.addAction(okAlert)

    present(alert, animated: true)
  }

  // MARK: - postCartList
  private func postCartList() {

    let orderList = getCheckedCartList()

    service.postCartList(data: orderList) { result in
      switch result {
      case .success(let cart):

        print("success!!! postCartList)")

        DispatchQueue.main.async { [weak self] in
          self?.alertBuying()
        }
      case .failure(let error):
        print("postCartList Error: \(error.localizedDescription)")
      }

    }
  }

  // MARK: - fetchCartList
  private func fetchCartList() {

    service.fetchCartList { result in
      switch result {
      case .success(let list):
        print("success!!! fetchCartList)")

        self.shoppingOptionCart = list
      case .failure(let error):
        print("fetchCartList Error: \(error.localizedDescription)")
      }
    }
  }
}

extension CartVC: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productOptions.count + 1//shoppingOptionCart.count + 1
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ShoppingHeaderView.identifier)

    if let header = header as? ShoppingHeaderView {
      header.allItemLabel.text = "모두선택 (\(shoppingOptionCart.count)개)"
      header.contentView.backgroundColor = .white
      header.selectAll = selectAll

    }

    return header
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: ShoppingFooterView.identifier)

    if let footer = footer as? ShoppingFooterView {
      footer.contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
      footer.selectedItemLabel.text = "\(shoppingOptionCart.count)개"
      let countingPrice = productOptions.reduce(0) {
        $0 + ($1.checked == true ? $1.options.reduce(0, {$0 + $1.totalPrice}) : 0)}
      footer.selectedTotalPriceLabel.text = "\(formetter(price: countingPrice))원"
    }

    return footer
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 70
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    if indexPath.row == productOptions.count {

      let cell = tableView.dequeue(TotalPriceCell.self)
      cell.selectionStyle = .none

      let countingPrice = productOptions.reduce(0) {
        $0 + ($1.checked == true ? $1.options.reduce(0, {$0 + $1.totalPrice}) : 0)}
      cell.totalProductPriceLabel.text = "\(formetter(price: countingPrice))원"
      cell.totalDeleveryPriceLabel.text = "0원"
      cell.totalDiscountPriceLabel.text = "- 0원"
      cell.totalPaymentPriceLabel.text = "\(formetter(price: countingPrice))원"
      return cell
    } else {

      let cell = tableView.dequeue(ShoppingCartCell.self)
      cell.selectionStyle = .none

//      print("productOptions[\(indexPath.row)]: \(productOptions[indexPath.row])")
      cell.cellIndex = indexPath.row
      cell.productOptions = productOptions[indexPath.row].options
      cell.checkButton.isSelected = productOptions[indexPath.row].checked

      print("indexPath.row \(indexPath.row), \(productOptions[indexPath.row].options.count)")
//      print("tableView.frame out1 \(indexPath.row): \(cell.tableView.frame.height), \(cell.tableView.contentSize.height)")
      cell.firstCell = "\(indexPath.row)"
      cell.layoutIfNeeded()
      cell.layoutIfNeeded()
//      print("tableView.frame out2 \(indexPath.row): \(cell.tableView.frame.height), \(cell.tableView.contentSize.height)")
      return cell
    }

  }

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//    cell.layoutIfNeeded()
    if let cell = cell as? ShoppingCartCell {
//    print("tableView.frame out willDisplay \(indexPath.row): \(cell.tableView.frame.height), \(cell.tableView.contentSize.height)")
      if cell.tableView.frame.height != cell.tableView.contentSize.height {
//        cell.layoutIfNeeded()
//        print("tableView.frame outer \(indexPath.row) layoutIfNeeded")
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//        tableView.reloadData()
//        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
      }
    }
  }

}

extension CartVC: UITableViewDelegate {

}
