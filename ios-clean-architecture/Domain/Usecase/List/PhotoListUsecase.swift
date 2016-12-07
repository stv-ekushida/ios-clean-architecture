//
//  PhotoUsecase.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol PhotoListUsecase {
    func loadData()
}

final class PhotoListUsecaseImpl: PhotoListUsecase {

    var photoRepository: PhotoRepositoryImpl?
    
    init() {
        photoRepository = PhotoRepositoryImpl(delegate: self)
    }

    /// 写真データを読み出す
    func loadData() {
        photoRepository?.loadData()
    }
}

//MARK:- PhotoListDataDelegate
extension PhotoListUsecaseImpl: PhotoListDataOutput {
    
    func done(_ photos: [Photo]) {
        PhotoListDidLoadEvent.post(items: photos)
    }
    
    func noData() {
        //Do Somethig
    }
    
    func failure() {
        //Do Somethig        
    }
}
