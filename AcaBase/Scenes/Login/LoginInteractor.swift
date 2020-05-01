//
//  LoginInteractor.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/1/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
    func doSomething(request: Login.User.Request)
    func loginUser(request: Login.User.Request)
}

protocol LoginDataStore
{
    //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: Login.User.Request)
    {
        worker = LoginWorker()
        worker?.doSomeWork()
        
        let response = Login.User.Response()
        presenter?.presentSomething(response: response)
    }
    
    func loginUser(request: Login.User.Request) {
        worker = LoginWorker()
        worker?.doSomeWork()
        
        let response = Login.User.Response()
        presenter?.presentSomething(response: response)
    }
}
