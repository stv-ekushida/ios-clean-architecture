//
//  PhotoListPresenter.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/01.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoListPresenter: NSObject {

    var usecase: PhotoListUsecase?

    init(usecase: PhotoListUsecase) {
        super.init()
        self.usecase = usecase
    }

    func loadPhotos() {
        usecase?.loadData()
    }

    func pushDetailScene(photo: Photo, topOf: UIViewController) {

        let vc = createPhotoDetailViewControllerWithPhoto(photo: photo)
        topOf.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PhotoListPresenter: ViewControllerFactory {

    func createPhotoDetailViewControllerWithPhoto(photo: Photo) -> PhotoDetailViewController {
        
 
        let vc = UIStoryboard.getViewController(storyboardName: "PhotoDetail",
                                              identifier: PhotoDetailViewController.identifier) as! PhotoDetailViewController
        vc.photo = photo
        return vc
    }
}
