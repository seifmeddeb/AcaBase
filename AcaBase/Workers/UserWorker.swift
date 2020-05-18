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
    
    
    // MARK: Login
    func fetchAllUsers(completionHandler: @escaping ([UserDAO]?) -> Void) {
        
    }
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (UserDAO?) -> Void) {
        self.usersStore.fetchUserForLogin(email: email) { (user: () throws -> UserDAO?) -> Void in
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
    
    func loginUser(loginRequest: Login.User.Request, completionHandler: @escaping (UserDAO?) -> Void) {
        self.usersStore.loginUser(userRequest: loginRequest) { (loggedInUser: () throws -> UserDAO) -> Void in
            do {
                let user = try loggedInUser()
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
    // MARK: Subscribe
    func subscribeUser(subscribeRequest: Subscribe.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void) {
        self.usersStore.subscribeUser(userToCreate: subscribeRequest) { (createdUser: () throws -> UserDAO) in
            do {
                let user = try createdUser()
                DispatchQueue.main.async {
                    completionHandler{ return user }
                }
            } catch {
                DispatchQueue.main.async {
                  completionHandler{ throw error }
                }
            }
        }
    }
    
}

protocol UsersStoreProtocol {
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (() throws -> UserDAO?) -> Void)
    func subscribeUser(userToCreate: Subscribe.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void)
    func fetchAllUsers(completionHandler: @escaping ([UserDAO]?) -> Void)
    func loginUser(userRequest: Login.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void)
    
}
