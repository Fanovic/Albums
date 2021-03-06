//
//  PhotosModule.swift
//  Albums
//
//  Created Zibra Coders on 05/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//
//  Template generated by Zibra Co.

import UIKit

class PhotosModule {

    static func build(selected album: Int) -> UIViewController {
        let view = PhotListViewController()
        let presenter = PhotosPresenter()
        let interactor = PhotosInteractor()
        let router = PhotosRouter()

        presenter.view = view
        presenter.selectedAlbum = album
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }    
}
