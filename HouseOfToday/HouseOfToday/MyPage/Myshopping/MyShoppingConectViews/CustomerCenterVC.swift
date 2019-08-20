//
//  CustomerCenterVC.swift
//  HouseOfToday
//
//  Created by Daisy on 01/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

// FIXME: - 핀치 하면 작아지는 문제 이미지`고정`하기

extension  Notification.Name {
  static let customerCenterVC = Notification.Name("CustomerCenterVC")
}

class CustomerCenterVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.minimumZoomScale = 0.1
    scrollView.delegate = self
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

  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }
  private func configureNaviBar() {
    self.title = "푸쉬 알림 설정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
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

    print("(scrollView.frame.size.width)", (scrollView.frame.size.width))
    print("(imageView.image!.size.width)", (imageView.image!.size.width))
    print("scrollView.frame.size.width / (imageView.image!.size.width)", scrollView.frame.size.width / (imageView.image!.size.width))

    scrollView.setZoomScale(zoomScale, animated: false)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    fitToScrollView()
  }
}

extension CustomerCenterVC: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
}
