//
//  HomeRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 6/14/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol HomeRoutingLogic
{
    func routeToLogin(segue: UIStoryboardSegue?)
    func routeToQuestion(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing
{
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing
{
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: Routing
    
    func routeToLogin(segue: UIStoryboardSegue?)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
        
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
    }
    
    @objc func routeToDetailTutor(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! TutorViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToDetailTutor(source: dataStore!, destination: &destinationDS)
        }
    }
    
    @objc func routeToTutorList(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! TutorListViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToTutorList(source: dataStore!, destination: &destinationDS)
        }
    }
    
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
    
    // MARK: Passing data
    func passDataToDetailTutor(source: HomeDataStore, destination: inout TutorDataStore)
    {
        let selectedRow = viewController?.collectionView?.indexPathsForSelectedItems?[0].row
        destination.tutorToDisplay = source.tutors?[selectedRow!]
    }
    
    func passDataToTutorList(source: HomeDataStore, destination: inout TutorListDataStore)
    {
        destination.tutorList = source.tutors ?? [TutorDAO]()
        destination.topicList = source.topics ?? [TopicDAO]()
        destination.isSelection = false
    }
    
    func passDataToQuestion(source: HomeDataStore, destination: inout QuestionDataStore)
    {
        destination.tutors = source.tutors ?? [TutorDAO]()
        destination.topics = source.topics ?? [TopicDAO]()
    }
    
    // MARK: Navigation
    func navigateToQuestion(source: HomeViewController, destination: QuestionViewController)
    {
        source.show(destination, sender: nil)
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
    
    //func navigateToSomewhere(source: HomeViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: HomeDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
