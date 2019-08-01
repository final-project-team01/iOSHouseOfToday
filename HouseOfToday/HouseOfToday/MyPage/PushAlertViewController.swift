//
//  PushAlertViewController.swift
//  HouseOfToday
//
//  Created by Sicc on 01/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PushAlertViewController: UIViewController {

  private lazy var alertTableView: UITableView = {
    let tv = UITableView(frame: .zero)
    tv.register(cell: UITableViewCell.self)
    tv.dataSource = self
    tv.sectionHeaderHeight = 30

    view.addSubview(tv)
    return tv
  }()

  private let firstSection = "ON/OFF"
  private let secondSection = ["추천 게시물", "이벤트 알림", "주문정보", "마케팅정보", "누가 내 포스팅에 좋아요를 눌렀을 때", "누가 내 포스팅에 댓글을 달았을 때", "누가 내 포스팅에 스크랩을 했을 때", "누가 나를 팔로우 했을 때", "누가 나를 언급했을 때", "누가 내 댓글에 좋아요를 눌렀을 때", "전문가 시공 상담 업데이트"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  private func configureNaviBar() {
    self.title = "설정"
    self.navigationController?.setNavigationBarHidden(false, animated: true)

    let naviBar = self.navigationController?.navigationBar
    naviBar?.isTranslucent = false
    naviBar?.setBackgroundImage(UIColor.clear.as1ptImage(), for: .default)
    naviBar?.shadowImage = UIColor.clear.as1ptImage()
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }

  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - Autolayout
  private func makeConstraints() {
    alertTableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

}

extension PushAlertViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return " "
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return firstSection.count
    case 1:
      return secondSection.count
    default:
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeue(UITableViewCell.self)
//    switch indexPath.section {
//    case 0:
//      cell.textLabel?.text = firstSection[indexPath.row]
//    case 1:
//      cell.textLabel?.text = secondSection[indexPath.row]
//      if indexPath.row == 5 {
//        cell.detailTextLabel?.text = "7.3.14"
//      }
//    case 2:
//      cell.textLabel?.text = thirdSection
//    default:
//      cell.textLabel?.text = "error"
//    }
//    cell.textLabel?.textColor = .darkGray
//    cell.textLabel?.font = .systemFont(ofSize: 17, weight: .ultraLight)
//    cell.selectionStyle = .none
    return UITableViewCell()
  }
}
