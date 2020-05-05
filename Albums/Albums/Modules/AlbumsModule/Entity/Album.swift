//
//  Album.swift
//  Albums
//
//  Created by Zibra Coders on 04/05/2020.
//  Copyright © 2020 Fanovic. All rights reserved.
//

import Foundation

/**
 {
   "userId": 1,
   "id": 1,
   "title": "quidem molestiae enim"
 }
 */

struct Album: Codable {
    var userId: Int
    var id: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case userId, id, title
    }
}
