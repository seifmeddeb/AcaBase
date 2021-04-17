//
//  OfferDAO.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/10/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct OfferDAO : Codable {
    
    var objectId: Int
    var title: String
    var weight: Int
    var isActive: Bool
    var isUnlimited: Bool
    var nbrSessions: Int?
    var isSpecial: Bool
    var duration: String
    var desc: String
    var image: String
    var access: [String]?
    var isPromo : Bool
    var percentagePromo : Int?
    
    var oldPrice : Int?
    var newPrice : String
    
    enum CodingKeys: String, CodingKey {
        case objectId = "packId"
        case title = "packLabel"
        case weight = "packWeight"
        case isActive = "packIsActive"
        case isUnlimited = "packIsUnlimited"
        case nbrSessions = "packNumberSessions"
        case isSpecial = "packIsSpecial"
        case duration = "packDuration"
        case desc = "packDescription"
        case image = "packImage"
        case access = "packAccess"
        
        case isPromo = "packIsPromo"
        case percentagePromo = "packPercentagePromo"
        
        case oldPrice = "packOldPrice"
        case newPrice = "packNewPrice"
    }
    
}
