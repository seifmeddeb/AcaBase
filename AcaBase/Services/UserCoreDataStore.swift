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
    
    func fetchUserForLogin(email: String, completionHandler: @escaping (() throws -> UserDao?) -> Void) {
        moc.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ManagedUser")
                fetchRequest.predicate = NSPredicate(format: "email == %@", email)
                let users = try self.moc.fetch(fetchRequest) as! [UserDao]
                completionHandler { return users.last }
            } catch {
                completionHandler { throw UsersStoreError.CannotFetch("Cannot fetch orders") }
            }
        }
    }
    
    func fetchAllUsers(completionHandler: @escaping ([UserDao]?) -> Void) {
        
    }
    
    func createUser(userToCreate: UserDao, completionHandler: @escaping (() throws -> UserDao?) -> Void) {
        moc.perform {
            do {
                var managedUser = NSEntityDescription.insertNewObject(forEntityName: "ManagedUser", into: self.moc) as! ManagedUser
                managedUser.email = userToCreate.email
                managedUser.lastName = userToCreate.lastName
                managedUser.firstName = userToCreate.firstName
                managedUser.phone = userToCreate.phone
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
    
}
