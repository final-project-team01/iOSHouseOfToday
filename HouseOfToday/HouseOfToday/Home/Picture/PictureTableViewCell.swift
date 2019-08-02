//
//  PictureTableViewCell.swift
//  HouseOfToday
//
//  Created by Daisy on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {

  private lazy var userInfoButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("daisy_ko_", for: .normal)
    button.setImage(UIImage(named: "userImage"), for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    button.backgroundColor = .yellow
    button.addTarget(self, action: #selector(didTapUserInfoButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private var followBool = false

  private lazy var followStatusButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("팔로잉", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    button.setTitleColor(.lightGray, for: .normal)
    button.addTarget(self, action: #selector(didTapFollowStatusButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  private lazy var dotdotdotButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("•••", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    button.addTarget(self, action: #selector(didTapDotdotdotButton(_:)), for: .touchUpInside)
    addSubview(button)
    return button
  }()

  var more = "...더보기" // FIXME: - 이렇게 하면 안될꺼 같은디 흐음

  private lazy var bodyTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "아내는 남편을 '그 자신이 가장 좋아하는 것들을 모아 만든 이름'으로 불렀고, 실제로 남편의 남은 인생을 그가 꿈꾸던 좋은 것들로 채워주었다. 남편은 아내를 '한때 자신의 것이었던 이름'으로 불렀다. 결혼 이후 세상을 떠날 때까지 김환기에게 아내 김향안은 또 다른 자신이었다. 5월의 사랑, 꿈, 아름다운 자연을 같이 나눌 사람은 하나밖에 없었던가. 한 사람이 가고 나니 5월의 이야기를 나눌 사람이 없다. 별들은 많으나 사랑할 수 있는 별은 하나밖에 없다." + self.more
    label.numberOfLines = 5
    label.lineBreakMode = .byTruncatingTail // FIXME: - 마지막에 `...더보기` 나오게 만들기
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
    addSubview(label)
    return label
  }()
  
  private lazy var thumbnailImageView: UIImageView = {
    let imageview = UIImageView(image: UIImage(named: "ahhh"))
    addSubview(imageview)
    return imageview
  }()

  // MARK: - View life cycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    makeConstraints()
    backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Action Methods
  @objc private func didTapUserInfoButton(_ sender: UIButton) {
    print("didTapUserInfoButton")
    // FIXME: - 유저 Info로 넘어가는 페이지 만들기
  }

  @objc private func didTapFollowStatusButton(_ sender: UIButton) {
    print("didTapFollowStatusLabel")
    followBool.toggle()
    if followBool == true {
      followStatusButton.setTitle("팔로잉", for: .normal)
      followStatusButton.setTitleColor( #colorLiteral(red: 0.238917172, green: 0.809586525, blue: 0.9523653388, alpha: 1), for: .normal)
    }
  }

    @objc private func didTapDotdotdotButton(_ sender: UIButton) {
      print("didTapDotdotdotButton")
      // FIXME: - 신고, 취소 알럿? 띄우기

    }

  // MARK: - AutoLayout
  func makeConstraints() {
    if translatesAutoresizingMaskIntoConstraints {

    }

  }
}
