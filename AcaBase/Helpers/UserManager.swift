//
//  UserManager.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/15/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

class UserManager {
    
    // MARK: - Properties
    
    static let shared = UserManager()
    
    private init() {}
    
    private let K_CURRENT_USER = "Logged_User"
    private let K_TOKEN = "token"
    
    
    
    private var user : UserDAO? {
        if let data = UserDefaults.standard.object(forKey: K_CURRENT_USER) {
            do {
                let userData = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [UserDAO.self,CurrentUser.self,Level.self,Statistics.self], from: data as! Data)
                if let user = userData as? UserDAO {
                    return user
                } else {
                    return  nil
                }
            } catch {
                print(error)
            }
        }
        return  nil
    }
    
    var currentUser : CurrentUser? {
        if let user = user {
            return user.currentUser
        } else {
            return  nil
        }
    }
    
    var token : String? {
        return user?.accessToken
    }
    
    
    
    func cacheCurrentUser(user: UserDAO) {
        if let encodedUser: Data = try? NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: true) {
            UserDefaults.standard.set(encodedUser, forKey: K_CURRENT_USER)
            UserDefaults.standard.synchronize()
        }
    }
    
    func uncacheCurrentUser() {
        UserDefaults.standard.removeObject(forKey: K_CURRENT_USER)
        UserDefaults.standard.synchronize()
    }
}
