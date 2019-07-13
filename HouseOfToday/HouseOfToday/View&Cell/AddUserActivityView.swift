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

  lazy var activityView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = .blue
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    if activityView.translatesAutoresizingMaskIntoConstraints {
      addSubview(activityView)

      activityView.snp.makeConstraints {
        $0.top.equalTo(self.snp.bottom)
        $0.leading.equalToSuperview()
        $0.trailing.equalToSuperview()
        $0.height.equalToSuperview().multipliedBy(0.5)
      }
      print("activityView.snp")
    }
  }

  func showView() {
    UIView.animate(withDuration: 0.3) {
      self.activityView.snp.updateConstraints {
        $0.top.equalTo(self.snp.bottom).offset(-UIScreen.main.bounds.height/2)
      }
      self.layoutIfNeeded()
      print("showView: \(-UIScreen.main.bounds.width/2)")
    }
  }

  func hideView() {
    UIView.animate(withDuration: 0.3) {
      self.activityView.snp.updateConstraints {
        $0.top.equalTo(self.snp.bottom).offset(0)
      }
      self.layoutIfNeeded()
    }
  }

}
