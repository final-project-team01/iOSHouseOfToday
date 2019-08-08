//
//  CoverImageHeaderView.swift
//  HouseOfToday
//
//  Created by Sicc on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

class CoverImageHeaderView: UITableViewHeaderFooterView {

  internal lazy var coverImageView: UIImageView = {
    let iv = UIImageView(frame: .zero)
    iv.contentMode = .scaleAspectFill
    addSubview(iv)
    return iv
  }()

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    makeConstrains()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  private func makeConstrains() {
    self.coverImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
