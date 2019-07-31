//
//  LoginTextField.swift
//  HouseOfToday
//
//  Created by Sicc on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  let margin = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: margin)
  }

  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: margin)
  }
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: margin)
  }
}
