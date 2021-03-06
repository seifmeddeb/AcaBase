//
//  QuestionRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/28/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol QuestionRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol QuestionDataPassing
{
    var dataStore: QuestionDataStore? { get }
}

class QuestionRouter: NSObject, QuestionRoutingLogic, QuestionDataPassing
{
    weak var viewController: QuestionViewController?
    var dataStore: QuestionDataStore?
    
    
    
    // MARK: Routing
    
    @objc func routeToTutorList(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! TutorListViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToTutorList(source: dataStore!, destination: &destinationDS)
        }
    }
    
    
    func passDataToTutorList(source: QuestionDataStore, destination: inout TutorListDataStore)
    {
        destination.tutorList = source.tutors ?? [TutorDAO]()
        destination.topicList = source.topics ?? [TopicDAO]()
        destination.isSelection = true
    }
    
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
    
    //func navigateToSomewhere(source: QuestionViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: QuestionDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
