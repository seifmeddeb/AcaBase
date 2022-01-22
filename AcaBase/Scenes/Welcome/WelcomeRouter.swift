//
//  WelcomeRouter.swift
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

@objc protocol WelcomeRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol WelcomeDataPassing
{
  var dataStore: WelcomeDataStore? { get }
}

class WelcomeRouter: NSObject, WelcomeRoutingLogic, WelcomeDataPassing
{
  weak var viewController: WelcomeViewController?
  var dataStore: WelcomeDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: WelcomeViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: WelcomeDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}