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
    wv.backgroundColor = .yellow
    wv.uiDelegate = self
    view.addSubview(wv)
    return wv
  }()

  internal var url: String?

  init(withURL url: String) {
    super.init(nibName: nil, bundle: nil)
    self.url = url
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("Unintended Init Error")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    guard let urlString = self.url,
      let url = URL(string: urlString)
      else { logger("url is nil"); return  }
    let request = URLRequest(url: url)
    self.webView.load(request)

    makeContraints()
  }

  private func makeContraints() {
    webView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

}

extension SecondSectionViewController: WKUIDelegate {
}
