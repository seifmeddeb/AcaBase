//
//  MainPageWorker.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

class MainPageWorker {
    
    var mainPageStore : MainPageStoreProtocol
    
    init(mainPageStore: MainPageStoreProtocol)
    {
      self.mainPageStore = mainPageStore
    }
    
    func fetchTrainers(completionHandler: @escaping (() throws -> [TutorDAO]) -> Void){
        self.mainPageStore.fetchTrainers { (tutors: () throws -> [TutorDAO]) -> Void in
            completionHandler(tutors)
        }
    }
    
    func fetchTopics(completionHandler: @escaping (() throws -> [TopicDAO]) -> Void){
        self.mainPageStore.fetchTopics { (topics: () throws -> [TopicDAO]) -> Void in
            completionHandler(topics)
        }
    }
    
    func fetchHomeQuiz(completionHandler: @escaping (() throws -> [QuizDAO]) -> Void){
        self.mainPageStore.fetchHomeQuiz { (quizs: () throws -> [QuizDAO]) -> Void in
            completionHandler(quizs)
        }
    }
}
