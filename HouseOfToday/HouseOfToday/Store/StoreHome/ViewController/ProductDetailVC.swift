//
//  ProductDetailVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 20/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

extension ProductDetailVC {
  static var cellSpread: Notification.Name {
    return Notification.Name("cellSpread")
  }
  static var present: Notification.Name {
    return Notification.Name("present")
  }
  static var progressUpdate: Notification.Name {
    return Notification.Name("progressUpdate")
  }
  static var presentFormBottom: Notification.Name {
    return Notification.Name("presentFormBottom")
  }
  static var presentPicDetail: Notification.Name {
    return Notification.Name("presentPicDetail")
  }
  static var downloadDetail: Notification.Name {
    return Notification.Name("downloadDetail")
  }
}

final class ProductDetailVC: UIViewController {

  // MARK: - Property

  private let service: HouseOfTodayServiceType = HouseOfTodayService()

  private lazy var bottomView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.7)

    return view
  }()

  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.register(cell: ProductMainCell.self)
    colV.register(cell: ProductStylingCell.self)
    colV.register(cell: ProductInfomationCell.self)
    colV.register(cell: PopularityProductCell.self)
    colV.backgroundColor = .white
    colV.dataSource = self
    colV.delegate = self
    view.addSubview(colV)
    return colV
  }()

  private lazy var progressBar: UIProgressView = {
    let progress = UIProgressView(progressViewStyle: .default)
    progress.progressTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    progress.backgroundColor = .clear
    return progress
  }()

  private var productList: [ProductList] = [] {
    didSet {
      guard !productList.isEmpty else { return print("productList is empty")}

      print("productList called")
      DispatchQueue.main.async { [weak self] in
        let indexSet = IndexSet(integer: 1)
        self?.collectionView.reloadSections(indexSet)
      }
    }
  }

  private var productListTemp: CategoryIdList? {
    didSet {
      guard let products = productListTemp?.products else { return print("productListTemp?.products fail")}
      print("productListTemp called" )
      productList = products.map {
        let imageUrl = $0.thumnailImages.map { Resizing.url($0.image, Int(Metric.popularityProductCellSize.width * 2)).get  }

        return ProductList(id: $0.id,
                           brandName: $0.brandName,
                           productName: $0.productName,
                           discountRate: $0.discountRate,
                           price: $0.price,
                           reviewCount: $0.reviewCount,
                           starAvg: $0.starAvg,
                           thumnailUrl: imageUrl)
      }
    }
  }

  private var productDetail: ProductDetail? = nil {
    didSet {
      guard let info = productDetail else { return print("productDetail is nil")}

      print("ProductDetail called")

      DispatchQueue.main.async { [weak self] in
        let indexSet = IndexSet(integer: 0)

        self?.collectionView.reloadSections(indexSet)
        self?.fetchCategoryID(id: info.category)
      }
    }
  }

  private var reloadedHeight: CGFloat = 0

  private var productImages: [Int: UIImage] = [:]

  let notiCenter = NotificationCenter.default

  private lazy var bookMarkButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "bookMark"), for: .normal)
    btn.setImage(UIImage(named: "bookMarkOpaSelected"), for: .selected)
    btn.setTitle("879", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
    btn.titleEdgeInsets = UIEdgeInsets(top: 10, left: -40, bottom: -20, right: 0)
    btn.imageEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: 0)
    btn.addTarget(self, action: #selector(touchBookMarkButton(_:)), for: .touchUpInside)
    bottomBarView.addSubview(btn)
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
    btn.addTarget(self, action: #selector(touchUpInsideBuyingButton(_:)), for: .touchUpInside)
    btn.addTarget(self, action: #selector(touchallEventBuyingButton(_:)), for: .touchDown)
    bottomBarView.addSubview(btn)
    return btn
  }()

  private lazy var bottomBarView: UIView = {
    let bv = UIView(frame: CGRect.zero)
    bv.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)

    view.addSubview(bv)
    return bv
  }()

  private lazy var cartImageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "whiteCart"))
    iv.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
