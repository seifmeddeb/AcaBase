//
//  ChapterDetailsAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/20/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class ChapterDetailsAPI : ChapterDetailsStoreProtocol {
    
    func getChapterDetails(chapterId:Int, completionHandler: @escaping (() throws -> ChapterDAO) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.request(getChapterDetailsUrl(chapterId),
                   method: .get,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: ChapterDAO.self) { response in
                
                guard let chapterResponse = response.value else {
                    print("Ask Question Error: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return chapterResponse}
                
        }
    }
}
