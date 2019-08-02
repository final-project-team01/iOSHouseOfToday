//
//  BuyingVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 02/08/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

final class BuyingVC: UIViewController {

  // MARK: - Property
  private lazy var buyingView: UIView = {
    let bv = UIView(frame: CGRect.zero)
    bv.backgroundColor = .white
    view.addSubview(bv)
    return bv
  }()

  private lazy var shoppingBagButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.backgroundColor = #colorLiteral(red: 0.8776302934, green: 0.8724135756, blue: 0.8816406131, alpha: 1)
    btn.setTitle("장바구니", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .highlighted)
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 5
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    btn.addTarget(self, action: #selector(touchUpShoppingBagButton(_:)), for: .touchUpInside)
    btn.addTarget(self, action: #selector(downEventButton(_:)), for: .touchDown)
    buyingView.addSubview(btn)
    return btn
  }()

  private lazy var buyingButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("구매하기", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), for: .highlighted)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 5
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    btn.addTarget(self, action: #selector(touchUpBuyingButton(_:)), for: .touchUpInside)
    btn.addTarget(self, action: #selector(downEventButton(_:)), for: .touchDown)
    buyingView.addSubview(btn)
    return btn
  }()

  private lazy var priceInfoLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "price Info"
    buyingView.addSubview(label)
    return label
  }()

  private lazy var pointInfoLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "100만원 이상 구매시 20,000P 추가적립"
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    buyingView.addSubview(label)
    return label
  }()

  private lazy var questionButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("?", for: .normal)
    btn.addTarget(self, action: #selector(touchUpquestionButton(_:)), for: .touchUpInside)
    buyingView.addSubview(btn)
    return btn
  }()

  private lazy var dissmissButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.backgroundColor = .clear
    btn.addTarget(self, action: #selector(touchUpDissmiss(_:)), for: .touchUpInside)
    view.addSubview(btn)
    return btn
  }()
  
  private lazy var flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    // FIXME: -  delegate 로 수정
    layout.headerReferenceSize = CGSize(width: Int(UIScreen.main.bounds.width - Metric.marginX*2),
                                        height: 200)
    return layout
  }()
  
  private lazy var collectionView: UICollectionView = {
    let colV = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
    colV.backgroundColor = .lightGray
    colV.dataSource = self
    colV.delegate = self
    colV.register(cell: BuyingProductOptionCell.self)
    colV.register(<#T##viewClass: AnyClass?##AnyClass?#>, forSupplementaryViewOfKind: <#T##String#>, withReuseIdentifier: <#T##String#>)
    return colV
  }()

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)

    autolayoutViews()
  }

  // MARK: - configure
  private func autolayoutViews() {

    dissmissButton.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }

    buyingView.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(170)
    }

    shoppingBagButton.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.marginX/2)
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
      $0.height.equalTo(50)
    }

    buyingButton.snp.makeConstraints {
      $0.leading.equalTo(shoppingBagButton.snp.trailing).offset(Metric.marginX/2)
      $0.trailing.equalToSuperview().offset(-Metric.marginX/2)
      $0.width.height.equalTo(shoppingBagButton)
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }

    priceInfoLabel.snp.makeConstraints {
      $0.top.equalTo(buyingView).offset(Metric.marginY)
      $0.centerX.equalTo(buyingView)
//      $0.leading.trailing.equalToSuperview()
    }

    pointInfoLabel.snp.makeConstraints {
      $0.top.equalTo(priceInfoLabel.snp.bottom).offset(Metric.marginY)
      $0.centerX.equalTo(buyingView)
    }

    questionButton.snp.makeConstraints {
      $0.centerY.equalTo(pointInfoLabel)
      $0.leading.equalTo(pointInfoLabel.snp.trailing)
      $0.width.height.equalTo(30)
    }

  }

  // MARK: - Touch Button action
  @objc private func downEventButton(_ sender: UIButton) {
    sender.isHighlighted.toggle()
  }

  @objc private func touchUpBuyingButton(_ sender: UIButton) {

  }

  @objc private func touchUpShoppingBagButton(_ sender: UIButton) {

  }

  @objc private func touchUpquestionButton(_ sender: UIButton) {

  }

  @objc private func touchUpDissmiss(_ sender: UIButton) {

    self.presentingViewController?.dismiss(animated: false, completion: nil)
  }

}


extension BuyingVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeue(<#T##reusableCell: Cell.Type##Cell.Type#>, indexPath)
    
    return cell
  }
  
  
}

extension BuyingVC: UICollectionViewDelegateFlowLayout {
  
}
