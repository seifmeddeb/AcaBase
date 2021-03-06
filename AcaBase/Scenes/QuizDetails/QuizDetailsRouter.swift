//
//  QuizDetailsRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 12/27/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol QuizDetailsRoutingLogic
{
    func routeToShowScore(segue: UIStoryboardSegue?)
    func routeToAskQuestion(segue: UIStoryboardSegue?)
}

protocol QuizDetailsDataPassing
{
    var dataStore: QuizDetailsDataStore? { get }
}

class QuizDetailsRouter: NSObject, QuizDetailsRoutingLogic, QuizDetailsDataPassing
{
    weak var viewController: QuizDetailsViewController?
    var dataStore: QuizDetailsDataStore?
    
    
    // MARK: Routing
    
    func routeToShowScore(segue: UIStoryboardSegue?)
    {
        if let segue = segue {
            let destinationVC = segue.destination as! ScoreViewController
            destinationVC.score = viewController!.score
            destinationVC.total = viewController!.total
        }
    }
    
    func routeToAskQuestion(segue: UIStoryboardSegue?)
    {
        if let segue = segue {
            let destinationVC = segue.destination as! QuestionViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToAskQuestion(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Question", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToAskQuestion(source: dataStore!, destination: &destinationDS)
            navigateToAskQuestion(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToAskQuestion(source: QuizDetailsViewController, destination: QuestionViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToAskQuestion(source: QuizDetailsDataStore, destination: inout QuestionDataStore)
    {
        let questionIndex = viewController!.currentQuestion
        let currentQuestion = viewController!.questionList[questionIndex].model
        destination.question = currentQuestion
    }
}
