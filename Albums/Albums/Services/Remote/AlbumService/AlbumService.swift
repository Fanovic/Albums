//
//  AlbumService.swift
//  Albums
//
//  Created by Zibra Coders on 04/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class AlbumService {
    
    class func fetch()-> Promise<Array<Album>>  {
        return Promise { seal in
            let url = "https://jsonplaceholder.typicode.com/albums"
            AF.request(url).responseDecodable(of: Array<Album>.self) { (response) in
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
