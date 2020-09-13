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
    
    func fetchTrainers(completionHandler: @escaping (() throws -> [TrainerDAO]) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserDefaults.standard.string(forKey: "token")!)])
        
        AF.request(trainersUrl,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: [TrainerDAO].self) { response in
                
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
    
    
}
