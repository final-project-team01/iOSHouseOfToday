//
//  ShoppingCartCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 05/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ShoppingCartCell: UITableViewCell {

  // MARK: - Property
  static var identifier: String = "ShoppingCartCell"

  private lazy var grayView: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    contentView.addSubview(view)
    return view
  }()

  private lazy var bandNameLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "brand name 배송"
    contentView.addSubview(label)
    return label
  }()

  private lazy var firstLineView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.darkGray.cgColor
    view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    contentView.addSubview(view)
    return view
  }()

  public lazy var checkButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "selected"), for: .selected)
    btn.setImage(UIImage(named: "unselected"), for: .normal)
    btn.isSelected = true
    btn.addTarget(self, action: #selector(touchUpcheckButton(_:)), for: .touchUpInside)
    contentView.addSubview(btn)
    return btn
  }()

  private lazy var thumnailImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.clipsToBounds = true
    iv.layer.cornerRadius = 20
    iv.contentMode = .scaleAspectFit
    iv.backgroundColor = .green
    contentView.addSubview(iv)
    return iv
  }()

  private lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "product name askjdfnlaksudfblasudfb"
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    contentView.addSubview(label)
    return label
  }()

  private lazy var cancelButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("×", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)
    btn.backgroundColor = .white
    btn.addTarget(self, action: #selector(touchUpDeleteButton(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  private lazy var deleveryLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "무료배송 | 일반택배"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    contentView.addSubview(label)
    return label
  }()

  private lazy var secondLineView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.darkGray.cgColor
    view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    contentView.addSubview(view)
    return view
  }()

  public lazy var tableView: UITableView = {
    let tv = UITableView(frame: .zero, style: .plain)
    tv.alwaysBounceVertical = true
    tv.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    tv.dataSource = self
    tv.delegate = self
    tv.rowHeight = UITableView.automaticDimension
    tv.backgroundColor = .white
    tv.allowsSelection = true
    tv.register(OptionHeaderView.self, forHeaderFooterViewReuseIdentifier: OptionHeaderView.identifier)
    tv.register(cell: OptionTableCell.self)
    tv.backgroundColor = .red
    return tv
  }()

  private lazy var changeOptionButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.setTitle("옵션변경", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    contentView.addSubview(btn)
    return btn
  }()

  private lazy var verticalLineLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "|"
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    contentView.addSubview(label)
    return label
  }()

  private lazy var buyingNowButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    btn.setTitle("바로구매", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    contentView.addSubview(btn)
    return btn
  }()

  private lazy var totalPriceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "??,???원"
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    contentView.addSubview(label)
    return label
  }()

  private lazy var deleveryFreeLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "배송비 무료"
    contentView.addSubview(label)
    return label
  }()

  public var productOptions: [ShoppingOptionCart] = [] {
    didSet {
      guard !productOptions.isEmpty, let first = productOptions.first else { return print("ShoppingCartCell productOptions is empty")}

//      print("productOptions", productOptions.first)
      if let url = URL(string: first.thumnailImage) {
        thumnailImageView.kf.setImage(with: url,
                                      placeholder: nil,
                                      options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                      progressBlock: nil) { (_) in
        }
      }

      bandNameLabel.text = first.brandName
      productNameLabel.text = first.product
      totalPriceLabel.text = "\(formetter(price: productOptions.reduce(0, { $0 + $1.totalPrice })) )원"

      layoutIfNeeded()
    }
  }

  public var cellIndex = 0

  public var firstCell = ""

  private var islayout = false

  // MARK: - View life cycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(tableView)
    autolayoutViews()

    contentView.backgroundColor = .white

    firstLineView.layer.addBorder([.top, .left], color: .black, width: 0.5)
    secondLineView.layer.addBorder([.top], color: .black, width: 0.5)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - configure
  override func layoutSubviews() {
    super.layoutSubviews()

    if tableView.frame.height < tableView.contentSize.height {
      tableView.snp.updateConstraints {
        $0.height.equalTo(tableView.contentSize.height)
      }

      if islayout {
        layoutIfNeeded()
      }
//      print("tableView.frame \(firstCell) Modify: \(tableView.frame.height), \(tableView.contentSize.height)")

    }
  }

  private func autolayoutViews() {

    tableView.snp.makeConstraints {
      $0.top.equalTo(thumnailImageView.snp.bottom)//.offset(Metric.marginY)
      $0.leading.equalTo(thumnailImageView)
      $0.trailing.equalToSuperview().inset(Metric.marginX)
      $0.height.equalTo(0)
    }

    grayView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(Metric.marginY)
    }

    bandNameLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(contentView).inset(Metric.marginY*2)
    }

    firstLineView.snp.makeConstraints {
      $0.top.equalTo(bandNameLabel.snp.bottom).offset(Metric.marginY)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(0.5)
    }

    checkButton.snp.makeConstraints {
      $0.top.equalTo(firstLineView).offset(Metric.marginY)
      $0.leading.equalToSuperview().inset(Metric.marginX)
      $0.width.height.equalTo(30)
    }

    thumnailImageView.snp.makeConstraints {
      $0.top.equalTo(firstLineView).inset(Metric.marginY)
      $0.leading.equalTo(checkButton.snp.trailing).offset(Metric.marginY/2)
      $0.width.height.equalTo(80)
    }

    cancelButton.snp.makeConstraints {
      $0.top.equalTo(thumnailImageView.snp.top).offset(-Metric.marginY/2)
      $0.trailing.equalToSuperview().inset(Metric.marginX).offset(-Metric.marginY/2)
    }

    productNameLabel.snp.makeConstraints {
      $0.top.equalTo(thumnailImageView.snp.top).offset(5)
      $0.leading.equalTo(thumnailImageView.snp.trailing).offset(Metric.marginX/2)
      $0.trailing.equalToSuperview().inset(Metric.marginX*3)
    }

    deleveryLabel.snp.makeConstraints {
      $0.top.equalTo(productNameLabel.snp.bottom).offset(Metric.marginY/2)
      $0.leading.equalTo(productNameLabel)
    }

    ///

    changeOptionButton.snp.makeConstraints {
      $0.top.equalTo(tableView.snp.bottom).offset(Metric.marginY)
      $0.leading.equalTo(tableView)
    }

    verticalLineLabel.snp.makeConstraints {
      $0.centerY.equalTo(changeOptionButton)
      $0.leading.equalTo(changeOptionButton.snp.trailing).offset(Metric.marginX/2)
    }

    buyingNowButton.snp.makeConstraints {
      $0.top.equalTo(changeOptionButton)
      $0.leading.equalTo(verticalLineLabel.snp.trailing).offset(Metric.marginX/2)
    }

    totalPriceLabel.snp.makeConstraints {
      $0.bottom.equalTo(changeOptionButton)
      $0.trailing.equalToSuperview().inset(Metric.marginX)
    }

    secondLineView.snp.makeConstraints {
      $0.top.equalTo(changeOptionButton.snp.bottom).offset(Metric.marginY)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(0.5)
    }

    deleveryFreeLabel.snp.makeConstraints {
      $0.top.equalTo(secondLineView.snp.bottom).offset(Metric.marginY)
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(contentView).offset(-Metric.marginY)
    }

  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

  // MARK: - touchUpDeleteButton
  @objc private func touchUpDeleteButton(_ sender: UIButton) {
    print("touchUpDeleteButton")
  }

  @objc private func touchUpcheckButton(_ sender: UIButton) {
    checkButton.isSelected.toggle()

    let info: [String: Any] = ["index": cellIndex, "check": checkButton.isSelected]

    NotificationCenter.default.post(name: CartVC.checkedButton, object: nil, userInfo: info)
  }

}

