//
//  RatingStarView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 30/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class RatingStarView: UIView {
  let colorView = UIView()
  let starImageView = UIImageView()

  var constraint: NSLayoutConstraint?

  var rating: CGFloat = 0 {
    didSet {
      layout(rating: rating)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .clear

    configure()

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configure() {
    backgroundColor = .white
    colorView.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    self.addSubview(colorView)

    let starImage = UIImage(named: "star")
    starImageView.image = starImage
    starImageView.contentMode = .scaleAspectFit
    starImageView.clipsToBounds = true
    starImageView.backgroundColor = .clear
    self.addSubview(starImageView)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    configureLayout()
  }

  private struct Standard {
    static let space: CGFloat = 10
  }

  private func configureLayout() {
    if colorView.translatesAutoresizingMaskIntoConstraints {
      colorView.snp.makeConstraints {
        $0.top.left.bottom.equalToSuperview()
      }
    }

    if starImageView.translatesAutoresizingMaskIntoConstraints {
      starImageView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }
    }
  }

  private func layout(rating: CGFloat) {
    if constraint != nil {
      constraint?.isActive = false
    }
    constraint = colorView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: rating / 5)
    constraint?.isActive = true
  }
}
