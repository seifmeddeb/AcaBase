//
//  Favorite.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 1/24/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct FavoriteRequest : Codable {
    var trainerId : Int
    
    enum CodingKeys: String, CodingKey {
        case trainerId = "trainer_id"
    }
}

struct FavoriteResponse : Codable {
    var message : String?
    var nbrFav : String?
}

