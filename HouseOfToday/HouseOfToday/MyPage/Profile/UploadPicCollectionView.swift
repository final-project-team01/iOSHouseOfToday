//
//  UploadPicCollectionView.swift
//  HouseOfToday
//
//  Created by Daisy on 22/07/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Photos

private let reuseIdentifier = "PhotoCell"

class UploadPicCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  var images = [UIImage]()
  var assets = [PHAsset]()
  var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

      self.collectionView.register(cell: PicCollectionViewCell.self, forCellReuseIdentifier: reuseIdentifier)
      collectionView.backgroundColor = .white

      fetchPhotos()
    }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 2) / 3
    return CGSize(width: width, height: width)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return images.count + 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PicCollectionViewCell else {fatalError("cell type not")}

      switch indexPath.row {
      case 0:
        cell.photoImageView.image = UIImage(named: "takeApic")
      default:
        cell.photoImageView.image = images[indexPath.row - 1]
      }

        return cell
    }

  // MARK: - Photos func
  private func fetchPhotos() {

    // set options
    let options = PHFetchOptions()

    //사진을 몇개나 가져올지
    options.fetchLimit = 1000

    //정렬방식
    let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)

    //옵션 정렬 지정
    options.sortDescriptors = [sortDescriptor]

    DispatchQueue.global(qos: .background).async {

      //사진 에셋 가져오기
      let allphotos = PHAsset.fetchAssets(with: .image, options: options)

//      allphotos.firstObject
      allphotos.enumerateObjects({ (asset, _, _) in

        //이미지 매니져
        let imageManager = PHImageManager.default()

        //사진사이즈
        let targetSize = CGSize(width: 200, height: 200)

        //이미지 요청 할 때 옵션
        let options = PHImageRequestOptions()

        //이미지 동기/비동기를 결정하는 변수
        options.isSynchronous = true

        //이미지 요청
        imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options, resultHandler: { (image, _) in
          if let image = image {

            //이미지 추가하기
            self.images.append(image)

            //select 할 때 더 큰 이미지를 요청
            self.assets.append(asset)

            if self.selectedImage == nil {
              self.selectedImage = image
            }

            DispatchQueue.main.async {
              self.collectionView.reloadData()
              print("collectionView.reloadData")
            }

          }

        })

      })

    }

  }

}
