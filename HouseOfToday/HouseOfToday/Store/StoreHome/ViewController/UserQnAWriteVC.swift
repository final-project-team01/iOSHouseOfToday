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
    label.text = "0자 | 최대 30자"
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

  override func viewDidLoad() {
    super.viewDidLoad()

  }

}

extension UserQnAWriteVC: UITextViewDelegate {

  func textViewDidBeginEditing(_ textView: UITextView) {
//    if textView.textColor == .lightGray {
//      textView.text = nil
//      textView.textColor = .black
//      textView.font = UIFont.systemFont(ofSize: 15)
//    }
  }

  func textViewDidEndEditing(_ textView: UITextView) {
//    if textView.text.isEmpty {
//      textView.text = "  이 제품을 사용하면서 느꼈던 장점과 단점을 솔직하게 알려주세요."
//      textView.textColor = .lightGray
//      textView.font = UIFont.systemFont(ofSize: 12)
//    }
  }

  func textViewDidChange(_ textView: UITextView) {
    if textView.text.count < 30 {
      lowestTextLabel.textColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    } else {
      lowestTextLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }

    if textView.textColor == .black {
      lowestTextLabel.text = "\(textView.text.count)자 | 최대 30자"
    }
  }
}
