//
//  WriteReviewVC.swift
//  HouseOfToday
//
//  Created by Daisy on 23/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class WriteReviewVC: UIViewController {

  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰를 쓰고 싶은 제품을 검색해 보세요."
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    view.addSubview(label)
    return label
  }()

  private lazy var bestButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("제품명 또는 브랜드", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
//    button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    view.addSubview(button)
    return button
  }()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
