//
//  QuizDetailsModels.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/27/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

// MARK: Alias
typealias QuestionsAlias = QuizDetails.Question.ViewModel.QuestionsViewModel
typealias QuestionItemAlias = QuizDetails.Question.ViewModel.QuestionsViewModel.QuestionItem
typealias OptionItemAlias = QuizDetails.Question.ViewModel.QuestionsViewModel.OptionItem

enum QuizDetails
{
    // MARK: Use cases
    
    enum Question
    {
        struct Request
        {
            var currentQuestion : Int?
            var isNext : Bool?
        }
        struct Response
        {
            var questions: [QuestionDAO]
            var quiz: QuizDAO?
            var currentQuestion : Int
            var displayAnswer = false
            var displayWrong = false
        }
        struct ViewModel
        {
            struct QuestionsViewModel {
                struct QuestionItem {
                    var title : String
                    var desc : String
                    var imageUrl : URL?
                    var state : QuestionState?
                }
                struct OptionItem {
                    var model : OptionDAO
                    var title : String
                    var desc : String
                    var imageUrl : URL?
                    var state : QuestionState?
                    var isTrue : Bool
                }
                var model : QuestionDAO
                var state : QuestionState
                var questionDetails = [QuestionDetailsType]()
                
            }
            var questions = [QuestionsAlias]()
            var currentQuestion = 0
            var displayAnswer = false
            var displayWrong = false
            var quizTitle : String
        }
    }
    
    enum QuestionUpdate
    {
        struct Request
        {
            var option : OptionDAO
            var question : QuestionDAO
            var currentQuestion : Int
        }
        struct Response
        {
            var questions: [QuestionDAO]
            var quiz: QuizDAO?
        }
        struct ViewModel
        {
            var questions = [QuestionsAlias]()
            var currentQuestion = 0
        }
    }
    
    enum Score {
        struct Request
        {
        }
        struct Response
        {
            var correctAnswers : Int
            var questions : [QuestionDAO]
        }
        struct ViewModel
        {
            var correctAnswers : Int
            var scoreStr : String
        }
    }
}

enum QuestionState {
    case Wrong
    case Correct
    case Undefined
    
    var isAnswered : Bool {
        switch self {
        case .Wrong,.Correct:
            return true
        default:
            return false
        }
    }
    
    var color : UIColor {
        switch self {
        case .Wrong:
            return primaryRed
        case .Correct:
            return primaryGreen
        default:
            return lightGrey
        }
    }
}

enum QuestionDetailsType {
    case question(QuestionItemAlias)
    case answer(QuestionItemAlias)
    case option(OptionItemAlias)
    
    var isAnswered : Bool {
        switch self {
        case .answer(let item):
            return item.state?.isAnswered ?? false
        default:
            return false
        }
    }
    
    mutating func setCorrect() {
        
        switch self {
        case let .question(item):
            let newItem = QuestionItemAlias(title: item.title, desc: item.desc, imageUrl: item.imageUrl, state: .Correct)
            self = .question(newItem)
        case let .answer(item):
            let newItem = QuestionItemAlias(title: item.title, desc: item.desc, imageUrl: item.imageUrl, state: .Correct)
            self = .answer(newItem)
        case let .option(item):
            let newItem = OptionItemAlias(model: item.model, title: item.title, desc: item.desc, imageUrl: item.imageUrl, state: .Correct, isTrue: item.isTrue)
            self = .option(newItem)
        }
    }
    
    mutating func setWrong() {
        
        switch self {
        case let .question(item):
            let newItem = QuestionItemAlias(title: item.title, desc: item.desc, imageUrl: item.imageUrl, state: .Wrong)
            self = .question(newItem)
        case let .answer(item):
            let newItem = QuestionItemAlias(title: item.title, desc: item.desc, imageUrl: item.imageUrl, state: .Wrong)
            self = .answer(newItem)
        case let .option(item):
            let newItem = OptionItemAlias(model: item.model, title: item.title, desc: item.desc, imageUrl: item.imageUrl, state: .Wrong, isTrue: item.isTrue)
            self = .option(newItem)
        }
    }
    
}