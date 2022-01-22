//
//  WelcomePresenter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 26/9/2021.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol WelcomePresentationLogic
{
  func presentSomething(response: Welcome.Something.Response)
}

class WelcomePresenter: WelcomePresentationLogic
{
  weak var viewController: WelcomeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Welcome.Something.Response)
  {
    let viewModel = Welcome.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}