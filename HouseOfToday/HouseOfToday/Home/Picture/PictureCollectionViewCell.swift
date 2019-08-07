//
//  PictureCollectionViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 04/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {

  lazy var thumnailImageView: UIImageView = {
    let imageView = UIImageView(frame: CGRect.zero)
    imageView.image = UIImage(named: "user")
    addSubview(imageView)
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    cellAutolayout()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func commentThumbButton(thumnailUrl: URL) {
    thumnailImageView.kf.setImage(with: thumnailUrl,
                                  placeholder: nil,
                                  options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                  progressBlock: nil) { (_) in
    }
  }

  //stop download
  public func stopDownloadImage() {
    thumnailImageView.kf.cancelDownloadTask()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    thumnailImageView.layer.cornerRadius = thumnailImageView.frame.width/2
    thumnailImageView.layer.masksToBounds = true

  }

  // MARK: - configure
  private func cellAutolayout() {
    thumnailImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

}
