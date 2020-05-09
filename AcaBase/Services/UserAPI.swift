//
//  UserAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/2/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

class UserAPI : UsersStoreProtocol {
    func fetchAllUsers(completionHandler: @escaping ([UserDao]?) -> Void) {
        
    }
 
    func fetchUserForLogin(email: String, completionHandler: @escaping (() throws -> UserDao?) -> Void) {
        
    }
    
    func createUser(userToCreate: UserDao, completionHandler: @escaping (() throws -> UserDao?) -> Void) {
        
    }
    
    
}
