//
//  PhotosProtocols.swift
//  Albums
//
//  Created Zibra Coders on 05/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//
//  Template generated by Zibra Co.

import Foundation

protocol PhotosViewProtocol: class {
    var presenter: PhotosPresenterProtocol?  { get set }
    func showError(_ error: String)
    func showPhotos()
}

protocol PhotosPresenterProtocol: class {
    var selectedAlbum: Int? { get set }
    var list: [Photo]? { get set }
    func getPhotos()
    func onSuccessRequest(_ photos: [Photo])
    func onFailureRequest( _ error: String)
}

protocol PhotosInteractorProtocol: class {
    var presenter: PhotosPresenterProtocol?  { get set }
    func fetch(with id: Int)
}

protocol PhotosRouterProtocol: class {
}
