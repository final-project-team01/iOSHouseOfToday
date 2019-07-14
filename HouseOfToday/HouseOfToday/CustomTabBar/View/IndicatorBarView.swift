//
//  CategoryIndicatorBar.swift
//  HouseOfToday
//
//  Created by chang sic jung on 14/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class IndicatorBarView: UIView {

  var categoryTitles: [String]! // 초기화부터 넣어주니까 무조건 들어가겠지

  /// 동적으로 오토레이아웃 잡기 실패
  var frameWidth: CGFloat? {
    didSet {
      self.widthSize = self.frameWidth ?? 0 / CGFloat(self.categoryTitles.count)
    }
  }
  var widthSize: CGFloat? {
    didSet {
      //self.setNeedsUpdateConstraints()
    }
  }

  /// IndicatorBar Leading Position 결정하기
  var setIndicatorLeading: CGFloat = 0 {
    didSet {
      self.snp.updateConstraints {
        $0.leading.equalTo(self.setIndicatorLeading)
      }
    }
  }

  var didSelectCategoryCell: IndexPath? {
    didSet {
      let widthSize = UIScreen.main.bounds.width / CGFloat(categoryTitles.count)
      self.snp.updateConstraints {
        $0.leading.equalTo(widthSize * CGFloat(self.didSelectCategoryCell!.row))
      }

    }
  }

  /// 다이나믹 오토 레이아웃으로 시작점 잡아야 하고
//  setIndicatorLeading = widthSize * CGFloat(indexPath.item)
//  UIView.animate(withDuration: 0.5,
//  delay: 0,
//  usingSpringWithDamping: 0.7,
//  initialSpringVelocity: 1,
//  options: .curveEaseInOut,
//  animations: {
//  self.layoutIfNeeded()
//  },
//  completion: nil)

  /// 스크롤 할 때 같이 움직이게 설정해야 하고.
//  indicatorBar.snp.updateConstraints {
//  $0.leading.equalTo(setIndicatorLeading - leftOffset)
//  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    makeConstraints()

  }

  private func makeConstraints() {
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }
  override var intrinsicContentSize: CGSize {
    return self.frame.size
  }

  override func updateConstraints() {
    super.updateConstraints()
    let widthSize = UIScreen.main.bounds.width / CGFloat(categoryTitles.count)
    self.snp.makeConstraints {
      $0.width.equalTo(widthSize)
    }

//    guard let test = widthSize else { return logger() }
//    self.snp.makeConstraints {
//      $0.width.equalTo(test)
//    }
  }
}
