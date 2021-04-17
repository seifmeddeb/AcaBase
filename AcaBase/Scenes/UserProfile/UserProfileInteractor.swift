//
//  UserProfileInteractor.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/17/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UserProfileBusinessLogic
{
  func doSomething(request: UserProfile.Something.Request)
}

protocol UserProfileDataStore
{
  //var name: String { get set }
}

class UserProfileInteractor: UserProfileBusinessLogic, UserProfileDataStore
{
  var presenter: UserProfilePresentationLogic?
  var worker: UserProfileWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: UserProfile.Something.Request)
  {
    worker = UserProfileWorker()
    worker?.doSomeWork()
    
    let response = UserProfile.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
