//
//  CategoryIndicatorBar.swift
//  HouseOfToday
//
//  Created by chang sic jung on 14/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class IndicatorBarView: UIView {

  var categoryTitles: [String]?

  var frameWidth: CGFloat?
  var widthSize: CGFloat?

  lazy var indicatorBar: UIView = {
    let v = UIView()
    v.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    addSubview(v)
    return v
  }()

  /// IndicatorBar Leading Position 결정하기
  var setIndicatorLeading: CGFloat = 0 {
    didSet {
      indicatorBar.snp.updateConstraints {
        $0.leading.equalTo(self.setIndicatorLeading)
      }
    }
  }

  private func makeConstraints() {
  }
  /// widthSize 구해야 하고
//  indicatorBar.snp.makeConstraints {
//  $0.width.equalTo(widthSize)
//  }

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
  }
}
