//
//  UserQnAWriteVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 09/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class UserQnAWriteVC: UIViewController {

  // MARK: - Property
  private lazy var qnaSelectLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "문의할 종류를 선택해 주세요."
    label.font = UIFont.systemFont(ofSize: 15)
    view.addSubview(label)
    return label
  }()

  private lazy var selectButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("선택해주세요", for: .normal)
    view.addSubview(btn)
    return btn
  }()

  private lazy var askReviewLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "문의할 내용을 작성해주세요."
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    view.addSubview(label)
    return label
  }()

  private lazy var lowestTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "0자 | 1000자"
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    view.addSubview(label)
    return label
  }()

  private lazy var reviewTextView: UITextView = {
    let tv = UITextView(frame: CGRect.zero)
    tv.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    tv.layer.borderWidth = 1
    tv.textColor = .lightGray
    tv.font = UIFont.systemFont(ofSize: 13)
    tv.delegate = self
    view.addSubview(tv)
    return tv
  }()

  private lazy var warningLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.textColor = .lightGray
    label.text = "*해당 상품과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용은 삭제될 수 있습니다"
    label.font = UIFont.systemFont(ofSize: 13)
    label.numberOfLines = 2
    view.addSubview(label)
    return label
  }()

  private lazy var saveButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("저장하기", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    btn.addTarget(self, action: #selector(touchUpSaveButton(_:)), for: .touchUpInside)
    view.addSubview(btn)
    return btn
  }()

  public var productId: Int = 0

  deinit {
    NotificationCenter.default.removeObserver(self,
                                              name: UIResponder.keyboardWillShowNotification,
                                              object: nil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    autolayoutViews()
    keyBoardNotiSetting()
  }

  private func keyBoardNotiSetting() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyBoardWillShow(_:)),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
  }

  private func autolayoutViews() {

    qnaSelectLabel.snp.makeConstraints {
      $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(Metric.marginY)
    }

    selectButton.snp.makeConstraints {
      $0.top.equalTo(qnaSelectLabel.snp.bottom).offset(Metric.marginY)
      $0.leading.equalToSuperview().inset(Metric.marginX)
    }

    askReviewLabel.snp.makeConstraints {
      $0.top.equalTo(selectButton.snp.bottom).offset(Metric.marginY*2)
      $0.leading.equalToSuperview().inset(Metric.marginX)
    }

    lowestTextLabel.snp.makeConstraints {
      $0.bottom.equalTo(askReviewLabel)
      $0.trailing.equalToSuperview().inset(Metric.marginX)
    }

    reviewTextView.snp.makeConstraints {
      $0.top.equalTo(askReviewLabel.snp.bottom).offset(Metric.marginY)
      $0.leading.trailing.equalToSuperview().inset(Metric.marginX)
    }

    warningLabel.snp.makeConstraints {
      $0.top.equalTo(reviewTextView.snp.bottom).offset(Metric.marginY/2)
      $0.leading.trailing.equalToSuperview().inset(Metric.marginX)
      $0.bottom.equalTo(saveButton.snp.top).offset(-Metric.marginY*10)
    }

    saveButton.snp.makeConstraints {
      $0.top.greaterThanOrEqualTo(warningLabel.snp.bottom)
      $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
      $0.height.equalTo(50)
    }
  }

  @objc private func touchUpSaveButton(_ sender: UIButton) {

    postQnAData()
  }

  @objc private func keyBoardWillShow(_ sender: Notification) {

    if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
      let keyboardRectangle = keyboardFrame.cgRectValue
      let keyboardHeight = keyboardRectangle.height

      UIView.animate(withDuration: 0.5) { [weak self] in

        guard let `self` = self else { return print("UserQnAWriteVC.self is nil")}

        self.warningLabel.snp.updateConstraints {
          $0.bottom.equalTo(self.saveButton.snp.top).offset(-Metric.marginY)
        }

        self.saveButton.snp.updateConstraints {
          $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(keyboardHeight)
        }

        self.view.layoutIfNeeded()
      }
    }
  }

  private func postQnAData() {
    guard let text = reviewTextView.text,
      !text.isEmpty else { return print("reviewTextView.text is empty")}

    let postData = NSMutableData(data: "product=\(productId)".data(using: String.Encoding.utf8)!)
    postData.append("&type=Test".data(using: String.Encoding.utf8)!)
    postData.append("&comment=\(text)".data(using: String.Encoding.utf8)!)

    postQnA(postData as Data)
  }

  private let service = HouseOfTodayService()

  private func postQnA(_ data: Data) {

    service.postQnA(data: data) { result in
      switch result {
      case .success(let list):
        print("success!!! postQnA: \(list)")

      case .failure(let error):
        print("postQnA Error: \(error.localizedDescription)")
      }
    }
  }

}

extension UserQnAWriteVC: UITextViewDelegate {

//  func textViewDidBeginEditing(_ textView: UITextView) {
//
//  }
//
//  func textViewDidEndEditing(_ textView: UITextView) {
//  }

  func textViewDidChange(_ textView: UITextView) {
    lowestTextLabel.text = "\(textView.text.count)자 | 1000자"

    if textView.text.count > 0 {
      saveButton.isEnabled = true
      saveButton.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
  }
}
