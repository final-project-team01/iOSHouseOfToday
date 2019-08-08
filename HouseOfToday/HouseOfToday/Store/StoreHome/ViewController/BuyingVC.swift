//
//  BuyingVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension BuyingVC {
  static var showOptionsView: Notification.Name {
    return Notification.Name("showOptionsView")
  }
  static var hideOptionsView: Notification.Name {
    return Notification.Name("hideOptionsView")
  }
  static var selectOption: Notification.Name {
    return Notification.Name("selectOption")
  }
  static var deleteOption: Notification.Name {
    return Notification.Name("deleteOption")
  }
}

final class BuyingVC: UIViewController {

  // MARK: - Property
  private lazy var buyingView: UIView = {
    let bv = UIView(frame: CGRect.zero)
    bv.backgroundColor = .white
    view.addSubview(bv)
    return bv
  }()

  private lazy var shoppingBagButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.backgroundColor = #colorLiteral(red: 0.8776302934, green: 0.8724135756, blue: 0.8816406131, alpha: 1)
    btn.setTitle("장바구니", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .highlighted)
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 5
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    btn.addTarget(self, action: #selector(touchUpShoppingBagButton(_:)), for: .touchUpInside)
    btn.addTarget(self, action: #selector(downEventButton(_:)), for: .touchDown)
    buyingView.addSubview(btn)
    return btn
  }()

  private lazy var buyingButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("구매하기", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .highlighted)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 5
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    btn.addTarget(self, action: #selector(touchUpBuyingButton(_:)), for: .touchUpInside)
    btn.addTarget(self, action: #selector(downEventButton(_:)), for: .touchDown)
    buyingView.addSubview(btn)
    return btn
  }()

  private lazy var priceInfoLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.attributedText = getAttributedText()
    buyingView.addSubview(label)
    return label
  }()

  private lazy var pointInfoLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "100만원 이상 구매시 20,000P 추가적립"
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    buyingView.addSubview(label)
    return label
  }()

  private lazy var questionButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("?", for: .normal)
    btn.addTarget(self, action: #selector(touchUpquestionButton(_:)), for: .touchUpInside)
    buyingView.addSubview(btn)
    return btn
  }()

