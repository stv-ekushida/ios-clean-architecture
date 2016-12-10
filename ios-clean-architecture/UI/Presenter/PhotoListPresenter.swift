//
//  PhotoListPresenter.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoListPresenter: NSObject {

    var usecase: PhotoListUsecaseLoadable?

    init(usecase: PhotoListUsecaseLoadable) {
        super.init()
        self.usecase = usecase
    }

    func photos() {
        usecase?.photos()
    }

    func pushDetailScene(photo: Photo, topOf: UIViewController) {

        let vc = makePhotoDetailViewControllerWithPhoto(photo: photo)
        topOf.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PhotoListPresenter: ViewControllerFactory {

    func makePhotoDetailViewControllerWithPhoto(photo: Photo) -> PhotoDetailViewController {
        
 
        let vc = UIStoryboard.getViewController(storyboardName: "PhotoDetail",
                                              identifier: PhotoDetailViewController.identifier) as! PhotoDetailViewController
        vc.photo = photo
        return vc
    }
}