extension ShoppingCartCell: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
//    print("productOptions \(cellIndex) numberOfSections: \(productOptions.count)")
    print("index \(cellIndex),  count: \(productOptions.count)")
    return productOptions.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return Metric.marginY/2
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: OptionHeaderView.identifier)
    header?.backgroundColor = .white
    return header
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(OptionTableCell.self)
    print("index: \(cellIndex), \(productOptions[indexPath.section].productOption) ")
    cell.optionName.text = productOptions[indexPath.section].productOption
    cell.priceLabel.text = "\(formetter(price: productOptions[indexPath.section].totalPrice))원"
    cell.quantityButton.setTitle("\(productOptions[indexPath.section].quantity)", for: .normal)
    return cell
  }

}

extension ShoppingCartCell: UITableViewDelegate {

  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

//    print("tableView.frame \(firstCell) willDisplay inner \(indexPath)")
    if let cell = cell as? OptionTableCell {
      cell.optionName.text = productOptions[indexPath.section].productOption
      cell.priceLabel.text = "\(formetter(price: productOptions[indexPath.section].totalPrice))원"
      cell.quantityButton.setTitle("\(productOptions[indexPath.section].quantity)", for: .normal)
    }
    if indexPath.section == productOptions.count - 1 {
      islayout = true
      layoutIfNeeded()
//      print("tableView.frame \(firstCell) layoutIfNeeded")
    }
  }

  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}
