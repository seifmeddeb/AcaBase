//
//  Ask.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/20/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct AskRequest : Codable {
    var title : String
    var subject : Int
    var trainerId : Int
    var description : String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case subject = "subject"
        case trainerId = "trainer_id"
        case description = "description"
    }
}

struct AskResponse : Codable {
    var code : Int
    var message : String
    var questionId : Int
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
        case questionId = "question_id"
    }
}
