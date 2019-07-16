//
//  AddUserActivityView.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 11/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import SnapKit

class AddUserActivityView: UIView {

  private let notiCenter = NotificationCenter.default

  lazy var clearView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = .red//UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    addSubview(view)
    return view
  }()

  lazy var activityView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = .blue
    return view
  }()

  lazy var knowHowButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitleColor(.white, for: .normal)
    let underLineAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 12, weight: .bold),
      .foregroundColor: UIColor.white,
      .underlineStyle: NSUnderlineStyle.single.rawValue]
    let underlineAttributeString = NSMutableAttributedString(string: "온라인 집들이, 노하우 업로드 안내",
                                                    attributes: underLineAttributes)
    btn.setAttributedTitle(underlineAttributeString, for: .normal)

    let selectUnderLineAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 12, weight: .bold),
      .foregroundColor: UIColor.lightGray,
      .underlineStyle: NSUnderlineStyle.single.rawValue]
    let selectedAttributeString = NSMutableAttributedString(string: "온라인 집들이, 노하우 업로드 안내",
                                                    attributes: selectUnderLineAttributes)
    btn.setAttributedTitle(selectedAttributeString, for: .highlighted)

    btn.addTarget(self, action: #selector(knowHowTouch(_:)), for: .touchUpInside)
    clearView.addSubview(btn)
    return btn
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
//    backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if activityView.translatesAutoresizingMaskIntoConstraints {

      clearView.snp.makeConstraints {
        $0.edges.equalToSuperview()
      }

      clearView.addSubview(activityView)
      activityView.snp.makeConstraints {
        $0.top.equalTo(self.snp.bottom)
        $0.leading.equalToSuperview()
        $0.trailing.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.5)
      }

      knowHowButton.snp.makeConstraints {
        $0.bottom.equalTo(activityView.snp.top).offset(-10)
        $0.leading.equalToSuperview().offset(15)
      }
    }
  }

  public func showView() {
    UIView.animate(withDuration: 0.3) {

//      self.clearView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)

      self.activityView.snp.updateConstraints {
        $0.top.equalTo(self.snp.bottom).offset(-UIScreen.main.bounds.height/2 - self.safeAreaInsets.bottom)
      }
      self.layoutIfNeeded()
    }
  }

  public func hideView() {
//    UIView.animate(withDuration: 0.3) {
      self.activityView.snp.updateConstraints {
        $0.top.equalTo(self.snp.bottom).offset(0)
      }
//      self.layoutIfNeeded()
//    }
  }

  @objc private func knowHowTouch(_ sender: UIButton) {
    let message = """
                  예쁜 집을 더 많은 분께 더 자세하게 보여줄 수 있는 '집들이'와 인테리어 꿀팁 '노하우'는 PC에서 오늘의집 웹사이트로 접속하셔야 업로드 하실 수 있습니다.
                  """

    let alert = UIAlertController(title: "PC에서 이용해 주세요.", message: message, preferredStyle: .alert)
    let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

    alert.addAction(ok)

    notiCenter.post(name: AddUserActivityVC.presentAlert, object: sender, userInfo: ["alert": alert])
  }

}
