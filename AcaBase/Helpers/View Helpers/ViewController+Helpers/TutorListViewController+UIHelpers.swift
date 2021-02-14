//
//  TutorListViewController+UIHelpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/7/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension TutorListViewController : UISearchControllerDelegate {
    
    func resetNavBarWhenAppearing() {
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = primaryBlue
            navigationBar.barTintColor = .white
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: primaryBlue]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: primaryBlue]
            navBarAppearance.backgroundColor = .white
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationBar.barStyle = .default
            navigationBar.alpha = 1
            navigationBar.prefersLargeTitles = false
        }
    }
    
    func setSearchBarUI(subjects: [Int:String]) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        
        self.searchBar = searchController.searchBar
        searchBar.tintColor = primaryBlue
        searchBar.barTintColor = .white
        searchBar.delegate = self
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = primaryBlue
            navigationBar.barTintColor = primaryBlue
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: primaryBlue]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: primaryBlue]
            navBarAppearance.backgroundColor = primaryBlue
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationBar.barStyle = .black
            navigationBar.alpha = 1
            navigationBar.layer.masksToBounds = false
            navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
            navigationBar.layer.shadowOpacity = 0.8
            navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
            navigationBar.layer.shadowRadius = 1
            navigationBar.prefersLargeTitles = false
        }
        
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: primaryBlue], for: .normal)
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).selectedSegmentTintColor = primaryBlue
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [.foregroundColor: UIColor.white]
//        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: primaryBlue.withAlphaComponent(0.4)])
        searchBar.searchTextField.textColor = primaryBlue
        searchBar.searchTextField.defaultTextAttributes = [.foregroundColor: primaryBlue]
        if let glassIconView = searchBar.searchTextField.leftView as? UIImageView {
            //Magnifying glass
            glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
            glassIconView.tintColor = primaryBlue
        }
        let subjectsNames = Array(subjects.values)
        searchController.searchBar.scopeButtonTitles = subjectsNames
        searchController.searchBar.showsScopeBar = true
        searchController.obscuresBackgroundDuringPresentation = false

        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
}
