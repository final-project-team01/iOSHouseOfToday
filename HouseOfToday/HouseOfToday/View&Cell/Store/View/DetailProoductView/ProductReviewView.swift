//
//  ProductReviewView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ProductReviewView: UIView {

  // MARK: - Property
  static var height = UIScreen.main.bounds.height * 2

  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰"
    label.font = UIFont.systemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var reviewCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "55,555"
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 20)
    addSubview(label)
    return label
  }()

  private lazy var starLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★★★★★"
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 25)
    addSubview(label)
    return label
  }()

  private lazy var starPointLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "5.0"
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var starPointHighLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "/5"
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var purchaseSatisfactionLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "55,555명의 구매만족도"
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 10)
    addSubview(label)
    return label
  }()

  private lazy var lineLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.layer.borderColor = UIColor.darkGray.cgColor
    label.layer.borderWidth = 0.5
    label.layer.addBorder([.top, .left], color: .black, width: 0.5)
    addSubview(label)
    return label
  }()

  private lazy var bestSortButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("베스트순", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 5
    addSubview(btn)
    return btn
  }()
  private lazy var newestSortButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("최신순", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 5
    addSubview(btn)
    return btn
  }()
  private lazy var lowestSortButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("낮은 평점순", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 5
    addSubview(btn)
    return btn
  }()

  private lazy var showTotalReviewButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("555,555개 리뷰 전체보기", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.layer.masksToBounds = true
    btn.layer.cornerRadius = 10
    addSubview(btn)
    return btn
  }()

  private lazy var sharePleaseLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "이 제품을 사용하고 계신다면 리뷰를 공유해주세요."
    label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    label.textAlignment = .center
    addSubview(label)
    return label
  }()

  private lazy var reviewWriteButton: UIButton = {
    let btn = UIButton(type: .custom)

    let mutableAttributedString = NSMutableAttributedString()

    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 20),
      .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    ]
    let attributeString = NSMutableAttributedString(string: "리뷰쓰기",
                                                    attributes: attributes)
    let attributes1: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 15),
      .foregroundColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    ]
    let attributeString1 = NSMutableAttributedString(string: " 포토 250P",
                                                     attributes: attributes1)
    mutableAttributedString.append(attributeString)
    mutableAttributedString.append(attributeString1)
    btn.setAttributedTitle(mutableAttributedString, for: .normal)

    btn.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    btn.layer.borderWidth = 1.0
    btn.layer.cornerRadius = 5
    btn.layer.masksToBounds = true
    addSubview(btn)
    return btn
  }()

  private lazy var folwLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = Metric.ReviewCellSize
    layout.minimumLineSpacing = Metric.numberOfLine
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: folwLayout)
    colV.register(cell: ReviewCell.self)
    colV.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    colV.dataSource = self
//    colV.delegate = self

    addSubview(colV)
    return colV
  }()

  private var reviewList: [ProductDetail.Review] = []

  public var productDetailData: ProductDetail? {
    didSet {
      guard let info = productDetailData else {return print("productDetailData is nil")}

      let reviewCount = "\(formetter(price: info.reviewCount))"

      starPointLabel.text = "\(info.starAvg)"

      reviewList = info.review
      reviewCountLabel.text = reviewCount
      purchaseSatisfactionLabel.text = "\(reviewCount)의 구매만족도"
      showTotalReviewButton.setTitle("\(reviewCount)개 리뷰 전체보기 ", for: .normal)

      collectionView.reloadData()
    }
  }

  // MARK: - View life cycle

  override func layoutSubviews() {
    super.layoutSubviews()
    backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {
    if titleLabel.translatesAutoresizingMaskIntoConstraints {
      titleLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if reviewCountLabel.translatesAutoresizingMaskIntoConstraints {
      reviewCountLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY)
        $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
      }
    }

    if starLabel.translatesAutoresizingMaskIntoConstraints {
      starLabel.snp.makeConstraints {
        $0.top.equalTo(titleLabel.snp.bottom).offset(Metric.marginY*2)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if starPointLabel.translatesAutoresizingMaskIntoConstraints {
      starPointLabel.snp.makeConstraints {
        $0.top.equalTo(starLabel.snp.top)
        $0.leading.equalTo(starLabel.snp.trailing).offset(10)
      }
    }

    if starPointHighLabel.translatesAutoresizingMaskIntoConstraints {
      starPointHighLabel.snp.makeConstraints {
        $0.top.equalTo(starLabel.snp.top)
        $0.leading.equalTo(starPointLabel.snp.trailing)
      }
    }

    if purchaseSatisfactionLabel.translatesAutoresizingMaskIntoConstraints {
      purchaseSatisfactionLabel.snp.makeConstraints {
        $0.top.equalTo(starLabel.snp.bottom).offset(Metric.marginY/2)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if lineLabel.translatesAutoresizingMaskIntoConstraints {
      lineLabel.snp.makeConstraints {
        $0.top.equalTo(purchaseSatisfactionLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
        $0.height.equalTo(0.5)
      }
    }

    if bestSortButton.translatesAutoresizingMaskIntoConstraints {
      bestSortButton.snp.makeConstraints {
        $0.top.equalTo(lineLabel.snp.top).offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.height.equalTo(Metric.marginY * 2)
        $0.width.equalTo(UIScreen.main.bounds.width/4)
      }
    }

    if newestSortButton.translatesAutoresizingMaskIntoConstraints {
      newestSortButton.snp.makeConstraints {
        $0.top.equalTo(lineLabel.snp.top).offset(Metric.marginY)
        $0.leading.equalTo(bestSortButton.snp.trailing).offset(10)
        $0.height.equalTo(Metric.marginY * 2)
        $0.width.equalTo(UIScreen.main.bounds.width/4)
      }
    }

    if lowestSortButton.translatesAutoresizingMaskIntoConstraints {
      lowestSortButton.snp.makeConstraints {
        $0.top.equalTo(lineLabel.snp.top).offset(Metric.marginY)
        $0.leading.equalTo(newestSortButton.snp.trailing).offset(10)
        $0.height.equalTo(Metric.marginY * 2)
        $0.width.equalTo(UIScreen.main.bounds.width/4)
      }
    }

    if collectionView.translatesAutoresizingMaskIntoConstraints {
      collectionView.snp.makeConstraints {
        $0.top.equalTo(bestSortButton.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(500)
      }
    }

    if showTotalReviewButton.translatesAutoresizingMaskIntoConstraints {
      showTotalReviewButton.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
        $0.height.equalTo(Metric.marginY*4)
      }
    }

    if sharePleaseLabel.translatesAutoresizingMaskIntoConstraints {
      sharePleaseLabel.snp.makeConstraints {
        $0.top.equalTo(showTotalReviewButton.snp.bottom).offset(Metric.marginY*4)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
      }
    }

    if reviewWriteButton.translatesAutoresizingMaskIntoConstraints {
      reviewWriteButton.snp.makeConstraints {
        $0.top.equalTo(sharePleaseLabel.snp.bottom).offset(Metric.marginY/2)
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
        $0.height.equalTo(Metric.marginY*3)
      }
    }
  }

  private func formetter(price: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal

    return formatter.string(from: price as NSNumber) ?? ""
  }

}

extension ProductReviewView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return reviewList.count > 0 ? 2 : 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(ReviewCell.self, indexPath)
    guard let data = productDetailData else { return cell}
    cell.reviewTitle.text = "[\(data.brandName)] \(data.name)"
    cell.optionLabel.text = "\(data.productOption[Int.random(in: 0 ..< data.productOption.count)])"
    return cell
  }
}
