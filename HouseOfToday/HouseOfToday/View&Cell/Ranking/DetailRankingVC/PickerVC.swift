//
//  pickerViewViewController.swift
//  HouseOfToday
//
//  Created by Daisy on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {

  private struct Key {
    static let sortStandard = "Sortstandard"
  }

  private var didSelectRow = 0

  private lazy var clearView: UIView = {
    let clearView = UIView(frame: CGRect.zero)
    clearView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    view.addSubview(clearView)
    return clearView
  }()

  private lazy var activityView: UIView = {
    let activityView = UIView(frame: CGRect.zero)
    activityView.backgroundColor = .white
    clearView.addSubview(activityView)
    return activityView
  }()

  private lazy var sortPickerView: UIPickerView = {
    let picker = UIPickerView()
    picker.dataSource = self
    picker.delegate = self
    clearView.addSubview(picker)
    return picker
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "정렬"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = .black
    clearView.addSubview(label)
    return label
  }()

  private lazy var cancelButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("취소", for: .normal)
    button.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0, green: 0.4795769453, blue: 1, alpha: 1), for: .normal)
    clearView.addSubview(button)
    return button
  }()

  private lazy var completeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("완료", for: .normal)
        button.addTarget(self, action: #selector(didTapCompleteButton(_:)), for: .touchUpInside)
    button.setTitleColor(#colorLiteral(red: 0, green: 0.4795769453, blue: 1, alpha: 1), for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    clearView.addSubview(button)
    return button
  }()

  private let pickerValues: [String] = ["별점순", "리뷰순", "할인율"]

  override func viewDidLoad() {
    super.viewDidLoad()
    configurelayout()
  }

  @objc private func didTapCancelButton(_ sender: UIButton) {
    customDismiss() //취소만
  }

  @objc private func didTapCompleteButton(_ sender: UIButton) {
    customDismiss()
  }

  func configurelayout() {

    clearView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    activityView.snp.makeConstraints { make in

      // FIXME: - top 어케 해주징?
      make.leading.trailing.bottom.equalToSuperview()
      make.height.equalToSuperview().multipliedBy(0.33)

    }

    cancelButton.snp.makeConstraints { make in
      make.top.equalTo(activityView.snp.top).inset(10)
      make.leading.equalTo(activityView.snp.leading).inset(10)
      make.bottom.equalTo(sortPickerView.snp.top)
      make.centerY.equalTo(titleLabel.snp.centerY)
    }

    completeButton.snp.makeConstraints { make in
      make.top.equalTo(activityView.snp.top).inset(10)
      make.trailing.equalTo(activityView.snp.trailing).inset(10)
      make.bottom.equalTo(sortPickerView.snp.top)
      make.centerY.equalTo(titleLabel.snp.centerY)
    }

    titleLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalTo(sortPickerView.snp.top)
    }

    sortPickerView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.bottom.equalToSuperview().inset(30)
    }

  }
  // pickerVC 올리기
   func showView() {
    UIView.animate(withDuration: 0.33) {

      self.activityView.snp.updateConstraints { make in
        make.top.equalTo(self.clearView.snp.bottom).offset(-UIScreen.main.bounds.height/2 - self.activityView.safeAreaInsets.bottom)
      }
      self.loadViewIfNeeded()
    }
  }

  // pickerVC 내려주기
  func customDismiss() {
    UIView.animate(withDuration: 0.33, animations: {
      if let userView = self.view as? PickerViewController { //흐음 
        userView.hideView()
        userView.loadViewIfNeeded()
      }
    }) { (_) in
      if let navi = self.presentingViewController as? UINavigationController,
        let detailRankingVC = navi.topViewController as? DetailRankingVC {

        detailRankingVC.sortList(self.didSelectRow)

      }

      self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
  }

  public func hideView() {

    self.clearView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    self.activityView.snp.updateConstraints { make in
      make.top.equalTo(clearView.snp.bottom).offset(0)
    }
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

}

extension PickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {

  //피커뷰 폰트 조정
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    var pickerLabel: UILabel? = (view as? UILabel)
    pickerLabel = UILabel()
    pickerLabel?.textAlignment = .center
    pickerLabel?.text = pickerValues[row]
    pickerLabel?.font = UIFont(name: "Raleway", size: 30)
    return pickerLabel!
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerValues.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerValues[row]
  }

  // MARK: - A method called when the picker is selected
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   didSelectRow = row
  }
}
