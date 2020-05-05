//
//  Photo.swift
//  Albums
//
//  Created by Zibra Coders on 05/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//

import Foundation

/**
 "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
 */
struct Photo: Codable {
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, url, thumbnailUrl
    }
}
