//
//  PhotoService.swift
//  Albums
//
//  Created by Zibra Coders on 05/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class PhotoService {
    class func fetch(with id: Int) -> Promise<Array<Photo>> {
        return Promise { seal in
            let url = "https://jsonplaceholder.typicode.com/photos?albumId=\(id)"
            AF.request(url).responseDecodable(of: Array<Photo>.self) { (response) in
                switch response.result {
                case .success(let list):
                    seal.fulfill(list)
                case .failure(let err):
                    print(err)
                    seal.reject(err)
                }

            }
        }
    }
}
