//
//  ReviewCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 28/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "ReviewCell"

  public lazy var reviewTitle: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "[브랜드] product Name"
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    addSubview(label)
    return label
  }()

  public lazy var optionLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "01. 무아스 Mini LED 벽시계"
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var starLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "★★★★★"
    label.textAlignment = .left
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    addSubview(label)
    return label
  }()

  private lazy var commentLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "우왕우우웅아아아아ㅏ아아아어어아아아아아ㅏㅏ으으으으으으으아아아아아아아아아아아아아아아아아아아어우능ㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ"
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 2
    addSubview(label)
    return label
  }()

  private lazy var reviewImageView: UIImageView = {
    let iv = UIImageView(frame: CGRect.zero)
    iv.backgroundColor = .black
//    iv.contentMode = .
    addSubview(iv)
    return iv
  }()

  private lazy var arrowToRight: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = ">"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    return label
  }()

  private lazy var helpfulLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "10명에게 도움이 되었습니다."
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var reviewerInfo: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "name | 2019.01.28 | 오늘의 집 리뷰"
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var arrowLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "∨"
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    label.isHidden = true
    addSubview(label)
    return label
  }()
  
  private var reviewList: ProductDetail.Review? {
    didSet {
      guard let list = reviewList else { return print("reviewList is nil")}
      
      starLabel.text = addStarText(count: list.starScore)
      commentLabel.text = list.comment
      
      reviewerInfo.text = "\(list.user) | \(list.created) | 오늘의집 리뷰"
    }
  }

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  // MARK: - configure
  private func autolayoutViews() {

    if reviewTitle.translatesAutoresizingMaskIntoConstraints {
      reviewTitle.snp.makeConstraints {
        $0.top.leading.trailing.equalToSuperview().offset(Metric.marginX)
      }
    }

    if optionLabel.translatesAutoresizingMaskIntoConstraints {
      optionLabel.snp.makeConstraints {
        $0.top.equalTo(reviewTitle.snp.bottom).offset(Metric.marginY/2)
        $0.leading.trailing.equalToSuperview()
      }
    }

    if starLabel.translatesAutoresizingMaskIntoConstraints {
      reviewTitle.snp.makeConstraints {
        $0.top.equalTo(optionLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview()
      }
    }

    if commentLabel.translatesAutoresizingMaskIntoConstraints {
      commentLabel.snp.makeConstraints {
        $0.top.equalTo(starLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview()
        $0.trailing.equalTo(reviewImageView.snp.leading).offset(Metric.marginY)
      }
    }

    if arrowToRight.translatesAutoresizingMaskIntoConstraints {
      arrowToRight.snp.makeConstraints {
        $0.top.equalTo(commentLabel.snp.top)
        $0.trailing.equalToSuperview()
      }
    }

    if reviewImageView.translatesAutoresizingMaskIntoConstraints {
      reviewImageView.snp.makeConstraints {
        $0.top.equalTo(starLabel.snp.top)
        $0.width.equalTo(UIScreen.main.bounds.width/5)
        $0.height.equalTo(UIScreen.main.bounds.width/5)
        $0.trailing.equalTo(arrowToRight.snp.leading).offset(-Metric.marginX)
      }
    }

    if helpfulLabel.translatesAutoresizingMaskIntoConstraints {
      helpfulLabel.snp.makeConstraints {
        $0.top.equalTo(commentLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview()
      }
    }

    if reviewerInfo.translatesAutoresizingMaskIntoConstraints {
      reviewerInfo.snp.makeConstraints {
        $0.top.equalTo(helpfulLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.equalToSuperview()
      }
    }

    if arrowLabel.translatesAutoresizingMaskIntoConstraints {
      arrowLabel.snp.makeConstraints {
        $0.top.equalTo(reviewerInfo.snp.bottom)
        $0.trailing.equalToSuperview()
      }
    }
  }
  
  
  private func addStarText(count: Int) -> String {
    var starText: String
    
    for _ in 0..<count {
      starText += "★"
    }
    return starText
  }
}
