//
//  PracticeRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/28/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol PracticeRoutingLogic
{
    func routeToDetailChapter(segue: UIStoryboardSegue?)
}

protocol PracticeDataPassing
{
    var dataStore: PracticeDataStore? { get }
}

class PracticeRouter: NSObject, PracticeRoutingLogic, PracticeDataPassing
{
    weak var viewController: PracticeViewController?
    var dataStore: PracticeDataStore?
    
    // MARK: Routing
    
    func routeToDetailChapter(segue: UIStoryboardSegue?)
    {
        if let segue = segue {
            let destinationVC = segue.destination as! LessonViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToDetailChapter(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Lesson", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "LessonViewController") as! LessonViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToDetailChapter(source: dataStore!, destination: &destinationDS)
            navigateToDetailChapter(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToDetailChapter(source: PracticeViewController, destination: LessonViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToDetailChapter(source: PracticeDataStore, destination: inout LessonDataStore)
    {
        destination.chapter = viewController?.selectedChapter
    }
}
