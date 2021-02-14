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
    var videos : [VideoDAO]?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case desc = "description"
        case quizs = "quiz"
        case videos = "videos"
    }
    
}

struct VideoDAO : Codable {
    var objectId: Int
    var title: String?
    var videoUrl: String?
    var provider: String?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case videoUrl = "url"
        case provider = "provider"
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

struct QuestionDAO : Codable,Equatable {
    
    var objectId: Int
    var title: String?
    var answer: String?
    var questionImage: String?
    var answerImage: String?
    var options : [OptionDAO]?
    var state = QuestionState.Undefined
    
    enum CodingKeys: String, CodingKey {
        case objectId = "question_id"
        case title = "question_label"
        case answer = "question_answer_label"
        case questionImage = "question_image"
        case answerImage = "answer_image"
        case options = "question_options"
    }
    
    static func == (lhs: QuestionDAO, rhs: QuestionDAO) -> Bool {
        return lhs.objectId == rhs.objectId
    }
    
}

struct OptionDAO : Codable,Equatable {
    
    var objectId: Int
    var title: String?
    var isTrue: Bool
    var image: String?
    var state = QuestionState.Undefined
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case title = "label"
        case isTrue = "isTrue"
        case image = "image"
    }
    
    static func == (lhs: OptionDAO, rhs: OptionDAO) -> Bool {
        return lhs.objectId == rhs.objectId
    }
    
}
