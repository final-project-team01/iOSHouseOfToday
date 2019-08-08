//
//  ExpertVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ExpertVC: UIViewController {

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
    imageView.image = UIImage(named: "expertfake")
    imageView.contentMode = .scaleAspectFit
    self.scrollView.addSubview(imageView)
    return imageView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureAutoLayout()
    configureNaviBar()

//    imageView.contentMode = .scaleAspectFill
  }

  private func configureNaviBar() {
    self.title = "전문가"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  private func configureAutoLayout() {
    scrollView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

//    scrollView.backgroundColor = .red
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

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }
}

extension ExpertVC: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
}
