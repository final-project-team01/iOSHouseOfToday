//
//  UserWriteReviewVC.swift
//  HouseOfToday
//
//  Created by CHANGGUEN YU on 30/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Kingfisher

final class UserWriteReviewVC: UIViewController {

  // MARK: - Property
  private lazy var scrollView: UIScrollView = {
    let scroll = UIScrollView(frame: CGRect.zero)
    scroll.contentSize.width = UIScreen.main.bounds.width
    scroll.alwaysBounceHorizontal = false
    scroll.alwaysBounceVertical = true
    scroll.contentSize.width = UIScreen.main.bounds.width
    scroll.contentSize.height = UIScreen.main.bounds.height * 2
    scroll.delegate = self
    view.addSubview(scroll)
    return scroll
  }()

  private lazy var titileImageView: UIImageView = {
    let iv = UIImageView(frame: CGRect.zero)
    iv.contentMode = .scaleAspectFit
    scrollView.addSubview(iv)
    return iv
  }()

  private lazy var productTitle: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "선택된 상품이 없습니다."
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 15)
    scrollView.addSubview(label)
    return label
  }()

  private lazy var pointLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "포토250P"
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    scrollView.addSubview(label)
    return label
  }()

  private lazy var satisfactionLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "별점을 눌러 만족도를 알려주세요"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    scrollView.addSubview(label)
    return label
  }()

  private lazy var levelLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "만족도"
    label.font = UIFont.systemFont(ofSize: 15)
    scrollView.addSubview(label)
    return label
  }()

  private lazy var emotionLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.font = UIFont.systemFont(ofSize: 13)
    label.textColor = .lightGray
    scrollView.addSubview(label)
    return label
  }()

  private let emotionTexts = ["별로에요", "생각했던 것보다 별로에요", "괜찮네요!", "좋아요! 마음에 듭니다.", "마음에 쏙들어요!, 적극추천~"]

  private var ratingStarButtons: [UIButton] = []

  private lazy var photoImageView: UIImageView = {
    let iv = UIImageView(image: UIImage(named: "photoReqeust"))
    iv.contentMode = .scaleAspectFit
    scrollView.addSubview(iv)
    return iv
  }()

  private lazy var askReviewLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "리뷰를 작성해주세요."
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    scrollView.addSubview(label)
    return label
  }()

  private lazy var lowestTextLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "0자 | 최소 20자"
    label.font = UIFont.systemFont(ofSize: 10)
    label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    scrollView.addSubview(label)
    return label
  }()

  private lazy var reviewTextView: UITextView = {
    let tv = UITextView(frame: CGRect.zero)
    tv.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    tv.layer.borderWidth = 1
    tv.text = "  이 제품을 사용하면서 느꼈던 장점과 단점을 솔직하게 알려주세요."
    tv.textColor = .lightGray
    tv.font = UIFont.systemFont(ofSize: 12)
    tv.delegate = self
//    tv.textInputMod
    scrollView.addSubview(tv)
    return tv
  }()

  private lazy var warningLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.textColor = .lightGray
    label.text = "*해당 상품과 무관한 내용이나 동일 문자의 반복 등 부적합한 내용은 삭제될 수 있습니다"
    label.font = UIFont.systemFont(ofSize: 13)
    label.numberOfLines = 2
    scrollView.addSubview(label)
    return label
  }()

  private lazy var askOnUsingReviewLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "직접 제품을 사용하고 작성하는 리뷰인가요?"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    scrollView.addSubview(label)
    return label
  }()

  private lazy var agreementCheckButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setImage(UIImage(named: "unselected"), for: .normal)
    btn.setImage(UIImage(named: "selected"), for: .selected)
    btn.addTarget(self, action: #selector(touchAgreement(_:)), for: .touchUpInside)
    scrollView.addSubview(btn)
    return btn
  }()

  private lazy var agreementPolcyButton: UIButton = {
    let btn = UIButton(type: .custom)

    let mutableAttributedString = NSMutableAttributedString()

    let attributesBlack: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 15),
      .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    ]
    let agree = NSMutableAttributedString(string: "네, 그리고 ",
                                                    attributes: attributesBlack)
    let attributesCyon: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 15),
      .foregroundColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    ]
    let policy = NSMutableAttributedString(string: "오늘의집 리뷰 정책",
                                                     attributes: attributesCyon)
    let agreement = NSMutableAttributedString(string: "에도 동의합니다.",
                                           attributes: attributesBlack)

    mutableAttributedString.append(agree)
    mutableAttributedString.append(policy)
    mutableAttributedString.append(agreement)

    btn.setAttributedTitle(mutableAttributedString, for: .normal)

    btn.addTarget(self, action: #selector(presentPolicy(_:)), for: .touchUpInside)
    scrollView.addSubview(btn)
    return btn
  }()

  private lazy var uploadReviewButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("저장하기", for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    btn.addTarget(self, action: #selector(uploadReview(_:)), for: .touchUpInside)
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 5
    scrollView.addSubview(btn)
    return btn
  }()

  private lazy var pointGivePolicyLabel: UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.text = "*비구매리뷰의 경우, 작성해주신 리뷰를 심사한 후 리뷰 등록 및 포인트 지급이 됩니다."
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 15)
    label.textColor = .lightGray
    scrollView.addSubview(label)
    return label
  }()

  public var productDetailData: ProductDetail? {
    didSet {
      guard let info = productDetailData else {return print("productDetailData is nil")}

      if let first = info.thumnailImages.first {
        print("first.image: \(first.image)")
        if let url = URL(string: first.image) {

        titileImageView.kf.setImage(with: url,
                                     placeholder: nil,
                                     options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                     progressBlock: nil) { (_) in
        }
      }
      }

      productTitle.text = "[\(info.brandName)] \(info.name)"

    }
  }

  // MARK: - View life cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    makeRatingStarButton()
    autolayoutViews()
    autolayoutButtons()

    settingViews()

    reviewTextView.textContentType = .location
  }

  // MARK: - Setting Navigation Bar
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureNaviBar()
  }
  private func configureNaviBar() {
    self.title = "리뷰보기"
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    self.navigationItem.setHidesBackButton(true, animated: false)
    let backItem = UIBarButtonItem.setButton(self, action: #selector(backButtonDidTap(_:)), imageName: "back")
    navigationItem.setLeftBarButton(backItem, animated: true)
  }
  @objc private func backButtonDidTap(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
  }

  // MARK: - configure
  private func makeRatingStarButton() {

    for index in 0...4 {
      let btn = UIButton(type: .custom)
      btn.tag = index
      btn.setImage(UIImage(named: "emptyStar"), for: .normal)
      btn.addTarget(self, action: #selector(ratingStar(_:)), for: .touchUpInside)
      scrollView.addSubview(btn)
      ratingStarButtons.append(btn)
    }
  }

  private func autolayoutViews() {

    scrollView.snp.makeConstraints {
      $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.bottom.equalToSuperview()
    }

    titileImageView.backgroundColor = .white
    titileImageView.snp.makeConstraints {
      $0.width.height.equalTo(100)
      $0.top.equalTo(scrollView.snp.top).offset(Metric.marginY/2)
      $0.leading.equalToSuperview().offset(Metric.marginX)
    }

    productTitle.snp.makeConstraints {
      $0.centerY.equalTo(titileImageView)
      $0.leading.equalTo(titileImageView.snp.trailing).offset(Metric.marginX)
      $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(Metric.marginX)
    }

    pointLabel.snp.makeConstraints {
      $0.top.equalTo(productTitle.snp.bottom)
      $0.leading.equalTo(titileImageView.snp.trailing).offset(Metric.marginX)
      $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-Metric.marginX)
    }

    satisfactionLabel.snp.makeConstraints {
      $0.top.equalTo(titileImageView.snp.bottom).offset(Metric.marginY*3)
      $0.leading.equalToSuperview().offset(Metric.marginX)
    }

    levelLabel.snp.makeConstraints {
      $0.top.equalTo(satisfactionLabel.snp.bottom).offset(Metric.marginY)
      $0.leading.equalToSuperview().offset(Metric.marginX)
    }

    photoImageView.snp.makeConstraints {
      $0.top.equalTo(levelLabel.snp.bottom).offset(Metric.marginY*4)
      $0.leading.trailing.equalTo(view)
      $0.height.equalTo(photoImageView.snp.width).multipliedBy(0.7)
    }

    askReviewLabel.snp.makeConstraints {
      $0.top.equalTo(photoImageView.snp.bottom).offset(Metric.marginY*2)
      $0.leading.equalToSuperview().offset(Metric.marginX)
    }

    lowestTextLabel.snp.makeConstraints {
      $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-Metric.marginX)
      $0.bottom.equalTo(askReviewLabel.snp.bottom)
    }

    reviewTextView.snp.makeConstraints {
      $0.top.equalTo(askReviewLabel.snp.bottom).offset(Metric.marginY)
      $0.leading.equalTo(view).offset(Metric.marginX)
      $0.trailing.equalTo(view).offset(-Metric.marginX)
      $0.height.equalTo(300)
    }

    warningLabel.snp.makeConstraints {
      $0.top.equalTo(reviewTextView.snp.bottom).offset(Metric.marginY)
      $0.leading.equalTo(view).offset(Metric.marginX)
      $0.trailing.equalTo(view).offset(-Metric.marginX)
    }

    askOnUsingReviewLabel.snp.makeConstraints {
      $0.top.equalTo(warningLabel.snp.bottom).offset(Metric.marginY*2)
      $0.leading.equalToSuperview().offset(Metric.marginX)
    }

    agreementCheckButton.snp.makeConstraints {
      $0.top.equalTo(askOnUsingReviewLabel.snp.bottom).offset(Metric.marginY)
      $0.leading.equalToSuperview().offset(Metric.marginX)
      $0.width.height.equalTo(35)
    }

    agreementPolcyButton.snp.makeConstraints {
      $0.centerY.equalTo(agreementCheckButton.snp.centerY)
      $0.leading.equalTo(agreementCheckButton.snp.trailing).offset(5)
    }

    uploadReviewButton.snp.makeConstraints {
      $0.top.equalTo(agreementPolcyButton.snp.bottom).offset(Metric.marginY*2)
      $0.leading.equalTo(view).offset(Metric.marginX)
      $0.trailing.equalTo(view).offset(-Metric.marginX)
      $0.height.equalTo(70)
    }

    pointGivePolicyLabel.snp.makeConstraints {
      $0.top.equalTo(uploadReviewButton.snp.bottom).offset(Metric.marginY)
      $0.leading.trailing.equalTo(uploadReviewButton)
      $0.bottom.equalToSuperview().offset(Metric.marginY)
    }

  }

  private func autolayoutButtons() {

    guard let first = ratingStarButtons.first else { return print("ratingStarButtonsis nil")}

    first.snp.makeConstraints {
      $0.leading.equalTo(levelLabel.snp.trailing).offset(Metric.marginX)
      $0.top.equalTo(satisfactionLabel.snp.bottom).offset(Metric.marginY)
      $0.width.height.equalTo(50)
    }

    emotionLabel.snp.makeConstraints {
      $0.top.equalTo(first.snp.bottom).offset(Metric.marginY/2)
      $0.leading.equalTo(first)
    }

    for index in 1..<ratingStarButtons.count {

      ratingStarButtons[index].snp.makeConstraints {
        $0.leading.equalTo(ratingStarButtons[index-1].snp.trailing).offset(5)
        $0.top.equalTo(first.snp.top)
        $0.width.height.equalTo(50)
      }
    }
  }

  private func settingViews() {
    guard let info = productDetailData else {return print("productDetailData is nil")}
    if let first = info.thumnailImages.first {
      print("first.image: \(first.image)")
      if let url = URL(string: first.image) {

        titileImageView.kf.setImage(with: url,
                                    placeholder: nil,
                                    options: [.transition(.fade(0)), .loadDiskFileSynchronously],
                                    progressBlock: nil) { (_) in
        }
      }
    }

    productTitle.text = "[\(info.brandName)] \(info.name)"

  }

  private var clickedTab = 0
  @objc private func ratingStar(_ sender: UIButton) {

    if emotionTexts.count > sender.tag {
      emotionLabel.text = emotionTexts[sender.tag]
    }

    clickedTab = sender.tag

    ratingStarButtons.forEach {

      if sender.tag >= $0.tag {
        $0.setImage(UIImage(named: "fillStar"), for: .normal)
      } else {
        $0.setImage(UIImage(named: "emptyStar"), for: .normal)
      }

    }
  }

  @objc private func touchAgreement(_ sender: UIButton) {
    sender.isSelected.toggle()
  }

  @objc private func presentPolicy(_ sender: UIButton) {
    let showPolicyVC = ShowPolicyVC()
    showPolicyVC.modalPresentationStyle = .overFullScreen

    present(showPolicyVC, animated: false)
  }

  @objc private func uploadReview(_ sender: UIButton) {
    guard agreementCheckButton.isSelected else { return }

    // FIXME: - add upload

    alertWriteReview()

  }

  private func alertWriteReview() {
    let alert = UIAlertController(title: "Review", message: "리뷰를 작성합니다.", preferredStyle: .alert)
    let okAlert = UIAlertAction(title: "작성", style: .default) { [weak self] (_) in
      if let productId = self?.productDetailData?.id,
        let text = self?.reviewTextView.text, let star = self?.clickedTab {

        let postData = NSMutableData(data: "product=\(productId)".data(using: String.Encoding.utf8)!)
        postData.append("&star_score=\(star)".data(using: String.Encoding.utf8)!)
        postData.append("&comment=\(text)".data(using: String.Encoding.utf8)!)

        self?.postProductReview(post: postData as Data)

//        NotificationCenter.default.post(name: ProductReviewView.downloadDetail, object: nil, userInfo: ["ID": productId])
//        self?.navigationController?.popViewController(animated: true)
      }
    }

    let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in

    }

    alert.addAction(okAlert)
    alert.addAction(cancel)

    present(alert, animated: true)

  }

  private let service = HouseOfTodayService()

  private func postProductReview(post: Data) {

    service.postProductReview(data: post) { result in
      switch result {
      case .success(let list):
        print("success!!! postProductReview)")

        DispatchQueue.main.async {
          self.navigationController?.popViewController(animated: true)
        }

      case .failure(let error):
        print("postProductReview Error: \(error.localizedDescription)")
      }
    }
  }
}

extension UserWriteReviewVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    reviewTextView.resignFirstResponder()
  }
}

extension UserWriteReviewVC: UITextViewDelegate {

  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == .lightGray {
      textView.text = nil
      textView.textColor = .black
      textView.font = UIFont.systemFont(ofSize: 15)
    }
  }

  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "  이 제품을 사용하면서 느꼈던 장점과 단점을 솔직하게 알려주세요."
      textView.textColor = .lightGray
      textView.font = UIFont.systemFont(ofSize: 12)
    }
  }

  func textViewDidChange(_ textView: UITextView) {
    if textView.text.count < 20 {
      lowestTextLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    } else {
      lowestTextLabel.textColor = .lightGray
    }

    if textView.textColor == .black {
      lowestTextLabel.text = "\(textView.text.count)자 | 최소 20자"
    }
  }
}
