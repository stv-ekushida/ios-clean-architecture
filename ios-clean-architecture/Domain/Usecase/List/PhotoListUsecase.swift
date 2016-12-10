//
//  PhotoUsecase.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol PhotoListUsecaseLoadable {
    func loadData()
}

final class PhotoListUsecase: PhotoListUsecaseLoadable {

    var photoRepository: PhotoListRepositoryLoadable?
    
    init(repository: PhotoListRepositoryLoadable) {
        photoRepository = repository
        photoRepository?.output = self
    }
        
    /// 写真データを読み出す
    func loadData() {
        photoRepository?.loadData()
    }
}

//MARK:- PhotoListOutput
extension PhotoListUsecase: PhotoListOutput {
    
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
