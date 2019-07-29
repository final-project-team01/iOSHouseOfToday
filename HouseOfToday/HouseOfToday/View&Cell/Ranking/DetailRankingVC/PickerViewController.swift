//
//  pickerViewViewController.swift
//  HouseOfToday
//
//  Created by Daisy on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

  private lazy var clearView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    view.addSubview(view)
    return view
  }()

  private lazy var activityView: UIView = {
    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = .blue
    return view
  }()

  private lazy var sortPickerView: UIPickerView = {
    let picker = UIPickerView()
    picker.dataSource = self
    picker.delegate = self
    activityView.addSubview(picker)
    return picker
  }()

  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "정렬"
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = .black
    activityView.addSubview(label)
    return label
  }()

  private lazy var cancelButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("취소", for: .normal)
    button.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    addSubview(button)
    button.setTitleColor(.blue, for: .normal)
    activityView.addSubview(button)
    return button
  }()

  private lazy var completeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("확인", for: .normal)
    //    button.addTarget(self, action: #selector(didTapCompleteButton(_:)), for: .touchUpInside)
    //    addSubview(button)
    button.setTitleColor(.blue, for: .normal)
    activityView.addSubview(button)
    return button
  }()

  private let pickerValues: [String] = ["별점순", "리뷰순", "할인율"]

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  @objc private func didTapCancelButton() {
    hideView()
  }

  func configurelayout() {

    clearView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    activityView.snp.makeConstraints { make in

      // FIXME: - top 어케 해주징?
      make.leading.trailing.equalToSuperview()
      make.height.equalToSuperview().multipliedBy(0.3)

    }

    cancelButton.snp.makeConstraints { make in
      make.top.leading.equalToSuperview().inset(10)
      make.bottom.equalTo(sortPickerView.snp.top)
    }

    completeButton.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(10)
      make.bottom.equalTo(sortPickerView.snp.top)
    }

    titleLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.bottom.equalTo(sortPickerView.snp.top)
    }

    sortPickerView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
    }

  }

  private func showView() {
    UIView.animate(withDuration: 0.33) {

      self.activityView.snp.updateConstraints { make in
        make.top.equalTo(self.activityView.snp.bottom).offset(-UIScreen.main.bounds.height/2 - self.activityView.safeAreaInsets.bottom)
      }
      self.loadViewIfNeeded()
    }
  }

  public func hideView() {

    self.clearView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    self.activityView.snp.updateConstraints { make in
      make.top.equalTo(activityView.snp.bottom).offset(0)
    }
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerValues.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerValues[row]
  }

  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    // FIXME: - A method called when the picker is selected
    print("picker selectued")
  }

}
