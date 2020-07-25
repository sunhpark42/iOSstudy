//
//  ViewController.swift
//  MyAlbum
//
//  Created by Sunhee Park on 2020/07/25.
//  Copyright © 2020 sunhpark. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    //앨범을 가져오기 위해 PHAssetCollection을 이용함
    var fetchResult : [PHAssetCollection] = []
    // 가져온 앨범을 지정해 주는 코드
    let imageManager : PHCachingImageManager = PHCachingImageManager()
    let cellIdentifier : String = "cell"
    
    //AssetCollection 을 받아오는 코드
    let photoAlbums : PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: nil)
    
    let smartAlbums : PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumFavorites, options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "앨범"
        
        // flow Layout
        let flowLayout: UICollectionViewFlowLayout
        //인스턴스 생성
        flowLayout = UICollectionViewFlowLayout()
        //섹션의 inset => viewprogramming guide 읽기
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //아이템간의 거리, 단위 pt
        flowLayout.minimumInteritemSpacing = 10
        //라인간의 거리
        flowLayout.minimumLineSpacing = 10

        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0

        // 예상 사이즈 (오토레이아웃에 따라서 셀 크기가 가변적일 수 있음)
        flowLayout.estimatedItemSize = CGSize(width: halfWidth - 30, height: 90)

        self.collectionView.collectionViewLayout = flowLayout

        self.collectionView.reloadData()
        
        
        // 접근 권한을 얻기 위함
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
            self.collectionView.reloadData()
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.collectionView.reloadData()
                    }
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        case .denied:
            print("접근 불허")
        @unknown default:
            fatalError()
        }
        
        self.photoAlbums.enumerateObjects({(collection, index, object) in
            self.fetchResult.append(collection)
        })
        
        self.smartAlbums.enumerateObjects({(collection, index, object) in
            self.fetchResult.append(collection)
        })
        
        print(fetchResult.count)
        

        
//        let albumsPhoto:PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
////
//        print(albumsPhoto.count)
//
//        albumsPhoto.enumerateObjects({(collection, index, object) in
//            let photoInAlbum = PHAsset.fetchAssets(in: collection, options: nil)
//                print(photoInAlbum.count)
//                print(collection.localizedTitle)
//
//        })
    }
    
    //카메라 롤에 있는 사진을 가져오기 위한 함수
    func requestCollection() {
        //cameraRoll 컬렉션을 가져옴
//        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
//
////        guard let cameraRollCollection = cameraRoll.firstObject else {
////            return
////        }
//
//        let fetchOptions = PHFetchOptions()
//        // 최신 순 정렬
//        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        // 결과를 fetchResult에 저장.
//        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
        
        //cameraRoll 컬렉션을 가져옴
//        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
//
////        guard let cameraRollCollection = cameraRoll.firstObject else {
////            return
////        }
//
////        let fetchOptions = PHFetchOptions()
////        // 최신 순 정렬
////        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
////        // 결과를 fetchResult에 저장.
//
//
//        self.fetchResult = cameraRoll
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //앨범의 개수 반환
        return self.fetchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : AlbumCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as! AlbumCollectionViewCell

        let asset : PHAssetCollection = fetchResult[indexPath.item]
        let firstImg : PHFetchResult<PHAsset> = PHAsset.fetchAssets(in: asset, options: nil)
        let img : PHAsset = firstImg.object(at: 0)
//        let asset : PHAssetCollection = photoAlbums.object(at: indexPath.item)
//        let asset : PHAssetCollection = fetchResult.object(at: indexPath.item)
//        let firstImg : PHFetchResult<PHAsset> = PHAsset.fetchAssets(in: asset, options: nil)
//        let img : PHAsset = firstImg.object(at: indexPath.item)
        
//
//        imageManager.requestImage(for: asset,
//                                  targetSize: CGSize(),
//                                 contentMode: .aspectFill,
//                                 options: nil,
//                                 resultHandler: { image, _ in cell.represetationImageView.image = image})
        
//        cell.albumTitleLabel.text = asset.localizedTitle
//        cell.numofPhotosLabel.text = String(asset.estimatedAssetCount)
        imageManager.requestImage(for: img,
                                  targetSize: CGSize(),
                                  contentMode: .aspectFill,
                                  options: nil,
                                  resultHandler: {image, _ in cell.represetationImageView?.image = image})
//
        cell.albumTitleLabel.text = asset.localizedTitle
        cell.numofPhotosLabel.text = String(asset.estimatedAssetCount)
//        cell.represetationImageView.image = UIImage(named: "apple")
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: SecondViewController = segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: AlbumCollectionViewCell = sender as? AlbumCollectionViewCell else {
            return
        }
        
        nextViewController.albumTitles = cell.albumTitleLabel.text
    }


}

