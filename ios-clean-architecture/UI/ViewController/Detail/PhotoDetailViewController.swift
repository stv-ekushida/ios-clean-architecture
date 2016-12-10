//
//  PhotoDetailViewController.swift
//  ios-clean-architecture
//
//  Created by Eiji Kushida on 2016/12/02.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

final class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var thumnailImageView: UIImageView!
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }

    var photo: Photo?
    var presenter: PhotoDetailPresenter?

    //MARK:- Method Level1
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK:- Private Method Level2
    fileprivate func setup() {
        setupPresenter()
        presenter?.configureThumnail(photo: photo)
    }

    //MARK:- Private Method Level3
    fileprivate func setupPresenter() {
        presenter = PhotoDetailPresenter(delegate: self)
    }
}

extension PhotoDetailViewController: PhotoDetailViewUpdateable {

    func updateThumnail(image: UIImage?) {
        thumnailImageView.image = image
    }
}