//    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.layer.cornerRadius = UIScreen.main.bounds.width / 4
    view.addSubview(iv)
    view.sendSubviewToBack(iv)
    return iv
  }()

  private let buyingVC = BuyingVC()

  private var ID = 0

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.tabBarController?.tabBar.isHidden = true
    self.navigationController?.navigationBar.isHidden = false

    autolayoutViews()
    setupNotificationCenter()
    settingProgressView()

  }

  deinit {
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.cellSpread,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.present,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.progressUpdate,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.presentFormBottom,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.presentPicDetail,
                              object: nil)
    notiCenter.removeObserver(self,
                              name: ProductDetailVC.downloadDetail,
                              object: nil)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()

    downloadDetail(id: ID)
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)

    ProductInfomationView.height = 600
    progressBar.isHidden = true
  }

  // MARK: - configure
  private func autolayoutViews() {

    collectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    bottomBarView.snp.makeConstraints {
      $0.bottom.leading.trailing.equalToSuperview()
      $0.height.equalTo(100)
    }

    buyingButton.snp.makeConstraints {
      $0.top.equalTo(bottomBarView.snp.top).offset(Metric.marginY/3)
      $0.trailing.equalTo(bottomBarView.snp.trailing).offset(-Metric.marginX/3)
      $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-Metric.marginY/3)
      $0.leading.equalTo(bottomBarView.snp.leading).offset(Metric.marginX * 4)
    }

    bookMarkButton.snp.makeConstraints {
      $0.top.equalTo(buyingButton)
      $0.leading.equalTo(bottomBarView).offset(Metric.marginX)
      $0.height.equalTo(buyingButton)
      $0.width.equalTo(40)
    }

    cartImageView.snp.makeConstraints {
      $0.center.equalToSuperview()
      $0.width.height.equalTo(UIScreen.main.bounds.width/2)
    }
  }

  // MARK: - Setting NotofocationCenter
  private func setupNotificationCenter() {
    notiCenter.addObserver(self,
                           selector: #selector(reloadCollectionView(_:)),
                           name: ProductDetailVC.cellSpread,
                           object: nil)

    notiCenter.addObserver(self,
                           selector: #selector(presentVC(_:)),
                           name: ProductDetailVC.present,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(updateProgressView(_:)),
                           name: ProductDetailVC.progressUpdate,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(presentFromBottom(_:)),
                           name: ProductDetailVC.presentFormBottom,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(presentPicDetail(_:)),
                           name: ProductDetailVC.presentPicDetail,
                           object: nil)
    notiCenter.addObserver(self,
                           selector: #selector(reloadDetail(_:)),
                           name: ProductDetailVC.downloadDetail,
                           object: nil)
  }

  // MARK: - Setting Progress View
  private func settingProgressView() {

    if let naviBar = navigationController?.navigationBar {
      naviBar.addSubview(progressBar)

      progressBar.snp.makeConstraints {
        $0.bottom.equalTo(naviBar.snp.bottom)
        $0.left.equalTo(naviBar.snp.left)
        $0.right.equalTo(naviBar.snp.right)
      }
    }
  }

  // MARK: -
  public func showCartView() {

    print("showCartView")
    view.bringSubviewToFront(cartImageView)
//    cartView.isHidden
    UIView.animateKeyframes(withDuration: 1.5,
                            delay: 0,
                            options: [],
                            animations: { [weak self] in
                              UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3, animations: { [weak self] in
                                if let cartView = self?.cartImageView {
                                  cartView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                                }
                                self?.view.layoutIfNeeded()
                              })

                              UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5, animations: { [weak self] in

                                if let cartView = self?.cartImageView {
                                  cartView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
//                                  cartView.alpha = 0
                                }

                                self?.view.layoutIfNeeded()
                              })
                              UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.8, animations: { [weak self] in

                                if let cartView = self?.cartImageView {
                                  cartView.transform = CGAffineTransform(scaleX: 1, y: 1)
                                  cartView.alpha = 0
                                }

                                self?.view.layoutIfNeeded()
                              })
    }) { [weak self] _ in
      guard let cartView = self?.cartImageView else { return }

      self?.view.sendSubviewToBack(cartView)
      cartView.alpha = 1
    }

  }

  @objc private func touchBookMarkButton(_ sender: UIButton) {
    print("touchBookMarkButton")

    sender.isSelected.toggle()

    UIView.animate(withDuration: 0.1, animations: {// [weak self]
      sender.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }) { bool in
      if bool {
        UIView.animate(withDuration: 0.1, animations: { //[weak self] _ in
          sender.transform = .identity
        })
      }
    }
  }

  // MARK: - buying button click
  @objc private func touchUpInsideBuyingButton(_ sender: UIButton) {

    if let options = productDetail?.productOption {

      buyingVC.options = options
      buyingVC.showCart = showCartView
      buyingVC.modalTransitionStyle = .crossDissolve
      buyingVC.modalPresentationStyle = .overFullScreen
      present(buyingVC, animated: true)
    }

  }

  @objc private func touchallEventBuyingButton(_ sender: UIButton) {

    sender.isHighlighted.toggle()
  }

  private func configureNaviBar() {
    self.title = "BEST"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)

    let rightItem = UIBarButtonItem.setButton(self, action: #selector(cartButtonDidTap(_:)), imageName: "cart2")
    navigationItem.setRightBarButton(rightItem, animated: true)
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - present ShoppingCartVC
  @objc private func cartButtonDidTap(_ sender: Any) {

    //    let shoppingCartVC = ShoppingCartVC()

    let cartVC = CartVC()

    let navi = UINavigationController(rootViewController: cartVC)

    let transition = CATransition()
    transition.duration = 0.5
    transition.type = CATransitionType.moveIn
    transition.subtype = CATransitionSubtype.fromRight
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    view.window!.layer.add(transition, forKey: kCATransition)

    present(navi, animated: true)
  }

  // MARK: - update progress view
  @objc private func updateProgressView(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: Float],
      let value = userInfo["progressUpdate"]
      else {
        return print("fail down casting -> updateProgressView")
    }

    if progressBar.progress + value < 0.95 {
      let update = progressBar.progress + value
      progressBar.setProgress(update, animated: true)
      progressBar.isHidden = false
    } else {
      progressBar.isHidden = true
    }
//    print("progressBar.progress: \(progressBar.progress)")
  }

  // MARK: - setReload collectionView
  @objc private func reloadCollectionView(_ sender: Notification) {
    print("reloadCollectionView Click")
    guard let userInfo = sender.userInfo as? [String: CGFloat],
      let value = userInfo["TotalHeight"]
      else {
        return print("fail down casting -> reloadCollectionView")
    }

    reloadedHeight = value

    collectionView.reloadData()
  }

  @objc private func presentFromBottom(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: UIViewController],
      let vc = userInfo["viewController"]
      else {
        return print("fail down casting-> presentFromBottom")
    }
    print("fail down casting-> ??????")
    let transition: CATransition = CATransition()
    transition.duration = 0.5
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition.type = CATransitionType.push
    transition.subtype = CATransitionSubtype.fromTop
    self.navigationController?.view.layer.add(transition, forKey: kCATransition)

    self.navigationController?.pushViewController(vc, animated: false)
  }

  // MARK: - presentReview NotificationCenter
  @objc private func presentVC(_ sender: Notification) {
    print("presentReview Click")

    guard let userInfo = sender.userInfo as? [String: UIViewController],
      let vc = userInfo["viewController"]
      else {
        return print("fail down casting: -> presentVC")
    }

    self.navigationController?.pushViewController(vc, animated: true)
  }

  @objc private func presentPicDetail(_ sender: Notification) {

    guard let userInfo = sender.userInfo as? [String: Int],
      let index = userInfo["picDetail"]
      else {
        return print("fail down casting: -> presentVC")
    }

    let pic = PicDetailVC()
    pic.fetchPicDetailList(id: index)
    self.navigationController?.pushViewController(pic, animated: true)
  }

  @objc private func reloadDetail(_ sender: Notification) {

//    downloadDetail(id: ID)
  }

  // MARK: - FetchProductDetail
  public func fetchProductDetail(id: Int) {

    self.ID = id

  }

  private func downloadDetail(id: Int) {
    service.fetchProductDetail(id: id) { result in
      switch result {
      case .success(let product):
        print("success!!! ProductDetail")
        self.productDetail = product

//        DispatchQueue.main.async {
//          self.reloadProductInfo?()
//        }
      case .failure(let error):
        print("fetchProductDetail Error: \(error.localizedDescription)")
      }
    }
  }

  public func fetchCategoryID(id: Int) {

    service.fetchCategoryIdList(id: id) { result in
      switch result {
      case .success(let list):
        print("success!!! List Count: \(list.products.count)")

        self.productListTemp = list
      case .failure(let error):

        print("fetchCategoryList Error: \(error.localizedDescription)")
      }
    }
  }

  private var reloadProductInfo: (() -> Void)?

  private func reloadProduct() {
    guard let reload = reloadProductInfo else { return print("reloadProductInfo is nil")}

    reload()
  }

}

