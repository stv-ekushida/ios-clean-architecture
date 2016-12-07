//
//  ViewControllerFactory.swift
//  ios-clean-architecture
//
//  Created by Kushida　Eiji on 2016/12/08.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

protocol ViewControllerFactory {
    func createPhotoDetailViewControllerWithPhoto(photo: Photo) -> PhotoDetailViewController
}
