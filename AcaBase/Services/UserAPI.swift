//
//  UserAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/2/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class UserAPI : UsersStoreProtocol {
    
    
    func fetchAllUsers(completionHandler: @escaping ([UserDAO]?) -> Void) {
        
    }
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (() throws -> UserDAO?) -> Void) {
        
    }
    
    // Register API call
    func subscribeUser(userToCreate: Subscribe.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void) {
        AF.request("http://vps800310.ovh.net/api/register",
                   method: .post,
                   parameters: userToCreate,
                   encoder: JSONParameterEncoder.default)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                
                switch response.result {
                case .success:
                    if response.response!.statusCode == 200 {
                        do {
                            let user = try JSONDecoder().decode(UserDAO.self, from: response.data!)
                            completionHandler{ return user }
                        } catch {
                            completionHandler{ throw UserAPIError.CannotSubscribe(error.localizedDescription) }
                        }
                    }
                case .failure:
                    if response.response!.statusCode == 401 {
                        do {
                            let error = try JSONDecoder().decode(UserAPIError.Subscribe.self, from: response.data!)
                            completionHandler{ throw error }
                        } catch {
                            completionHandler{ throw UserAPIError.CannotGetSubscribeError(error.localizedDescription) }
                            
                        }
                    }
                }
        }
        
    }
    
    // login_check API call
    func loginUser(userRequest: Login.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void) {
        AF.request("http://vps800310.ovh.net/api/login_check",
                   method: .post,
                   parameters: userRequest,
                   encoder: JSONParameterEncoder.default)
            .validate(statusCode:200..<300)
            .responseDecodable(of: UserDAO.self) { response in
                
                guard let userResponse = response.value else {
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return userResponse}
                
        }
    }
}
enum UserAPIError : Error {
    struct Subscribe : Error, Codable {
        var status : String
        var message : String
    }
    case CannotSubscribe(String)
    case CannotGetSubscribeError(String)
}
