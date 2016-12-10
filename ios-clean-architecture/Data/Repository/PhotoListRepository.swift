//
//  PhotoListRepository.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol PhotoListRepositoryLoadable {
    var output: PhotoListOutput? { set get }
    func loadData()
}

protocol PhotoListOutput {
    func done(_: [Photo])
    func noData()
    func failure()
}

final class PhotoListRepository: PhotoListRepositoryLoadable {
    
    var output: PhotoListOutput?
    
    func loadData() {
        
        let photos = PhotoDataSource.plist()
        
        if photos.count == 0 {
            output?.noData()
            return
        }        
        output?.done(photos)
    }
}
