//
//  PopularityKewordCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 19/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class PopularityKewordCell: UICollectionViewCell {

  // MARK: - Property
  static var identifier: String = "PopularityKewordCell"

  lazy var keywordImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.contentMode = .scaleAspectFit
    addSubview(imageView)
    return imageView
  }()

  // MARK: - View life cycle
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if keywordImageView.translatesAutoresizingMaskIntoConstraints {
      keywordImageView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }
}
