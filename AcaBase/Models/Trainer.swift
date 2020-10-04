//
//  Trainer.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct TutorDAO : Codable {
    
    var objectId: Int
    var email: String
    var fullName: String
    var cv: String
    var answredQuestions: Int
    var rate: Int
    var reactivity: String?
    var picture: String?
    var isFav: Bool
    var followers: String?
    var inFavNbr: String?
    var subjects : [SubjectDAO]?
    var feedBacks : [FeedBackDAO]?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case email = "email"
        case fullName = "full_name"
        case cv = "cv"
        case rate = "rate"
        case followers = "followers"
        case picture = "picture"
        case reactivity = "reactivity"
        case answredQuestions = "answredQuestions"
        case inFavNbr = "inFavNbr"
        case isFav = "is_fav"
        
        case subjects = "subjects"
        case feedBacks = "feedBacks"
    }
    
}
