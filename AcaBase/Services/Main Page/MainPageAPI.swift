//
//  MainPageAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class MainPageAPI : MainPageStoreProtocol {
    
    func fetchTrainers(completionHandler: @escaping (() throws -> [TutorDAO]) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserDefaults.standard.string(forKey: "token")!)])
        
        AF.request(trainersUrl,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: [TutorDAO].self) { response in
                
                guard let trainersList = response.value else {
                    print("fetchTrainers: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return trainersList}
                
        }
    }
    
    func fetchTopics(completionHandler: @escaping (() throws -> [TopicDAO]) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserDefaults.standard.string(forKey: "token")!)])
        AF.request(topicsUrl,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: [TopicDAO].self) { response in
                
                guard let topicsList = response.value else {
                    print("fetchTopics: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return topicsList}
        }
    }
    
    func fetchHomeQuiz(completionHandler: @escaping (() throws -> [QuizDAO]) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserDefaults.standard.string(forKey: "token")!)])
        AF.request(homeQuizUrl,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: [QuizDAO].self) { response in
                
                guard let quizsList = response.value else {
                    print("fetchTopics: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return quizsList}
        }
    }
    
    func getHomeVideos(completionHandler: @escaping (() throws -> [VideoDAO]) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserDefaults.standard.string(forKey: "token")!)])
        AF.request(videosUrl,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: [VideoDAO].self) { response in
                
                guard let videosList = response.value else {
                    print("fetchVideos: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return videosList}
        }
    }
    
}
