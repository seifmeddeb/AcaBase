//
//  SubscribePresenter.swift
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

protocol SubscribePresentationLogic
{
  func presentSomething(response: Subscribe.Something.Response)
}

class SubscribePresenter: SubscribePresentationLogic
{
  weak var viewController: SubscribeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Subscribe.Something.Response)
  {
    let viewModel = Subscribe.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}