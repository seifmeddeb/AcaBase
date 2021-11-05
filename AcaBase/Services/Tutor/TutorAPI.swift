//
//  TutorAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 1/24/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class TutorApi : TutorStoreProtocol {
    
    func addToFavorites(request: FavoriteRequest, completionHandler: @escaping (() throws -> FavoriteResponse) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.request(trainerAddFavUrl,
                   method: .post,
                   parameters: request,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: FavoriteResponse.self) { response in
                
                guard let favoriteResponse = response.value else {
                    print("fetchAddToFav: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return favoriteResponse}
                
        }
    }
    
    func removeFromFavorites(request: FavoriteRequest, completionHandler: @escaping (() throws -> FavoriteResponse) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.request(trainerRemoveFavUrl,
                   method: .post,
                   parameters: request,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: FavoriteResponse.self) { response in
                
                guard let favoriteResponse = response.value else {
                    print("fetchRemoveFromFav: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return favoriteResponse}
                
        }
    }
}
