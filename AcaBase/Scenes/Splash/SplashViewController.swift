//
//  SplashViewController.swift
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

protocol SplashDisplayLogic: class
{
  func displaySomething(viewModel: Splash.Something.ViewModel)
}

class SplashViewController: UIViewController, SplashDisplayLogic
{
  var interactor: SplashBusinessLogic?
  var router: (NSObjectProtocol & SplashRoutingLogic & SplashDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = SplashInteractor()
    let presenter = SplashPresenter()
    let router = SplashRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Splash.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Splash.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
