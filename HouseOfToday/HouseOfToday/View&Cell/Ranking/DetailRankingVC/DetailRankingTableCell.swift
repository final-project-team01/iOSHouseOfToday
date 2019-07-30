//
//  DetailRankingTableCell.swift
//  HouseOfToday
//
//  Created by Daisy on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class DetailRankingTableCell: UITableViewCell {

  // FIXME: - ProductDetailVC에서 하는 FetchProductDetail 참고해서 id정보 넘길 수 있게 만들기
  // HomeVC에서도 id받기

  lazy var countLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    addSubview(label)
    return label
  }()

  lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.image = UIImage(named: "product")
    imageView.layer.masksToBounds = true
    imageView.layer.cornerRadius = 10
    addSubview(imageView)
    return imageView
  }()

  lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Label 1asldkfjhaslkjdfhalksjdfalkjhdf"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 2
    label.font = FontFoundation.brandnameFont
    label.textColor = .black
    addSubview(label)
    return label
  }()

  lazy var ratingStarRankLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "4.4"
    label.font = FontFoundation.starReviewFont
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 0.08574206382, green: 0.7608343959, blue: 0.9359433651, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 3
    addSubview(label)
    return label
  }()

  lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰 189"
    label.font = FontFoundation.starReviewFont
    label.textColor = FontFoundation.brandnameReviewColor
    addSubview(label)
    return label
  }()

  lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = formetter(price: 123 )
    label.font = FontFoundation.priceFont
    label.textColor = FontFoundation.priceColor
    addSubview(label)
    return label
  }()

  lazy var discountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "80%"
    label.textColor = #colorLiteral(red: 0.08574206382, green: 0.7608343959, blue: 0.9359433651, alpha: 1)
    label.font = UIFont.boldSystemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var scrapButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "bookMarkOpa"), for: .normal)
    button.setImage(UIImage(named: "bookMarkOpaSelected"), for: .selected)
    button.addTarget(self, action: #selector(didTapScrapButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var starReviewStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ratingStarRankLabel, reviewCountLabel])
    stackView.axis = .horizontal
    stackView.alignment = .leading
    stackView.distribution = .fill
    stackView.spacing = 10
    addSubview(stackView)
    return stackView
  }()

  private lazy var priceDiscountStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [priceLabel, discountLabel])
    stackView.axis = .horizontal
    stackView.alignment = .bottom
    stackView.distribution = .fill
    stackView.spacing = 5
    addSubview(stackView)
    return stackView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super .init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    cellAutolayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func didTapScrapButton(_ sender: UIButton) {
    sender.isSelected.toggle()
  }

   private func cellAutolayout() {

    let margin: CGFloat = 15

    countLabel.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(margin)
      make.trailing.equalTo(thumnailImageView.snp.leading).inset(-margin)
      make.centerY.equalToSuperview()
    }

    thumnailImageView.snp.makeConstraints { make in
      make.centerY.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.25)
      make.height.equalTo(thumnailImageView.snp.width)
    }
    productNameLabel.snp.makeConstraints { make in
      make.top.equalTo(thumnailImageView.snp.top)
      make.leading.equalTo(thumnailImageView.snp.trailing).offset(margin/2)
      make.trailing.lessThanOrEqualTo(scrapButton.snp.leading)
    }
    starReviewStackView.snp.makeConstraints { make in
      make.top.equalTo(productNameLabel.snp.bottom).offset(margin/2)
      make.leading.equalTo(thumnailImageView.snp.trailing).offset(margin/2)
    }
    priceDiscountStackView.snp.makeConstraints { make in
      make.top.equalTo(starReviewStackView.snp.bottom).offset(margin/2)
      make.leading.equalTo(thumnailImageView.snp.trailing).offset(margin/2)
    }
    scrapButton.snp.makeConstraints { make in
      make.top.trailing.bottom.equalToSuperview().inset(margin)
      make.centerY.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.1)
    }

  }

  // MARK: - Image Download & setImage
  func setImage(thumnailUrl: URL) {

    thumnailImageView.kf.setImage(with: thumnailUrl,
                                  placeholder: nil,
                                  options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                  progressBlock: nil) { (_) in
    }
  }

  public func stopDownloadImage() {
    thumnailImageView.kf.cancelDownloadTask()
  }

  // 가격 세자리 수 formetter
  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }
}
