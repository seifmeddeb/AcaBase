//
//  QuestionModels.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/28/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Question
{
    // MARK: Use cases
    
    enum ViewData
    {
        struct Request
        {
        }
        struct Response
        {
            var tutor : TutorDAO?
            var subjectList : [SubjectDAO]?
            var disableTutorSelection = false
        }
        struct ViewModel
        {
            var tutor : TutorViewModel?
            var subjectList = [SubjectDAO]()
            var disableTutorSelection : Bool
        }
    }
    enum FileData
    {
        struct Request
        {
            var url : URL
        }
        struct Response
        {
            var attachement : Attachement?
        }
        struct ViewModel
        {
            var attachement : Attachement?
            var errorMsg : String?
        }
    }
    
    enum FromQuiz
    {
        struct Request
        {
        }
        struct Response
        {
            var question : QuestionDAO
            var subject : TopicDAO
            var subjectList : [SubjectDAO]?
        }
        struct ViewModel
        {
            var title : String
            var subject : String
            var desc : String
            var subjectList = [SubjectDAO]()
        }
    }
    
    enum Ask
    {
        struct Request
        {
            var title : String
            var tutorId : Int?
            var subjectId : Int
            var description : String
            var images : [UIImage]
            var attachements : [Attachement]
        }
        struct Response
        {
            var questionId : Int
            var error : Error?
        }
        struct ViewModel
        {
            var questionId : Int
            var errorMessage : String?
        }
    }
    
}