  private lazy var dissmissButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.backgroundColor = .clear
    btn.addTarget(self, action: #selector(touchUpDissmiss(_:)), for: .touchUpInside)
    view.addSubview(btn)
    return btn
  }()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    // FIXME: -  delegate 로 수정
    layout.itemSize = CGSize(width: Int(UIScreen.main.bounds.width - Metric.marginX*2),
                             height: 150)
    layout.minimumLineSpacing = 2
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    colV.dataSource = self
    colV.delegate = self
    colV.register(cell: BuyingProductOptionCell.self)
    colV.register(BuyingProductOptionsHeaderView.self,
                  forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                  withReuseIdentifier: BuyingProductOptionsHeaderView.identifier)
    colV.register(BuyingProductOptionsFooterView.self,
                  forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                  withReuseIdentifier: BuyingProductOptionsFooterView.identifier)
    colV.contentInset = UIEdgeInsets(top: Metric.marginY/2, left: Metric.marginY/2, bottom: Metric.marginY/2, right: Metric.marginY/2)
    colV.alwaysBounceVertical = true
    view.addSubview(colV)
    return colV
  }()

  private lazy var fadeButton: UIButton = {
    let fade = UIButton(type: .custom)
    fade.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    fade.addTarget(self, action: #selector(touchUpFadeButton(_:)), for: .touchUpInside)
    view.addSubview(fade)
    return fade
  }()

  private lazy var selectOptionView: SelectOptionView = {
    let optionView = SelectOptionView()
    optionView.options = options
    view.addSubview(optionView)
    view.bringSubviewToFront(buyingView)
    return optionView
  }()

  public var options: [ProductDetail.Option] = [] {
    didSet {
      guard !options.isEmpty else {
        return print("options is emptiy")
      }

//      optionView.options = options
    }
  }

  //private var shoppingCartList = ShoppingList()

  private var shoppingCartList: [ShoppingCart] = [] {
    didSet {

      updateCart()
    }
  }

  private let service = HouseOfTodayService()

  private let notiCenter = NotificationCenter.default

  public var showCart: (() -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

    autolayoutBottomView()
    autolayoutCollectionView()
    settingNotification()
  }

  deinit {
    notiCenter.removeObserver(self, name: BuyingVC.showOptionsView, object: nil)
    notiCenter.removeObserver(self, name: BuyingVC.hideOptionsView, object: nil)
    notiCenter.removeObserver(self, name: BuyingVC.selectOption, object: nil)
    notiCenter.removeObserver(self, name: BuyingVC.deleteOption, object: nil)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

//    print(fadeButton.frame)
  }
  // MARK: - configure
  private func settingNotification() {
    notiCenter.addObserver(self,
                           selector: #selector(showOptionsView(_:)),
                           name: BuyingVC.showOptionsView,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(hideOptionsView(_:)),
                           name: BuyingVC.hideOptionsView,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(selectOption(_:)),
                           name: BuyingVC.selectOption,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(deleteOption(_:)),
                           name: BuyingVC.deleteOption,
                           object: nil)
  }

  private func autolayoutBottomView() {

    dissmissButton.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    buyingView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(170)
    }

    shoppingBagButton.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.marginX/2)
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
      $0.height.equalTo(50)
    }

    buyingButton.snp.makeConstraints {
      $0.leading.equalTo(shoppingBagButton.snp.trailing).offset(Metric.marginX/2)
      $0.trailing.equalToSuperview().offset(-Metric.marginX/2)
      $0.width.height.equalTo(shoppingBagButton)
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }

    priceInfoLabel.snp.makeConstraints {
      $0.top.equalTo(buyingView).offset(Metric.marginY)
      $0.centerX.equalTo(buyingView)
    }

    pointInfoLabel.snp.makeConstraints {
      $0.top.equalTo(priceInfoLabel.snp.bottom).offset(Metric.marginY)
      $0.centerX.equalTo(buyingView)
    }

    questionButton.snp.makeConstraints {
      $0.centerY.equalTo(pointInfoLabel)
      $0.leading.equalTo(pointInfoLabel.snp.trailing)
      $0.width.height.equalTo(30)
    }

  }

  private func autolayoutCollectionView() {

    fadeButton.snp.makeConstraints {
      $0.edges.equalTo(collectionView)
    }

    selectOptionView.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom)
      $0.leading.trailing.equalToSuperview().inset(Metric.marginX)
      $0.height.equalTo(collectionView.snp.height).multipliedBy(0.47)
    }

    collectionView.snp.makeConstraints {
      $0.bottom.equalTo(buyingView.snp.top)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.6)
    }
  }

  // MARK: - Calculate total
  private func totalPrice() -> Int {
    return shoppingCartList.reduce(0) { $0 + $1.price * $1.quantity }
  }

  private func totalQuantity() -> Int {
    return shoppingCartList.reduce(0) { $0 + $1.quantity }
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  // MARK: - Update Cart
  private func updateCart() {
    priceInfoLabel.attributedText = getAttributedText()
    collectionView.reloadData()
  }

  private func getAttributedText() -> NSAttributedString {

    let mutableAttributedString = NSMutableAttributedString()

    let attributesGray: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 13),
      .foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    ]

    let attributesGrayLine: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 17),
      .foregroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    ]

    let attributesBlack: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 15),
      .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    ]

    let totoal = NSMutableAttributedString(string: "총 개수 ",
                                           attributes: attributesGray)

    let quantity = NSMutableAttributedString(string: "\(totalQuantity())개 ",
                                           attributes: attributesBlack)
    let line = NSMutableAttributedString(string: " | ",
      attributes: attributesGrayLine)

    let total = NSMutableAttributedString(string: " 합계",
      attributes: attributesGray)
    let price = NSMutableAttributedString(string: " \(totalPrice())원(배송비 제외)",
                                              attributes: attributesBlack)

    mutableAttributedString.append(totoal)
    mutableAttributedString.append(quantity)
    mutableAttributedString.append(line)
    mutableAttributedString.append(total)
    mutableAttributedString.append(price)
    return mutableAttributedString
  }

  // MARK: - Touch Button action
  @objc private func downEventButton(_ sender: UIButton) {
    sender.isHighlighted.toggle()
  }

  private func alertBuying() {
    let alert = UIAlertController(title: "주문", message: "주문을 하시겠습니까?", preferredStyle: .alert)
    let okAlert = UIAlertAction(title: "주문", style: .default) { [weak self] (_) in

      var id = ""
      var option = ""
      var quantity = ""

      self?.shoppingCartList.forEach {
        id = "\($0.productId)"
        option += "\($0.productId),"
        quantity += "\($0.quantity),"
      }

      option.removeLast()
      quantity.removeLast()

      print("id: \(id), option: \(option), quantity: \(quantity)")

      let postData = NSMutableData(data: "pd_id=\(id)".data(using: String.Encoding.utf8)!)
      postData.append("&po_list=\(option)".data(using: String.Encoding.utf8)!)
      postData.append("&qty_list=\(quantity)".data(using: String.Encoding.utf8)!)

      self?.postOrderProducts(post: postData as Data)

    }

    let cancel = UIAlertAction(title: "취소", style: .destructive)

    alert.addAction(okAlert)
    alert.addAction(cancel)

    present(alert, animated: true)
  }

  @objc private func touchUpBuyingButton(_ sender: UIButton) {
    alertBuying()
  }

  @objc private func touchUpShoppingBagButton(_ sender: UIButton) {

    let postCartList = shoppingCartList.map { (cart) -> NSMutableData in

      let postData = NSMutableData(data: "product=\(cart.productId)".data(using: String.Encoding.utf8)!)
      postData.append("&product_option=\(cart.optionId)".data(using: String.Encoding.utf8)!)
      postData.append("&quantity=\(cart.quantity)".data(using: String.Encoding.utf8)!)

      return postData
    }

    for cart in postCartList {

      postShoppingCartItem(post: cart as Data)
    }

  }

  @objc private func touchUpquestionButton(_ sender: UIButton) {

  }

  @objc private func touchUpDissmiss(_ sender: UIButton) {

    self.presentingViewController?.dismiss(animated: false, completion: nil)
  }

  @objc private func touchUpFadeButton(_ sender: UIButton) {
    hideFadeView()
  }

  // MARK: - call noticenter
  @objc private func selectOption(_ sender: Notification) {
    if let userInfo = sender.userInfo as? [String: Int],
      let row = userInfo["indexPathRow"] {

      hideFadeView()

      for cort in shoppingCartList {
        if cort.optionId == options[row].id {

          return print("equal option")
        }
      }

      let option = ShoppingCart(productId: options[row].product,
                   optionId: options[row].id,
                   optionName: options[row].name,
                   price: options[row].price,
                   quantity: 1)

      shoppingCartList.append(option)

    } else {

      print("fail")
    }
  }

  @objc private func deleteOption(_ sender: Notification) {
    if let userInfo = sender.userInfo as? [String: Int],
      let row = userInfo["indexPathRow"] {

      print(row)
      shoppingCartList.remove(at: row)
      updateCart()
    }
  }

  @objc private func showOptionsView(_ sender: Notification) {
    showFadeView()
  }

  @objc private func hideOptionsView(_ sender: Notification) {
    hideFadeView()
  }

  private func hideFadeView() {

    UIView.animate(withDuration: 0.3, animations: { [weak self] in

      self?.fadeButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)

      if let bottom = self?.collectionView.snp.bottom {
        self?.selectOptionView.snp.updateConstraints {

          $0.top.equalTo(bottom)
        }
      }

      self?.view.layoutIfNeeded()
    }) { [weak self] _ in
      if let view = self?.collectionView {
        self?.view.bringSubviewToFront(view)
      }
    }
  }

  // MARK: - Animation Show View
  private func showFadeView() {
    fadeButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
    view.bringSubviewToFront(fadeButton)
    view.bringSubviewToFront(selectOptionView)
    view.bringSubviewToFront(buyingView)
    UIView.animate(withDuration: 0.5) { [weak self] in

      self?.fadeButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
      if let bottom = self?.collectionView.snp.bottom,
        let height = self?.collectionView.frame.height {

        self?.selectOptionView.snp.updateConstraints {

          $0.top.equalTo(bottom).offset(-(height/2))
        }
      }
      self?.view.layoutIfNeeded()
    }
  }

  // MARK: - postShoppingCartItem
  private func postShoppingCartItem(post: Data) {
    service.postShoppingCartItem(cartData: post) { result in
      switch result {
      case .success(let list):
        print(list)

        DispatchQueue.main.async { [weak self] in
          self?.shoppingCartList.removeAll()

          self?.presentingViewController?.dismiss(animated: false, completion: { [weak self] in
            self?.showCart?()
          })

        }

        break
      case .failure(let error):
        print("fetchStoreHome: \(error.localizedDescription)")
      }
    }
  }

  // MARK: - postOrderProducts
  private func postOrderProducts(post: Data) {
    service.postOrderProducts(data: post) { result in
      switch result {
      case .success(let list):
        print(list)

        DispatchQueue.main.async { [weak self] in
          self?.shoppingCartList.removeAll()
          self?.presentingViewController?.dismiss(animated: false, completion: nil)
        }

        break
      case .failure(let error):
        print("fetchStoreHome: \(error.localizedDescription)")
      }
    }
  }

}

