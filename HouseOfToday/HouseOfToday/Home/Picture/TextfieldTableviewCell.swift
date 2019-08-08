//
//  ReplyTableviewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 08/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class TextfieldTableviewCell: UITableViewCell {

  static var height = UIScreen.main.bounds.height/15

//  let picDetailVC = PicDetailVC()

  private lazy var textfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"
    textfield.font = UIFont.systemFont(ofSize: 12)
    textfield.textColor = .lightGray
    textfield.borderStyle = .roundedRect
    textfield.layer.borderWidth = 1
    textfield.layer.borderColor = UIColor.lightGray.cgColor
    textfield.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    //    textfield.delegate = self
    addSubview(textfield)
    return textfield
  }()

  private lazy var registButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("등록", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1), for: .normal)
    //    button.addTarget(self, action: #selector(didTapFollowStatusButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    picDetailVC.view.endEditing(true)
//  }

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    makeConstraints()

//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // Action Method
  //키보드 올렸다가 내렸다가
//  @objc private func keyboardWillShow(_ sender: Notification) {
//    picDetailVC.view.frame.origin.y = -160
//  }
//
//  @objc func keyboardWillHide(_ sender: Notification) {
//    picDetailVC.view.frame.origin.y = 0
//  }

  // MARK: - AutoLayout
  private func makeConstraints() {
    textfield.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(10)
      make.leading.equalToSuperview().inset(15)
      make.trailing.equalTo(registButton.snp.leading).offset(-10)
      make.bottom.equalToSuperview().inset(15)
      make.width.equalToSuperview().multipliedBy(0.8)
    }
    registButton.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(10)
      make.trailing.bottom.equalToSuperview().inset(15)
    }

  }
}
