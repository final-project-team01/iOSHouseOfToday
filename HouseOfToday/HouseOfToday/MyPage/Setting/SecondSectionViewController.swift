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
    wv.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    view.addSubview(wv)
    return wv
  }()

  private lazy var progressBar: UIProgressView = {
    let progress = UIProgressView(progressViewStyle: .default)
    progress.progressTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    progress.backgroundColor = .clear
    view.addSubview(progress)
    return progress
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
    loadWebView()
    makeContraints()
    print("progress :", webView.estimatedProgress)
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }
  private func configureNaviBar() {
    self.title = "오늘의 집이 궁금해요"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "estimatedProgress" {
      progressBar.progress = Float(webView.estimatedProgress)
    }
  }

  private func loadWebView() {
    guard let urlString = self.urlString,
      let url = URL(string: urlString)
      else { logger("url is nil"); return  }

    let request = URLRequest(url: url)
    self.webView.load(request)
  }

  private func makeContraints() {

    progressBar.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
    }
    webView.snp.makeConstraints {
      $0.top.equalTo(progressBar.snp.bottom)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
}
