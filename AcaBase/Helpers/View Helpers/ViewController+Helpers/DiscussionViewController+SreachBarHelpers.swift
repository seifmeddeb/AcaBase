//
//  DiscussionViewController+SreachBarHelpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/6/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension DiscussionViewController : UISearchControllerDelegate {
    
    func resetNavBarWhenAppearing() {
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = primaryBlue
            navigationBar.barTintColor = .white
            
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                
                navBarAppearance.configureWithOpaqueBackground()
                navBarAppearance.titleTextAttributes = [.foregroundColor: primaryBlue]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: primaryBlue]
                navBarAppearance.backgroundColor = .white
                navigationBar.standardAppearance = navBarAppearance
                navigationBar.scrollEdgeAppearance = navBarAppearance
            } else {
                // Fallback on earlier versions
            }
            navigationBar.barStyle = .default
            navigationBar.alpha = 1
            navigationBar.prefersLargeTitles = false
        }
    }
    
    func setSearchBarUI() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        
        self.searchBar = searchController.searchBar
        searchBar.tintColor = primaryBlue
        searchBar.barTintColor = .white
        searchBar.delegate = self
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = primaryBlue
            navigationBar.barTintColor = primaryBlue
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                
                navBarAppearance.configureWithOpaqueBackground()
                navBarAppearance.titleTextAttributes = [.foregroundColor: primaryBlue]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: primaryBlue]
                navBarAppearance.backgroundColor = primaryBlue
                navigationBar.standardAppearance = navBarAppearance
                navigationBar.scrollEdgeAppearance = navBarAppearance
            } else {
                // Fallback on earlier versions
            }
            navigationBar.barStyle = .black
            navigationBar.alpha = 1
            navigationBar.layer.masksToBounds = false
            navigationBar.layer.shadowColor = UIColor.black.cgColor
            navigationBar.layer.shadowOpacity = 0.2
            navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            navigationBar.layer.shadowRadius = 5
            navigationBar.prefersLargeTitles = false
        }
        
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: primaryBlue], for: .normal)
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [.foregroundColor: UIColor.white]
        if #available(iOS 13.0, *) {
            UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).selectedSegmentTintColor = primaryBlue
            searchBar.searchTextField.textColor = primaryBlue
            searchBar.searchTextField.defaultTextAttributes = [.foregroundColor: primaryBlue]
            if let glassIconView = searchBar.searchTextField.leftView as? UIImageView {
                //Magnifying glass
                glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
                glassIconView.tintColor = primaryBlue
            }
        } else {
            // Fallback on earlier versions
        }
        
//        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: primaryBlue.withAlphaComponent(0.4)])
        
        searchController.obscuresBackgroundDuringPresentation = false

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
}
