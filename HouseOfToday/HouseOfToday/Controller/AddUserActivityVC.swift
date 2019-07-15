//
//  AddUserActivityVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 10/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension AddUserActivityVC {
  static var presentAlert: Notification.Name {
    return Notification.Name("presentAlert")
  }
}

final class AddUserActivityVC: UIViewController {

  private let notiCenter = NotificationCenter.default

  override func viewDidLoad() {
    super.viewDidLoad()

    notiCenter.addObserver(self,
                           selector: #selector(knowHowTouchAlertPresnet(_:)),
                           name: AddUserActivityVC.presentAlert,
                           object: nil)
  }

  deinit {
    notiCenter.removeObserver(self,
                              name: AddUserActivityVC.presentAlert,
                              object: nil)
  }

  override func loadView() {
    view = AddUserActivityView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // show animation 실행
    if let userView = view as? AddUserActivityView {
      userView.showView()
    }
  }

  func customDismiss() {
    UIView.animate(withDuration: 0.33, animations: {
      if let userView = self.view as? AddUserActivityView {
        userView.hideView()
        userView.layoutIfNeeded()
      }
    }) { (_) in
      self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
  }

  // alert action present
  @objc func knowHowTouchAlertPresnet(_ sender: Notification) {
    guard let userInfo = sender.userInfo as? [String: UIAlertController],
        let alert = userInfo["alert"]
    else {
      return print("fail down casting")
    }
    present(alert, animated: true)
  }
}
