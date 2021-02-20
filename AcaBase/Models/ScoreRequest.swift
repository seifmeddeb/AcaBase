//
//  ScoreRequest.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/20/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct ScoreRequest : Codable {
    var quizId : Int
    var validAnswers : Int
    
    enum CodingKeys: String, CodingKey {
        case quizId = "quiz_id"
        case validAnswers = "valid_answers"
    }
}
