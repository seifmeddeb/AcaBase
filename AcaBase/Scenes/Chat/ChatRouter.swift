//
//  ChatRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/28/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ChatRoutingLogic
{
    func routeToChatRating(segue: UIStoryboardSegue?)
}

protocol ChatDataPassing
{
    var dataStore: ChatDataStore? { get }
}

class ChatRouter: NSObject, ChatRoutingLogic, ChatDataPassing
{
    weak var viewController: ChatViewController?
    var dataStore: ChatDataStore?
    
    // MARK: Routing
    
    func routeToChatRating(segue: UIStoryboardSegue?)
    {
        if let segue = segue {
            let destinationVC = segue.destination as! ChatRatingViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToRating(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Chat", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "ChatRatingViewController") as! ChatRatingViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToRating(source: dataStore!, destination: &destinationDS)
            navigateToRating(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToRating(source: ChatViewController, destination: ChatRatingViewController)
    {
        source.present(destination, animated: false, completion: nil)
    }
    
    // MARK: Passing data
    
    func passDataToRating(source: ChatDataStore, destination: inout ChatRatingDataStore)
    {
        destination.tutor = source.tutor
        destination.questionId = source.discussionId
    }
}
