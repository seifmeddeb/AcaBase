//
//  ShopAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/10/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class ShopAPI : ShopStoreProtocol {
    
    func fetchOffersList(completionHandler: @escaping (() throws -> [OfferDAO]) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        print(UserManager.shared.token!)
        AF.request(shopUrl,
                   method: .get,
                   parameters: nil,
                   headers: headers)
            .validate(statusCode:200..<300)
            .responseDecodable(of: [OfferDAO].self) { response in
                
                guard let topicsList = response.value else {
                    print("fetchOffers: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return topicsList}
        }
    }
}
