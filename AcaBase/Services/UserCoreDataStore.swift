//
//  UserCoreDataStore.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/1/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import CoreData

class UserCoreDataStore : CoreDataStore, UsersStoreProtocol {
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (() throws -> User?) -> Void) {
        
    }
    
    func createUser(orderToCreate: User, completionHandler: @escaping (() throws -> User?) -> Void) {
        
    }
    
    
}
