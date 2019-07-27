//
//  DetailProductFirstView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 24/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class DetailProductFirstView: UIView {

  static let height = UIScreen.main.bounds.height * 0.4

  // MARK: - Property
  private lazy var brandLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "brand"
    label.textColor = UIColor.lightGray
//    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var productNameLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "product Name Label 1asldkfjhaslkjdfhalksjdfalkjhdfasdfasdfasdfasdfasdf"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
    addSubview(label)
    return label
  }()

  private lazy var shareButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "share"), for: .normal)
    addSubview(btn)
    return btn
  }()

  private lazy var shareCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.2
    label.text = "555"
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var ratingStarLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★★★★★"
    addSubview(label)
    return label
  }()

  private lazy var ratingStarScoreLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "1.8k"
    addSubview(label)
    return label
  }()

  private lazy var discountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "80%"
    //    label.textColor = #colorLiteral(red: 0.08574206382, green: 0.7608343959, blue: 0.9359433651, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15, weight: .light)
    addSubview(label)
    return label
  }()

  private lazy var costPriceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "999,999"
//    label.font = UIFont.systemFont(ofSize: 15, weight: )
    addSubview(label)
    return label
  }()

  private lazy var priceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "111,111원"
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var lowestPriceLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = " 최저가 "
    label.textColor = .white
    label.backgroundColor = #colorLiteral(red: 1, green: 0.4855915308, blue: 0.4643723965, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 3
//    label.font = UIFont.systemFont(ofSize: 10)
    addSubview(label)
    return label
  }()

  private lazy var pointLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "45P"
//    label.font = UIFont.systemFont(ofSize: 10)
    addSubview(label)
    return label
  }()

  private lazy var pointSavingLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "적립해드립니다."
