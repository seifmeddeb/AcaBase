//
//  LessonModels.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/21/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

typealias VideoAlias = Lesson.Videos.ViewModel.VideoViewModel
typealias QuizAlias = Lesson.Quizs.ViewModel.QuizViewModel
typealias VideoResponseAlias = Lesson.Videos.Response.VideoResponse

enum Lesson
{
    // MARK: Use cases
    
    enum Chapter
    {
        struct Request
        {
        }
        struct Response
        {
            var chapter : ChapterDAO
        }
        struct ViewModel
        {
            var title : String
            var description : String
            var totalNbrQuiz : Int
            var answeredUserQuiz : Int
        }
    }
    
    enum Videos
    {
        struct Request
        {
        }
        struct Response
        {
            struct VideoResponse
            {
                var title : String?
                var views : String?
                var url : String?
                var time : String?
                var provider : String?
            }
            
            var videoList = [Lesson.Videos.Response.VideoResponse]()
        }
        struct ViewModel
        {
            struct VideoViewModel
            {
                var title : String?
                var views : String?
                var url : URL?
                var time : String?
                var provider : String?
            }
            var videoList = [CellType]()
        }
    }
    
    enum Quizs
    {
        struct Request
        {
        }
        struct Response
        {
            var quizList = [QuizDAO]()
        }
        struct ViewModel
        {
            struct QuizViewModel
            {
                var model : QuizDAO
                var progress : Double
            }
            var quizList = [CellType]()
        }
    }
    
    enum CellType {
        case video(VideoAlias)
        case quiz(QuizAlias)
    }
}