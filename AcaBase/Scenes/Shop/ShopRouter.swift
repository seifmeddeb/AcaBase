//
//  ShopRouter.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 4/10/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ShopRoutingLogic
{
    func routeToOfferDetails(segue: UIStoryboardSegue?)
}

protocol ShopDataPassing
{
    var dataStore: ShopDataStore? { get }
}

class ShopRouter: NSObject, ShopRoutingLogic, ShopDataPassing
{
    weak var viewController: ShopViewController?
    var dataStore: ShopDataStore?
    
    // MARK: Routing
    
    func routeToOfferDetails(segue: UIStoryboardSegue?)
    {
      if let segue = segue {
        let destinationVC = segue.destination as! DetailsShopViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToOfferDetails(source: dataStore!, destination: &destinationDS)
      } else {
        let storyboard = UIStoryboard(name: "Store", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailsShopViewController") as! DetailsShopViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToOfferDetails(source: dataStore!, destination: &destinationDS)
        navigateToOfferDetails(source: viewController!, destination: destinationVC)
      }
    }
    
    // MARK: Navigation
    
    func navigateToOfferDetails(source: ShopViewController, destination: DetailsShopViewController)
    {
      source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToOfferDetails(source: ShopDataStore, destination: inout DetailsShopDataStore)
    {
      destination.offer = viewController?.selectedOffer
    }
}