// MARK: - UICollectionViewDataSource
extension ProductDetailVC: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 {
      print("numberOfItemsInSection")
      return self.productDetail == nil ? 0 : 1 //1
    } else {
      print("productList.count: \(productList.count)")
      return productList.count
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    if indexPath.section == 0 {
      if indexPath.item == 0 {
        let cell = collectionView.dequeue(ProductMainCell.self, indexPath)
        if reloadedHeight == 0 {
//          cell.productDetail = self.productDetail
          reloadProductInfo = { [weak self] in cell.productDetail = self?.productDetail }
          reloadProductInfo?()
        } else {
          cell.updateHeight()
        }
        return cell
      } else if indexPath.item == 1 {
        let cell = collectionView.dequeue(ProductStylingCell.self, indexPath)

        return cell
      } else {
        let cell = collectionView.dequeue(ProductInfomationCell.self, indexPath)
        cell.productDetail = self.productDetail
        return cell
      }
    } else {
      let cell = collectionView.dequeue(PopularityProductCell.self, indexPath)

      return cell
    }
  }
}

extension ProductDetailVC: UICollectionViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {

    guard let cell = self.collectionView.cellForItem(at: IndexPath(row: 0, section: 0)),
      let mainCell = cell as? ProductMainCell else { return }

    if SwipeImageview.height > scrollView.bounds.origin.y + view.safeAreaInsets.top {
      mainCell.updateSwipeImageViewPosition(positionY: (scrollView.bounds.origin.y + view.safeAreaInsets.top) / 2)
    }
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? PopularityProductCell {
      cell.productInfo = self.productList[indexPath.item]
    }
  }

  func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

    if let cell = cell as? PopularityProductCell {
      cell.stopDownloadImage()
    }
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    guard indexPath.section == 1 else { return print("section is 0")}

    let vc = ProductDetailVC()

    vc.fetchProductDetail(id: productList[indexPath.item].id)

    navigationController?.pushViewController(vc, animated: true)
  }

}

extension ProductDetailVC: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    if indexPath.section == 0 {
      if indexPath.item == 0 {
          return CGSize(width: UIScreen.main.bounds.width, height: ProductMainCell.height)
      } else if indexPath.item == 1 {
        return CGSize(width: UIScreen.main.bounds.width, height: ProductStylingCell.height)
      } else {
        return CGSize(width: UIScreen.main.bounds.width, height: 400)
      }
    } else {
      return Metric.popularityProductCellSize
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    if section == 1 {
      return Metric.dealOfTodayCellInset
    } else {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
  }
}
