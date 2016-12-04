//
//  PhotoListViewController.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

private extension Selector {
    static let didLoadPhotos = #selector(PhotoListViewController.didLoadPhotos)
}

final class PhotoListViewController: UIViewController {

    @IBOutlet weak var photoListCollectionView: UICollectionView!
    var presenter: PhotoListPresenter?
    var photoListDataSource = PhotoListCollectionView()
    var photos: [Photo] = []
    
    //MARK:- Method Level1
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPhotos()
    }

    //データの読み込み完了
    func didLoadPhotos(notification: Notification) {
        
        photos = PhotosLoadEvent.parse(userInfo: notification.userInfo) as! [Photo]
        photoListDataSource.modify(photos: photos)
        photoListCollectionView.reloadData()
    }

    //MARK:- Private Method Level2
    fileprivate func setup() {
        setupPhotoListView()
        setupPresenter()
        addCallBackEvent()
    }

    fileprivate func loadPhotos() {
        presenter?.loadPhotos()
    }

    fileprivate func didShowDetail(indexPath: IndexPath) {
        presenter?.showDetail(photo: photos[indexPath.row], topOf: self)
    }

    //MARK:- Private Method Level3
    fileprivate func setupPhotoListView() {
        photoListCollectionView.dataSource = photoListDataSource
        photoListCollectionView.delegate = self
    }

    fileprivate func setupPresenter() {
        presenter = PhotoListPresenter(usecase: PhotoListUsecaseImpl())
    }

    fileprivate func addCallBackEvent() {
        PhotosLoadEvent.add(self, Selector.didLoadPhotos)
    }
}

//MARK:- UICollectionViewDelegate
extension PhotoListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didShowDetail(indexPath: indexPath)
    }
}

