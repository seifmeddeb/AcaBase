//
//  QuizAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/20/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class QuizAPI : QuizStoreProtocol {
    
    func saveScore(quizScore: ScoreRequest, completionHandler: @escaping (() throws -> Void) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.request(quizScoreUrl,
                   method: .post,
                   parameters: quizScore,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate(statusCode:200..<300)
            .response{ response in
                
                guard let _ = response.value else {
                    print("Save Score Error: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{}
        }
    }
}