extension BuyingVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

    return shoppingCartList.count
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader,
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BuyingProductOptionsHeaderView.identifier, for: indexPath) as? BuyingProductOptionsHeaderView {
      if let first = options.first {

        header.optionButton.setTitle(first.type, for: .normal)
      }

      return header
    } else {
      let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BuyingProductOptionsFooterView.identifier, for: indexPath)

      if let footer = footer as? BuyingProductOptionsFooterView {
        footer.priceLabel.text = "\(formetter(price: totalPrice()))"
      }

      return footer
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(BuyingProductOptionCell.self, indexPath)

    cell.indexPathRow = indexPath.row
    cell.shoppingCart = shoppingCartList[indexPath.row]
    cell.reloadPrice = { [weak self] in self?.updateCart() }
    return cell
  }

}

extension BuyingVC: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

    return CGSize(width: UIScreen.main.bounds.width - Metric.marginX*2, height: 70)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

    if section == 1 { return CGSize(width: UIScreen.main.bounds.width, height: 50) }

    return CGSize(width: UIScreen.main.bounds.width - Metric.marginX*2, height: 40)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

    return UIEdgeInsets(top: 5, left: 1, bottom: 5, right: 1)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: UIScreen.main.bounds.width - Metric.marginX, height: 70)
  }

}
