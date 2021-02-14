//
//  LessonPresenter.swift
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

protocol LessonPresentationLogic
{
    func presentChapter(response: Lesson.Chapter.Response)
    func presentQuizs(response: Lesson.Quizs.Response)
    func presentVideos(response: Lesson.Videos.Response)
}

class LessonPresenter: LessonPresentationLogic
{
    weak var viewController: LessonDisplayLogic?
    
    // MARK: presentChapter
    func presentChapter(response: Lesson.Chapter.Response) {
        let viewModel = Lesson.Chapter.ViewModel(title: response.title ?? "chapitre sans titre", description: response.description ?? "chapitre sans description")
        viewController?.displayChapter(viewModel: viewModel)
    }
    
    // MARK: presentVideos
    func presentVideos(response: Lesson.Videos.Response)
    {
        var videosViewModel = [Lesson.CellType]()
        for video in response.videoList {
            var videoItem = VideoAlias()
            videoItem.title = video.title ?? "Video sans titre"
            videoItem.provider = video.provider ?? "Video sans tuteur"
            videoItem.views = video.views ?? "100"
            videoItem.time = video.time ?? "il y a 1 min"
            videoItem.url = URL(string: video.url ?? "")
            videosViewModel.append(Lesson.CellType.video(videoItem))
        }
        let viewModel = Lesson.Videos.ViewModel(videoList: videosViewModel)
        viewController?.displayVideos(viewModel: viewModel)
    }
    
    
    // MARK: presentQuizs
    func presentQuizs(response: Lesson.Quizs.Response)
    {
        
        var quizsViewModel = [Lesson.CellType]()
        for quiz in response.quizList {
            let quizItem = QuizAlias(model: quiz, progress: 50.0)
            quizsViewModel.append(Lesson.CellType.quiz(quizItem))
        }
        let viewModel = Lesson.Quizs.ViewModel(quizList: quizsViewModel)
        viewController?.displayQuizs(viewModel: viewModel)
    }
}
