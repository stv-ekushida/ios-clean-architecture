//
//  PhotoUsecase.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol PhotoListUsecaseLoadable {
    func photos()
}

final class PhotoListUsecase: PhotoListUsecaseLoadable {

    var photoRepository: PhotoListRepositoryLoadable?
    
    init(repository: PhotoListRepositoryLoadable) {
        photoRepository = repository
        photoRepository?.delegate = self
    }
        
    /// 写真データを読み出す
    func photos() {
        photoRepository?.photos()
    }
}

//MARK:- PhotoListLoading
extension PhotoListUsecase: PhotoListLoading {
    
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
