//
//  HouseWarmingDetailViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import Foundation

class HouseWarmingDetailViewController: UIViewController {

  // MARK: - Properties
  private lazy var detailTableView: UITableView = {
    let tv = UITableView(frame: .zero, style: .grouped)
    tv.dataSource = self
    tv.delegate = self
    tv.register(CoverImageHeaderView.self, forHeaderFooterViewReuseIdentifier: "header")
    tv.register(cell: TitleTableCell.self)
    tv.register(cell: ContentTableCell.self)
    tv.backgroundColor = .white

    tv.tableFooterView = UIView()

    view.addSubview(tv)
    return tv
  }()

  private var detail: HouseWarmingDetail? {
    didSet {
      DispatchQueue.main.async {
        self.detailTableView.reloadData()
      }
    }
  }

  private var contents: [Content] = [] {
    didSet {
      DispatchQueue.main.async {
        self.detailTableView.reloadData()
      }
    }
  }

  // MARK: - ViewController LifeCyle
  override func viewDidLoad() {
    super.viewDidLoad()
    makeConstraints()
    fetchHouseWarmingDetail(with: 1)
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }

  private func configureNaviBar() {
    self.title = "프로필"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  private func fetchHouseWarmingDetail(with id: Int) {
    DataManager.shard.service.fetchHouseWarmingDetail(with: id) {
      [weak self] result in
      guard let `self` = self else { return logger("weak reference Error") }
      switch result {
      case .success(let detail):
        self.detail = detail
        self.contents = detail.content
      case .failure(let error):
        logger(error.localizedDescription)
      }
    }
  }

  private func makeConstraints() {
//    self.coverImageView.snp.makeConstraints {
//      $0.top.leading.trailing.equalTo(view)
//      $0.height.equalTo(UIScreen.main.bounds.height * 0.4)
//    }
    self.detailTableView.snp.makeConstraints {
      $0.top.equalTo(-45)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

// MARK: - CollectionView DataSource
extension HouseWarmingDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1 + contents.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    if let detail = self.detail {
      if row == 0 {
        let cell = tableView.dequeue(TitleTableCell.self)
        cell.configureCell(title: detail.title,
                           author: detail.author,
                           created: detail.created)
        return cell
      } else {
        let cell = tableView.dequeue(ContentTableCell.self)
        if let image = contents[indexPath.row - 1].image {
          cell.contentImageView.kf.setImage(with: image.getURL())
        }
        if let content = contents[indexPath.row - 1].text {
          cell.contentLabel.text = content
        }
        return cell
      }
    }
    return UITableViewCell()
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! CoverImageHeaderView
    if let detail = self.detail {
      header.coverImageView.kf.setImage(with: detail.coverImageUrlStr.getURL())
    } else {
      logger("detail is nil")
    }
    return header
  }

}
// MARK: - Collection FlowLayout and Delegate
extension HouseWarmingDetailViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UIScreen.main.bounds.height * 0.4
  }
}

extension String {
  func getURL() -> URL {
    return URL(string: self)!
  }
}
