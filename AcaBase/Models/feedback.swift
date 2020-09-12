//
//  feedback.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct FeedBackDAO : Codable {
    
    var objectId: Int
    var userName: String?
    var comment: String?
    var rate: Int
    var subject: String?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case subject = "subject"
        case userName = "user_name"
        case comment = "comment"
        case rate = "rate"

    }
    
}
