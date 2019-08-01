//
//  CustomerCenterVC.swift
//  HouseOfToday
//
//  Created by Daisy on 01/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

// FIXME: - GG 내일 해보자 ViewLifeCycle?

extension  Notification.Name {
  static let customerCenterVC = Notification.Name("CustomerCenterVC")
}

class CustomerCenterVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    //    scrollView.frame.size.width = view.frame.size.width // 이러케 강제로 해주면 scaledl 안변하는데;; 없으면 0.0으로 나온다
    view.addSubview(scrollView)
    return scrollView
  }()

  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "customerCenter")
    imageView.contentMode = .scaleAspectFit
    self.scrollView.addSubview(imageView)
    return imageView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureAutoLayout()
    fitToScrollView()
  }

  private func configureAutoLayout() {
    scrollView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    imageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

  private func fitToScrollView() {
    let zoomScale = (scrollView.frame.size.width) / (imageView.image!.size.width)
    scrollView.setZoomScale(zoomScale, animated: true)

    print("(scrollView.frame.size.width)", (scrollView.frame.size.width))
    print("(imageView.image!.size.width)", (imageView.image!.size.width))
    print("scrollView.frame.size.width / (imageView.image!.size.width)", scrollView.frame.size.width / (imageView.image!.size.width))

  }
}
