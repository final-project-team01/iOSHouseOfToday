//
//  ProductMainCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ProductMainCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "ProductMainCell"

//  static let height = SwipeImageview.height + DetailProductFirstView.height + UsersStylingShotView.height + ProductInfomationView.height + ProductReviewView.height + ExhibitionView.height// + Metric.marginX * 10

  static var height: CGFloat {
    var height = SwipeImageview.height
    height += DetailProductFirstView.height
    height += UsersStylingShotView.height
    height += ProductInfomationView.height
    height += ProductReviewView.height
    height += ExhibitionView.height

    height += Metric.marginX * 10
    return height

  }
  // FIXME: - 시간나면 collectionview가 아닌 image paging animation으로 바꾸라
  private let swipeImageView = SwipeImageview()

  private let firstView = DetailProductFirstView()

  private let userStylingView = UsersStylingShotView()

  private let productInfoView = ProductInfomationView()

  private let productReviewView = ProductReviewView()

  private let exhibitionView = ExhibitionView()

  public var productDetail: ProductDetail? = nil {
    didSet {
      guard let info = productDetail else { return }

      swipeImageView.imageUrls = info.thumnailImages.map({ $0.image })

      firstView.productDetail = info
      productInfoView.productDetail = info
      productReviewView.productDetailData = info
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

    addSubview(swipeImageView)
    addSubview(firstView)
    addSubview(userStylingView)
    addSubview(productInfoView)
    addSubview(productReviewView)
    addSubview(exhibitionView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    autolayoutViews()

//    print("userStylingView:", userStylingView.frame.height)
  }

  // MARK: - configure
  private func autolayoutViews() {

    if swipeImageView.translatesAutoresizingMaskIntoConstraints {
      swipeImageView.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(SwipeImageview.height)
        $0.top.equalToSuperview()

        $0.bottom.equalTo(firstView.snp.top).offset(0)
      }
    }

    if firstView.translatesAutoresizingMaskIntoConstraints {
      firstView.snp.makeConstraints {
        $0.top.equalToSuperview().offset(SwipeImageview.height)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(DetailProductFirstView.height)
      }
    }

    if userStylingView.translatesAutoresizingMaskIntoConstraints {
      userStylingView.snp.makeConstraints {
        $0.top.equalTo(firstView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(UsersStylingShotView.height)
      }
    }

    if productInfoView.translatesAutoresizingMaskIntoConstraints {
      productInfoView.snp.makeConstraints {
        $0.top.equalTo(userStylingView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(ProductInfomationView.height)
      }
    }

    if productReviewView.translatesAutoresizingMaskIntoConstraints {
      productReviewView.snp.makeConstraints {
        $0.top.equalTo(productInfoView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(ProductReviewView.height)
      }
    }

    if exhibitionView.translatesAutoresizingMaskIntoConstraints {
      exhibitionView.snp.makeConstraints {
        $0.top.equalTo(productReviewView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(ExhibitionView.height)
      }
    }
  }

  public func updateSwipeImageViewPosition(positionY: CGFloat) {

//    guard positionY > 0 else { return print("positionY: \(positionY)")}

    if 0..<swipeImageView.frame.height ~= positionY {
//      print("positionY: \(positionY)")
      swipeImageView.snp.updateConstraints {
        $0.top.equalToSuperview().offset(positionY)
        $0.bottom.equalTo(firstView.snp.top).offset(positionY)
      }

    } else {
      swipeImageView.snp.updateConstraints {
        $0.top.equalToSuperview().offset(0)
        $0.bottom.equalTo(firstView.snp.top).offset(0)
      }
    }
  }

}
