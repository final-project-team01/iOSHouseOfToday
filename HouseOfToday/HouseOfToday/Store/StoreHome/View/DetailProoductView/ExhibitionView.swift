//
//  ExhibitionVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 29/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class ExhibitionView: UIView {

  // MARK: - Property
  static var height: CGFloat = 530

  private lazy var titleLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "이 제품이 포함된 기획전"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    addSubview(label)
    return label
  }()

  private lazy var folwLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = Metric.ExhibitionCellSize
    layout.minimumLineSpacing = 5
    layout.sectionInset = UIEdgeInsets(top: Metric.marginY, left: Metric.marginX, bottom: Metric.marginY, right: Metric.marginX)
    return layout
  }()

  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: folwLayout)
    colV.register(cell: ExhibitionCell.self)
    colV.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    colV.dataSource = self
    colV.delegate = self
    addSubview(colV)
    return colV
  }()

  private lazy var qnaButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.backgroundColor = .white
    btn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.layer.borderWidth = 0.5
    btn.addTarget(self, action: #selector(touchQnA(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  private lazy var qnaImageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "qna"))
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    qnaButton.addSubview(iv)
    return iv
  }()

  private lazy var qnaLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "문의"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    qnaButton.addSubview(label)
    return label
  }()

  private lazy var qnaTotalCountLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "999"
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    qnaButton.addSubview(label)
    return label
  }()

  private lazy var arrowQnaLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "❯"
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    qnaButton.addSubview(label)
    return label
  }()

  private lazy var policyButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.backgroundColor = .white
    btn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btn.layer.borderWidth = 0.5
    btn.addTarget(self, action: #selector(touchPolicy(_:)), for: .touchUpInside)
    addSubview(btn)
    return btn
  }()

  private lazy var policyImageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "policyBtn"))
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    policyButton.addSubview(iv)
    return iv
  }()

  private lazy var policyLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "배송/교환/환불"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    policyButton.addSubview(label)
    return label
  }()

  private lazy var arrowPolicyLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "❯"
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    policyButton.addSubview(label)
    return label
  }()

  private lazy var similarLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "비슷한 상품"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    addSubview(label)
    return label
  }()

  public var productDetailData: ProductDetail? {
    didSet {
      guard let info = productDetailData else { return print("productDetailData is nil")}

      qnaTotalCountLabel.text = "\(info.qna.count)"
    }
  }

  // MARK: - View life cycle
  override func layoutSubviews() {
    super.layoutSubviews()
    backgroundColor = .white
    autolayoutViews()

//    qnaImageView.contentMode = .scaleAspectFit
  }

  // MARK: - configure
  private func autolayoutViews() {

    if titleLabel.translatesAutoresizingMaskIntoConstraints {
      titleLabel.snp.makeConstraints {
        $0.top.equalToSuperview().offset(Metric.marginY*2)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

    if collectionView.translatesAutoresizingMaskIntoConstraints {
      collectionView.snp.makeConstraints {
        $0.top.equalTo(titleLabel.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(Metric.ExhibitionCellSize.height + Metric.marginY * 2)
      }
    }

    if qnaButton.translatesAutoresizingMaskIntoConstraints {
      qnaButton.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom).offset(Metric.marginY)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(80)
      }

      qnaImageView.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.width.equalTo(qnaButton.snp.height).multipliedBy(0.5)
        $0.height.equalTo(qnaImageView.snp.width)
      }

      qnaLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalTo(qnaImageView.snp.trailing).offset(Metric.marginX/2)
      }

      qnaTotalCountLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalTo(qnaLabel.snp.trailing).offset(Metric.marginX/2)
      }

      arrowQnaLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
      }
    }

    if policyButton.translatesAutoresizingMaskIntoConstraints {
      policyButton.snp.makeConstraints {
        $0.top.equalTo(qnaButton.snp.bottom)
        $0.leading.trailing.equalToSuperview()
        $0.height.equalTo(80)
      }

      policyImageView.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalToSuperview().offset(Metric.marginX)
        $0.width.equalTo(policyButton.snp.height).multipliedBy(0.5)
        $0.height.equalTo(policyImageView.snp.width)
      }

      policyLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.leading.equalTo(qnaImageView.snp.trailing).offset(Metric.marginX/2)
      }

      arrowPolicyLabel.snp.makeConstraints {
        $0.centerY.equalToSuperview()
        $0.trailing.equalToSuperview().offset(-Metric.marginX)
      }
    }

    if similarLabel.translatesAutoresizingMaskIntoConstraints {
      similarLabel.snp.makeConstraints {
        $0.top.equalTo(policyButton.snp.bottom).offset(Metric.marginY*1.5)
        $0.leading.equalToSuperview().offset(Metric.marginX)
      }
    }

  }

  // MARK: - touch QnA Button
  @objc private func touchQnA(_ sender: UIButton) {
    print("touchQnA")
    let questionsAndAnswersVC = QuestionsAndAnswersVC()

    if let qna = productDetailData?.qna,
      let id = productDetailData?.id {
      questionsAndAnswersVC.qnaList = qna
      questionsAndAnswersVC.productId = id
    }

    NotificationCenter.default.post(name: ProductDetailVC.present, object: nil, userInfo: ["viewController": questionsAndAnswersVC])
  }

  @objc private func touchPolicy(_ sender: UIButton) {
    print("touchPolicy")
    let deliveryPolicyVC = DeliveryPolicyVC()

    NotificationCenter.default.post(name: ProductDetailVC.presentFormBottom, object: nil, userInfo: ["viewController": deliveryPolicyVC])
  }

}

extension ExhibitionView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(ExhibitionCell.self, indexPath)
    cell.imageView.image = UIImage(named: "Exhibition\(indexPath.item + 1)")
    return cell
  }
}

extension ExhibitionView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    // FIXME: - present Review
//    notiCenter.post(name: ProductDetailVC.presentReview, object: nil)
  }
}
