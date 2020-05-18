//
//  UserCoreDataStore.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/1/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import CoreData

class UserCoreDataStore : UsersStoreProtocol {
    
    lazy var moc = {
        CoreDataStore.persistentContainer.viewContext
    }()
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (() throws -> UserDAO?) -> Void) {
        moc.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedUser")
                fetchRequest.predicate = NSPredicate(format: "email == %@", email)
                let users = try self.moc.fetch(fetchRequest) as! [UserDAO]
                completionHandler { return users.last }
            } catch {
                completionHandler { throw UsersStoreError.CannotFetch("Cannot fetch orders") }
            }
        }
    }
    
    func fetchAllUsers(completionHandler: @escaping ([UserDAO]?) -> Void) {
        
    }
    
    func createUser(userToCreate: UserDAO, completionHandler: @escaping (() throws -> UserDAO?) -> Void) {
        moc.perform {
            do {
                let managedUser = NSEntityDescription.insertNewObject(forEntityName: "ManagedUser", into: self.moc) as! ManagedUser
                managedUser.email = userToCreate.currentUser.email
                managedUser.lastName = userToCreate.currentUser.lastName
                managedUser.firstName = userToCreate.currentUser.firstName
                managedUser.phone = userToCreate.currentUser.phone
                try self.moc.save()
                completionHandler { return userToCreate }
            } catch {
                completionHandler { throw UsersStoreError.CannotCreate("Cannot Create user") }
            }
        }
    }
    
    enum UsersStoreError : Error {
        case CannotFetch(String)
        case CannotCreate(String)
    }
    
    // API functions not to be implemented
    func loginUser(userRequest: Login.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void) {
        
    }
    
    func subscribeUser(userToCreate: Subscribe.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void) {
        
    }
    
}
