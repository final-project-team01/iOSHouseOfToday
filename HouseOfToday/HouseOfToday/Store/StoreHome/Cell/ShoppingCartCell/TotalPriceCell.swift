//
//  TotalPriceCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 05/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class TotalPriceCell: UITableViewCell {

  // MARK: - Property
  static var identifier: String = "TotalPriceCell"

  private lazy var grayView: UIView = {
    let view = UIView(frame: .zero)
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    contentView.addSubview(view)
    return view
  }()

  private lazy var totalProductLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "총 상품금액"
    contentView.addSubview(label)
    return label
  }()

  private lazy var totalProductPriceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "???,???원"
    contentView.addSubview(label)
    return label
  }()

  private lazy var totalDeleveryLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "총 배송비"
    contentView.addSubview(label)
    return label
  }()

  private lazy var totalDeleveryPriceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "+₊✚ ?원"
    contentView.addSubview(label)
    return label
  }()

  private lazy var totalDiscountLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "총 할인금액"
    contentView.addSubview(label)
    return label
  }()

  private lazy var totalDiscountPriceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "- ??,???원"
    contentView.addSubview(label)
    return label
  }()

  private lazy var totalPaymentLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "결제금액"
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    contentView.addSubview(label)
    return label
  }()

  private lazy var totalPaymentPriceLabel: UILabel = {
    let label = UILabel(frame: .zero)
    label.text = "??,???원"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    contentView.addSubview(label)
    return label
  }()

  // MARK: - View life cycle

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    autolayoutView()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

  }

  private func autolayoutView() {

    if grayView.translatesAutoresizingMaskIntoConstraints {
      grayView.snp.makeConstraints {
        $0.top.equalTo(contentView)//.offset(-Metric.marginY)
        $0.leading.trailing.equalTo(contentView)
        $0.height.equalTo(Metric.marginY)
      }
    }

    if totalProductLabel.translatesAutoresizingMaskIntoConstraints {
      totalProductLabel.snp.makeConstraints {
        $0.top.equalTo(contentView).offset(Metric.marginY*2)
        $0.leading.equalTo(contentView).offset(Metric.marginX)
        $0.trailing.equalTo(contentView)
      }
    }

    if totalProductPriceLabel.translatesAutoresizingMaskIntoConstraints {
      totalProductPriceLabel.snp.makeConstraints {
        $0.top.equalTo(totalProductLabel)
        $0.trailing.equalToSuperview().inset(Metric.marginX)
      }
    }

    if totalDeleveryLabel.translatesAutoresizingMaskIntoConstraints {
      totalDeleveryLabel.snp.makeConstraints {
        $0.top.equalTo(totalProductLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if totalDeleveryPriceLabel.translatesAutoresizingMaskIntoConstraints {
      totalDeleveryPriceLabel.snp.makeConstraints {
        $0.top.equalTo(totalDeleveryLabel)
        $0.trailing.equalToSuperview().inset(Metric.marginX)
      }
    }

    if totalDiscountLabel.translatesAutoresizingMaskIntoConstraints {
      totalDiscountLabel.snp.makeConstraints {
        $0.top.equalTo(totalDeleveryLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if totalDiscountPriceLabel.translatesAutoresizingMaskIntoConstraints {
      totalDiscountPriceLabel.snp.makeConstraints {
        $0.top.equalTo(totalDiscountLabel)
        $0.trailing.equalToSuperview().inset(Metric.marginX)
      }
    }

    if totalPaymentLabel.translatesAutoresizingMaskIntoConstraints {
      totalPaymentLabel.snp.makeConstraints {

        $0.top.equalTo(totalDiscountLabel.snp.bottom).offset(Metric.marginY*1.5)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.bottom.equalToSuperview().offset(-Metric.marginY)
      }
    }

    if totalPaymentPriceLabel.translatesAutoresizingMaskIntoConstraints {
      totalPaymentPriceLabel.snp.makeConstraints {
        $0.top.equalTo(totalPaymentLabel)
        $0.trailing.equalToSuperview().inset(Metric.marginX)
        $0.bottom.equalTo(totalPaymentLabel)
      }
    }
  }

}
