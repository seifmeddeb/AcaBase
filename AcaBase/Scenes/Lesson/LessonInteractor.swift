//
//  LessonInteractor.swift
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

protocol LessonBusinessLogic
{
    func getChapter(request: Lesson.Chapter.Request)
    func getVideos(request: Lesson.Videos.Request)
    func getQuizs(request: Lesson.Quizs.Request)
}

protocol LessonDataStore
{
    var chapter : ChapterDAO? { get set }
}

class LessonInteractor: LessonBusinessLogic, LessonDataStore
{
    var presenter: LessonPresentationLogic?
    var worker: LessonWorker?
    var chapter : ChapterDAO?
    
    
    // MARK: getChapter
    func getChapter(request: Lesson.Chapter.Request) {
        if let chapter = chapter {
            let response = Lesson.Chapter.Response(title: chapter.title, description: chapter.desc)
            presenter?.presentChapter(response: response)
        }
    }
    
    // MARK: getVideos
    func getVideos(request: Lesson.Videos.Request)
    {
        worker = LessonWorker()
        var videosResponse = [VideoResponseAlias]()
        if let chapterUnwrapped = chapter {
            videosResponse = worker!.getVideos(for: chapterUnwrapped)
        }
        let response = Lesson.Videos.Response(videoList: videosResponse)
        presenter?.presentVideos(response: response)
    }
    
    // MARK: getQuizs
    func getQuizs(request: Lesson.Quizs.Request)
    {
        worker = LessonWorker()
        var quizsResponse = [QuizDAO]()
        if let chapterUnwrapped = chapter {
            quizsResponse = worker!.getQuizs(for: chapterUnwrapped)
        }
        let response = Lesson.Quizs.Response(quizList: quizsResponse)
        presenter?.presentQuizs(response: response)
    }
}
