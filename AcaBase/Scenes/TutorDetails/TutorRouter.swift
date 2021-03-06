//
//  TutorRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/27/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol TutorRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol TutorDataPassing
{
    var dataStore: TutorDataStore? { get }
}

class TutorRouter: NSObject, TutorRoutingLogic, TutorDataPassing
{
    weak var viewController: TutorViewController?
    var dataStore: TutorDataStore?
    
    // MARK: Routing
    
    @objc func routeToQuestion(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! QuestionViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToQuestion(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Question", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToQuestion(source: dataStore!, destination: &destinationDS)
            navigateToQuestion(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func passDataToQuestion(source: TutorDataStore, destination: inout QuestionDataStore)
    {
        destination.tutor = source.tutorToDisplay
    }
    
    // MARK: Navigation
    func navigateToQuestion(source: TutorViewController, destination: QuestionViewController)
    {
        source.show(destination, sender: nil)
    }
}
