//
//  UserWorker.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/1/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation


class UserWorker {
    
    var usersStore: UsersStoreProtocol
    
    init(usersStore: UsersStoreProtocol)
    {
      self.usersStore = usersStore
    }
    
    func fetchAllUsers(completionHandler: @escaping ([UserDao]?) -> Void) {
        
    }
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (UserDao?) -> Void) {
        self.usersStore.fetchUserForLogin(email: email) { (user: () throws -> UserDao?) -> Void in
            do {
                let user = try user()
                DispatchQueue.main.async {
                  completionHandler(user)
                }
            } catch {
                DispatchQueue.main.async {
                  completionHandler(nil)
                }
            }
        }
    }
    
    func createUser() {
        
    }
}

protocol UsersStoreProtocol {
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (() throws -> UserDao?) -> Void)
    func createUser(userToCreate: UserDao, completionHandler: @escaping (() throws -> UserDao?) -> Void)
    func fetchAllUsers(completionHandler: @escaping ([UserDao]?) -> Void)
    
}
