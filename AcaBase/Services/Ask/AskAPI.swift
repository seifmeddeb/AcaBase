//
//  AskAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/20/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class AskAPI : AskStoreProtocol {
    
    func askQuestion(request: AskRequest, completionHandler: @escaping (() throws -> AskResponse) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserDefaults.standard.string(forKey: "token")!)])
        
        AF.request(askUrl,
                   method: .post,
                   parameters: request,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: AskResponse.self) { response in
                
                guard let askResponse = response.value else {
                    print("Ask Question Error: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return askResponse}
                
        }
    }
}
