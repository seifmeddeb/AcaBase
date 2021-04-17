//
//  MessageDAO.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/6/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct MessageDAO : Codable {
    var askId : Int?
    var body : String?
    var from : Int?
    var to : Int?
    var seen : Bool?
    var timestamp : Int?
    var attachement : AttachementDAO?
    
    enum CodingKeys: String, CodingKey {
        case askId = "askId"
        case body = "body"
        case from = "from"
        case to = "to"
        
        case seen = "seen"
        case timestamp = "timestamp"
        case attachement = "attachement"
    }
}
