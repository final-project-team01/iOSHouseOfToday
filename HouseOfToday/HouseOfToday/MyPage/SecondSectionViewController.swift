//
//  SecondSectionViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import WebKit

class SecondSectionViewController: UIViewController {

  private lazy var webView: WKWebView = {
    let configuration = WKWebViewConfiguration()
    let wv = WKWebView(frame: .zero, configuration: configuration)
    view.addSubview(wv)
    return wv
  }()

  internal var urlString: String?

  init(withURLString urlString: String) {
    super.init(nibName: nil, bundle: nil)
    self.urlString = urlString
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("Unintended Init Error")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configureNaviBar()
    loadWebView()
    makeContraints()
  }

  // configure Navigation Bar
  private func configureNaviBar() {
    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()

    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")

    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  private func loadWebView() {
    guard let urlString = self.urlString,
      let url = URL(string: urlString)
      else { logger("url is nil"); return  }

    let request = URLRequest(url: url)
    self.webView.load(request)
  }

  private func makeContraints() {
    webView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

}
