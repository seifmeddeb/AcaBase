//
//  RateTutorRequest.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/3/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct RateTutorRequest : Codable {
    var trainerId : Int
    var nbrStars : Int
    var message : String
    var questionId : Int
    
    enum CodingKeys: String, CodingKey {
        case trainerId = "trainerId"
        case nbrStars = "nbrStars"
        case message = "message"
        case questionId = "questionId"
    }
}
