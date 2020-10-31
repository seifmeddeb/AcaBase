//
//  Topic.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/13/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct TopicDAO : Codable {
    
    var objectId: Int
    var title: String?
    var icon: String?
    var modules : [ModuleDAO]?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case icon = "icon"
        case modules = "modules"
    }
    
}

struct ModuleDAO : Codable {
    
    var objectId: Int
    var title: String
    var chapters : [ChapterDAO]?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case chapters = "chapters"
    }
    
}

struct ChapterDAO : Codable {
    
    var objectId: Int
    var title: String?
    var desc: String?
    var quizs : [QuizDAO]?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case desc = "description"
        case quizs = "quiz"
    }
    
}

struct QuizDAO : Codable {
    
    var objectId: Int
    var title: String?
    var desc: String?
    var nbrQuestions: Int?
    var valideAnswers: Int?
    var questions : [QuestionDAO]?
    var subject : SubjectDAO?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case nbrQuestions = "nbrQuestions"
        case valideAnswers = "valide_answers"
        case desc = "description"
        case questions = "questions"
        case subject = "subject"
    }
    
}

struct QuestionDAO : Codable {
    
    var objectId: Int
    var title: String?
    var answer: String?
    var questionImage: String?
    var answerImage: String?
    var options : [OptionDAO]?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "question_id"
        case title = "question_label"
        case answer = "question_answer_label"
        case questionImage = "question_image"
        case answerImage = "answer_image"
        case options = "question_options"
    }
    
}

struct OptionDAO : Codable {
    
    var objectId: Int
    var title: String?
    var isTrue: Bool
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case isTrue = "isTrue"
        case image = "image"
    }
    
}
