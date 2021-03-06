//
//  HomeInteractor.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 6/14/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic
{
    func getHomeTrainers(request: Home.Tutors.Request)
    func getHomeTopics(request: Home.Topics.Request)
    func getHomeQuizs(request: Home.Quizs.Request)
    func getHomeVideos(request: Home.Videos.Request)
}

protocol HomeDataStore
{
    var tutors: [TutorDAO]? { get set }
    var topics: [TopicDAO]? { get set }
    var quizs: [QuizDAO]? { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    var presenter: HomePresentationLogic?
    var workerApi = HomeWorker(mainPageStore: MainPageAPI())
    var tutors: [TutorDAO]?
    var topics: [TopicDAO]?
    var quizs: [QuizDAO]?
    
    // MARK: HomeBusinessLogic Stubs
    
    func getHomeTrainers(request: Home.Tutors.Request)
    {
        workerApi.getTutors { (tutors) in
            self.tutors = tutors
            let response = Home.Tutors.Response(tutors:tutors ?? [TutorDAO]() )
            self.presenter?.presentTrainers(response: response)
        }
    }
    
    func getHomeTopics(request: Home.Topics.Request) {
        workerApi.getTopics { topics in
            self.topics = topics
            let response = Home.Topics.Response(topics: topics )
            self.presenter?.presentTopics(response: response)
        }
    }
    
    func getHomeQuizs(request: Home.Quizs.Request) {
        workerApi.getHomeQuiz { quizs in
            self.quizs = quizs
            let response = Home.Quizs.Response(quizs: quizs )
            self.presenter?.presentQuizs(response: response)
        }
    }
    
    func getHomeVideos(request: Home.Videos.Request) {
        workerApi.getHomeVideos { videos in
            let videoResponseList = self.workerApi.getVideosResponse(for: videos)
            let response = Home.Videos.Response(videoList: videoResponseList)
            self.presenter?.presentHomeVideos(response: response)
        }
    }
}
