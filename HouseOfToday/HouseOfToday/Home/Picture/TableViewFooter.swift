//
//  TableViewFooter.swift
//  HouseOfToday
//
//  Created by Daisy on 06/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class TableViewFooter: UITableViewHeaderFooterView {

static var height = UIScreen.main.bounds.height/20

  private lazy var heartButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("1", for: .normal)
    button.setTitleColor(.darkGray, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setImage(UIImage(named: "picHeart"), for: .normal)
    button.setImage(UIImage(named: "fullPicHeart"), for: .selected)
//    button.addTarget(self, action: #selector(didTapHeartButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var scrapButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("1", for: .normal)
    button.setTitleColor(.darkGray, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setImage(UIImage(named: "picBookMark"), for: .normal)
    button.setImage(UIImage(named: "fullPicBookMark"), for: .selected)
//    button.addTarget(self, action: #selector(didTapScrapButton(_:)), for: .touchUpInside)
//    button.isUserInteractionEnabled = true
    addSubview(button)
    return button
  }()

  private lazy var commentButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("1", for: .normal)
    button.setImage(UIImage(named: "picComment"), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(.darkGray, for: .normal)
//    button.addTarget(self, action: #selector(didTapCommentButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var sharingButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "picShare"), for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
    button.setTitleColor(.darkGray, for: .normal)
//    button.addTarget(self, action: #selector(didTapSharingButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var socialButtonStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [ self.heartButton,
                                                    self.scrapButton,
                                                    self.commentButton,
                                                    self.sharingButton]
    )
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    addSubview(stackView)
    return stackView
  }()

  override init(reuseIdentifier: String?) {
    super .init(reuseIdentifier: reuseIdentifier)
    configureLabel()

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureLabel() {

    socialButtonStackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.9)
    }

  }

}
