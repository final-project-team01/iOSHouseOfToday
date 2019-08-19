//
//  QuestionsAndAnswersVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class QuestionsAndAnswersVC: UIViewController {

  // MARK: - Property
  private lazy var bottomView: UIView = {
    let v = UIView(frame: .zero)
    v.backgroundColor = .white
    view.addSubview(v)
    return v
  }()

  private lazy var questionButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("문의하기", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    btn.addTarget(self, action: #selector(touchUpQuestion(_:)), for: .touchUpInside)
    bottomView.addSubview(btn)
    return btn
  }()

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

  public var productId: Int = 0

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

//    UITableView().contentSize

    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }

    bottomView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(100)
    }

    questionButton.snp.makeConstraints {
      $0.top.equalToSuperview().inset(Metric.marginY/2)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(50)

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

  @objc private func touchUpQuestion(_ sender: Any) {
    let vc = UserQnAWriteVC()
    vc.productId = productId
    self.navigationController?.pushViewController(vc, animated: true)
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
