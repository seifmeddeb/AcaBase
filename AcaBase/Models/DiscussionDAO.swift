//
//  Discussion.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/6/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct DiscussionDAO : Codable {
    var objectId : String
    var closed : Bool?
    var lastMessage : String?
    var lastUpdate : Int?
    var messages : [MessageDAO?]?
    
    var seenByStudent : Bool?
    var seenByTrainer : Bool?
    var started : Bool?
    var studentId : String?
    var subject : String?
    var trainerId : Int?
    var favorite : Bool?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case closed = "closed"
        case lastMessage = "lastMessage"
        case lastUpdate = "lastUpdate"
        case messages = "messages"
        
        case seenByStudent = "seenByStudent"
        case seenByTrainer = "seenByTrainer"
        case started = "started"
        case studentId = "studentId"
        case subject = "subject"
        case trainerId = "trainerId"
        case favorite = "favorite"
    }
}
