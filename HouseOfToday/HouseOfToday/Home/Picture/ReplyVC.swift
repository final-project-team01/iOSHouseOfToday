//
//  replyVC.swift
//  HouseOfToday
//
//  Created by Daisy on 07/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ReplyVC: UIViewController {

  private lazy var replyStatusLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "첫 번째 댓글을 남겨주세요"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  private lazy var registButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("등록", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(.lightGray, for: .normal)
//    button.addTarget(self, action: #selector(didTapFollowStatusButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()

  private lazy var textfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "댓글을 입력해주세요."
    textfield.textColor = .lightGray
    textfield.borderStyle = .roundedRect
    textfield.layer.borderWidth = 1
    textfield.layer.borderColor = UIColor.lightGray.cgColor
    textfield.font = UIFont.boldSystemFont(ofSize: 15)
    textfield.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    textfield.delegate = self
    view.addSubview(textfield)
    return textfield
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
      makeConstraints()
      view.backgroundColor = .white

      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }

  // MARK: - AutoLayout
  private func makeConstraints() {

    replyStatusLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().multipliedBy(0.1)
    }

    textfield.snp.makeConstraints { make in
      make.leading.equalToSuperview().inset(15)
      make.trailing.equalTo(registButton.snp.leading).inset(-15)
      make.bottom.equalToSuperview().inset(100) // FIXME: - 탭바 없어지면 높이 수정
    }

    registButton.snp.makeConstraints { make in
      make.trailing.equalToSuperview().inset(15)
      make.centerY.equalTo(textfield.snp.centerY)
      make.bottom.equalToSuperview().inset(100) // FIXME: - 탭바 없어지면 높이 수정
    }

  }

  @objc private func keyboardWillShow(_ sender: Notification) {
    //    self.view.frame.origin.y = -150
    self.textfield.frame.origin.y = self.view.frame.origin.y + 330
    self.registButton.frame.origin.y = self.view.frame.origin.y + 330

    print("self.view.frame.origin.y", self.view.frame.origin.y)
    print("self.textfield.frame.origin.y", self.textfield.frame.origin.y)
  }

  @objc func keyboardWillHide(_ sender: Notification) {

    //    self.view.frame.origin.y = 0
    self.textfield.frame.origin.y = 0
    self.registButton.frame.origin.y = 0

  }

}

extension ReplyVC: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()

    return true
  }

}
