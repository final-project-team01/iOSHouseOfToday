//
//  QuestionsAndAnswersVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class QuestionsAndAnswersVC: UIViewController {

  // MARK: - Property
  private lazy var tableView: UITableView = {
    let tv = UITableView(frame: CGRect.zero)
    tv.register(cell: QnaCell.self)
    tv.dataSource = self
    tv.delegate = self
    tv.estimatedRowHeight = 700
    tv.rowHeight = UITableView.automaticDimension
    view.addSubview(tv)
    return tv
  }()

  public var qnaList: [ProductDetail.QnAList] = []

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }
  private func configureNaviBar() {
    self.title = "질문과답변"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

}

extension QuestionsAndAnswersVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return qnaList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(QnaCell.self)
    cell.qnaData = qnaList[indexPath.row]
    return cell
  }
}

extension QuestionsAndAnswersVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 700
  }
}
