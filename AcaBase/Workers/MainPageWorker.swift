//
//  MainPageWorker.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

class MainPageWorker {
    
    var mainPageStore : MainPageStoreProtocol
    
    init(mainPageStore: MainPageStoreProtocol)
    {
      self.mainPageStore = mainPageStore
    }
}

protocol MainPageStoreProtocol {
    
    func fetchTrainers(completionHandler: @escaping (() throws -> [TrainerDAO]) -> Void)
//    func subscribeUser(userToCreate: Subscribe.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void)
//    func fetchAllUsers(completionHandler: @escaping ([UserDAO]?) -> Void)
//    func loginUser(userRequest: Login.User.Request, completionHandler: @escaping (() throws -> UserDAO) -> Void)
//    func ResetPassword(for request: Login.ResetPassword.Request, completionHandler: @escaping (() throws -> APIResponse) -> Void)
    
}
