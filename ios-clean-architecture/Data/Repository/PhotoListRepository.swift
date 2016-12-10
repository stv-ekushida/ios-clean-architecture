//
//  PhotoListRepository.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol PhotoListRepositoryLoadable {
    var delegate: PhotoListLoading? { set get }
    func photos()
}

protocol PhotoListLoading {
    func done(_: [Photo])
    func noData()
    func failure()
}

final class PhotoListRepository: PhotoListRepositoryLoadable {
    
    var delegate: PhotoListLoading?
    
    func photos() {
        
        let photos = PhotoDataSource.plist()
        
        if photos.count == 0 {
            delegate?.noData()
            return
        }        
        delegate?.done(photos)
    }
}
