//
//  TutorListRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/3/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol TutorListRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol TutorListDataPassing
{
  var dataStore: TutorListDataStore? { get }
}

class TutorListRouter: NSObject, TutorListRoutingLogic, TutorListDataPassing
{
  weak var viewController: TutorListViewController?
  var dataStore: TutorListDataStore?
  
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
  
  //func navigateToSomewhere(source: TutorListViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: TutorListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