//    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = .darkGray
    addSubview(label)
    return label
  }()

  private lazy var deliveryMethodLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "일반택배"
    label.font = UIFont.systemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var deliveryFreeLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = " 무료배송 "
    label.font = UIFont.systemFont(ofSize: 15)
    label.backgroundColor = #colorLiteral(red: 0.9293405414, green: 0.929452002, blue: 0.9293025732, alpha: 1)
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 3
    addSubview(label)
    return label
  }()

  private lazy var showBrandProductsButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("네이쳐리밍 상품 보기", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
    addSubview(btn)
    return btn
  }()

  private lazy var lineLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.layer.borderColor = UIColor.darkGray.cgColor
    label.layer.borderWidth = 0.5
    addSubview(label)
    return label
  }()

  private lazy var firstLineView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.darkGray.cgColor
    view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    addSubview(view)
    return view
  }()

  private lazy var secondLineView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.darkGray.cgColor
    view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    addSubview(view)
    return view
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

    firstLineView.layer.addBorder([.top, .left], color: .black, width: 0.5)
    secondLineView.layer.addBorder([.top], color: .black, width: 0.5)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {
    let marginX = 15.0
    let marginY = 15.0

    if brandLabel.translatesAutoresizingMaskIntoConstraints {
      brandLabel.snp.makeConstraints {
        $0.top.equalToSuperview()
        $0.leading.equalToSuperview().offset(marginX)
      }
    }

    if productNameLabel.translatesAutoresizingMaskIntoConstraints {
      productNameLabel.snp.makeConstraints {
        $0.top.equalTo(brandLabel.snp.top).offset(marginY)
        $0.leading.equalToSuperview().offset(marginX)
        $0.trailing.equalTo(shareButton.snp.leading).offset(marginX)
      }
    }

    if shareButton.translatesAutoresizingMaskIntoConstraints {
      shareButton.snp.makeConstraints {
        $0.centerY.equalTo(productNameLabel.snp.centerY)
        $0.trailing.equalToSuperview().offset(-marginX)
        $0.width.equalTo(marginX*2)
        $0.height.equalTo(marginX*2)
      }
    }

    if shareCountLabel.translatesAutoresizingMaskIntoConstraints {
      shareCountLabel.snp.makeConstraints {
        $0.top.equalTo(shareButton.snp.bottom)
        $0.trailing.equalTo(shareButton.snp.trailing)
      }
    }

    if ratingStarLabel.translatesAutoresizingMaskIntoConstraints {
      ratingStarLabel.snp.makeConstraints {
        $0.top.equalTo(productNameLabel.snp.bottom).offset(marginY/2)
        $0.leading.equalToSuperview().offset(marginX)
      }
    }

    if ratingStarScoreLabel.translatesAutoresizingMaskIntoConstraints {
      ratingStarScoreLabel.snp.makeConstraints {
        $0.leading.equalTo(ratingStarLabel.snp.trailing).offset(marginX/2)
        $0.top.equalTo(ratingStarLabel.snp.top)
      }
    }

    if discountLabel.translatesAutoresizingMaskIntoConstraints {
      discountLabel.snp.makeConstraints {
        $0.top.equalTo(ratingStarLabel.snp.bottom).offset(marginY)
        $0.leading.equalToSuperview().offset(marginX)
      }
    }

    if costPriceLabel.translatesAutoresizingMaskIntoConstraints {
      costPriceLabel.snp.makeConstraints {
        $0.top.equalTo(discountLabel.snp.top)
        $0.leading.equalTo(discountLabel.snp.trailing).offset(marginX/2)
      }
    }

    if priceLabel.translatesAutoresizingMaskIntoConstraints {
      priceLabel.snp.makeConstraints {
        $0.top.equalTo(discountLabel).offset(marginY/2)
        $0.leading.equalToSuperview().offset(marginX)
      }
    }

    if lowestPriceLabel.translatesAutoresizingMaskIntoConstraints {
      lowestPriceLabel.snp.makeConstraints {
        $0.top.equalTo(priceLabel.snp.top)
        $0.leading.equalTo(priceLabel.snp.trailing).offset(marginX/2)
        $0.height.equalTo(priceLabel.snp.height)
      }
    }

    if pointLabel.translatesAutoresizingMaskIntoConstraints {
      pointLabel.snp.makeConstraints {
        $0.top.equalTo(priceLabel.snp.bottom).offset(marginY)
        $0.leading.equalToSuperview().offset(marginX)
      }
    }

    if pointSavingLabel.translatesAutoresizingMaskIntoConstraints {
      pointSavingLabel.snp.makeConstraints {
        $0.top.equalTo(pointLabel.snp.top)
        $0.leading.equalTo(pointLabel.snp.trailing).offset(marginX/3)
      }
    }

    if firstLineView.translatesAutoresizingMaskIntoConstraints {
      firstLineView.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(marginX)
        $0.trailing.equalToSuperview().offset(-marginX)
        $0.top.equalTo(pointLabel.snp.bottom).offset(marginY)
        $0.height.equalTo(0.5)
      }
    }

    if deliveryMethodLabel.translatesAutoresizingMaskIntoConstraints {
      deliveryMethodLabel.snp.makeConstraints {
        $0.top.equalTo(firstLineView.snp.top).offset(marginY)
        $0.leading.equalToSuperview().offset(marginX)
      }
    }

    if deliveryFreeLabel.translatesAutoresizingMaskIntoConstraints {
      deliveryFreeLabel.snp.makeConstraints {
        $0.top.equalTo(deliveryMethodLabel.snp.bottom).offset(marginY)
        $0.leading.equalToSuperview().offset(marginX)
      }
    }

    if secondLineView.translatesAutoresizingMaskIntoConstraints {
      secondLineView.snp.makeConstraints {
        $0.top.equalTo(deliveryFreeLabel.snp.bottom).offset(marginY * 0.75)
        $0.leading.equalToSuperview().offset(marginX)
        $0.trailing.equalToSuperview().offset(-marginX)
        $0.height.equalTo(0.5)
      }
    }

    if showBrandProductsButton.translatesAutoresizingMaskIntoConstraints {
      showBrandProductsButton.snp.makeConstraints {
        $0.top.equalTo(secondLineView.snp.top).offset(marginY)
        $0.trailing.equalToSuperview().offset(-marginX)
      }
    }
  }

}