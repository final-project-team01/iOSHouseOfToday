//
//  CollectionHeader.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class Header: UICollectionReusableView {
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = "오늘의집 AWARDS"
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    addSubview(label)
    return label
  }()
  
  private lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.text = "카테고리별 BEST 100"
    label.font = UIFont.preferredFont(forTextStyle: .subheadline)
    label.textColor = .lightGray
    addSubview(label)
    return label
  }()
  
  override init(frame: CGRect) {
    super .init(frame: frame)
    self.backgroundColor = .white
    configureLabel()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureLabel() {
    
    titleLabel.snp.makeConstraints { make in
    make.top.leading.trailing.equalToSuperview()
    }
    
    subtitleLabel.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom)
      make.leading.bottom.trailing.equalToSuperview()
    }
    
    
  }
  
}
