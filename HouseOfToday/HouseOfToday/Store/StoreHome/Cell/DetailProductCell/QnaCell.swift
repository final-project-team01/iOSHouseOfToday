//
//  QnaCell.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 31/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class QnaCell: UITableViewCell {

  // MARK: - Property
  static var identifier: String = "QnaCell"

  private lazy var typeLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "배송관련 / "
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var completeLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "답변완료"
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    addSubview(label)
    return label
  }()

  private lazy var userInfoLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "user | 2019.01.02"
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  private lazy var qLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "Q "
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var questionLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "문의 ㅁ니아러ㅚㅕㅈ도리ㅏㅓ튜ㅜㅇㄹ;ㅏ머눙ㄹ;ㅣㅏ머ㅜㄴㅇㄹ;ㅓ문ㅇ;래ㅕㅁㄴ;ㅇ럼;나어룸;나어ㅠㄹ;매녀율;ㅐㅁ녀ㅠ울;ㅐ머ㅠㅜㄴㅇㄹ;ㅏㅓ문ㅇㄹ;ㅐㅕㅁㄴㅇ;래ㅕㅠㅠㅓㅏㅇㄴ라ㅕㅗ뮤낭랴ㅕㅛㅠㅁ낭려ㅛ"
    label.numberOfLines = 0
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15)
    addSubview(label)
    return label
  }()

  private lazy var aLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "A "
    label.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    addSubview(label)
    return label
  }()

  private lazy var answerLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "답변 미ㅏ너ㅜㅇ리ㅕㄴㅇ루ㅏㅗㅓㅁ늉ㄹ마ㅓㅗㄴ유라며ㅗ늉랴ㅛㅁ닏러ㅠ자ㅓ류 마ㅓ토ㅠ리먀녀유리ㅑ며늉리모ㅓㅏㄴ우ㅠㄹ문유리ㅏ머ㅗ늉리ㅏㅓ뮨ㅇ리ㅗ뮨이ㅏ류미나ㅓㅇ류ㅣ마노유리ㅏㅁ늉리ㅏ뮨이로ㅓ민오러ㅠㅣ만ㅇ류ㅣ마ㅗㄴ유리몬유리모ㅠㄴㅇㄹ"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    addSubview(label)
    return label
  }()

  private lazy var answerInfoLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "anwser | 2019.01.03"
    label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    label.font = UIFont.systemFont(ofSize: 13)
    addSubview(label)
    return label
  }()

  public var qnaData: ProductDetail.QnAList? {
    didSet {
      guard let info = qnaData else { return print("qnaData nil")}

      typeLabel.text = "\(info.type)관련 / "
      userInfoLabel.text = "\(info.user) | \(info.created)"
      questionLabel.text = info.comment

      if info.completed {
        completeLabel.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        completeLabel.text = "답변완료"

        answerLabel.text = info.aComment
        answerInfoLabel.text = "\(info.aAuthor) | \(info.aCreated)"
      } else {
        completeLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        completeLabel.text = "미완료"
      }

      autolayoutViews(type: info.completed)
    }
  }

  // MARK: - View life cycle
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  override func layoutSubviews() {
    super.layoutSubviews()

  }

  private func autolayoutViews(type: Bool) {

    if typeLabel.translatesAutoresizingMaskIntoConstraints {
      typeLabel.snp.makeConstraints {
        $0.top.leading.equalToSuperview().offset(Metric.marginY)
      }
    }

    if completeLabel.translatesAutoresizingMaskIntoConstraints {
      completeLabel.snp.makeConstraints {
        $0.top.equalTo(typeLabel)
        $0.leading.equalTo(typeLabel.snp.trailing)
      }
    }

    if userInfoLabel.translatesAutoresizingMaskIntoConstraints {
      userInfoLabel.snp.makeConstraints {
        $0.top.equalTo(typeLabel)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
      }
    }

    if qLabel.translatesAutoresizingMaskIntoConstraints {
      qLabel.snp.makeConstraints {
        $0.top.equalTo(typeLabel.snp.bottom).offset(Metric.marginY*1.5)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if questionLabel.translatesAutoresizingMaskIntoConstraints {
      questionLabel.snp.makeConstraints {
        $0.top.equalTo(qLabel)
        $0.leading.equalToSuperview().offset(Metric.marginX*2)
        $0.trailing.equalToSuperview().offset(-Metric.marginX)

        if !type { $0.bottom.equalToSuperview().offset(-Metric.marginY) }
      }
    }

    /////////
    if type {
      if aLabel.translatesAutoresizingMaskIntoConstraints {
        aLabel.snp.makeConstraints {
          $0.top.equalTo(questionLabel.snp.bottom).offset(Metric.marginY)
          $0.leading.equalToSuperview().offset(Metric.marginX)
        }
      }

      if answerLabel.translatesAutoresizingMaskIntoConstraints {
        answerLabel.snp.makeConstraints {
          $0.top.equalTo(aLabel)
          $0.leading.equalToSuperview().offset(Metric.marginX*2)
          $0.trailing.equalToSuperview().offset(-Metric.marginX)
        }
      }

      if answerInfoLabel.translatesAutoresizingMaskIntoConstraints {
        answerInfoLabel.snp.makeConstraints {
          $0.top.equalTo(answerLabel.snp.bottom).offset(Metric.marginY)
          $0.leading.equalToSuperview().offset(Metric.marginX*2)
          $0.bottom.equalToSuperview().offset(-Metric.marginY)
        }
      }
    }
  }

}
