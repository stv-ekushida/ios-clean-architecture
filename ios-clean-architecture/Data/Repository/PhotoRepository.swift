//
//  PhotoRepository.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol PhotoListLoading {
    func done(_: [Photo])
    func noData()
    func failure()
}

final class PhotoRepository: PhotoListLoadable {
    
    var delegate: PhotoListLoading?
    
    init(delegate: PhotoListLoading) {
        self.delegate = delegate
    }

    func loadData() {
        
        let photos = PhotoDataSource.plist()
        if photos.count == 0 {
            delegate?.noData()
            return
        }        
        delegate?.done(photos)
    }
}
