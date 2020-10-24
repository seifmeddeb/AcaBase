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
            navigationBar.tintColor = .white
            navigationBar.barTintColor = primaryBlue
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = primaryBlue
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationBar.barStyle = .default
            navigationBar.alpha = 1
            navigationBar.layer.masksToBounds = false
            navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
            navigationBar.layer.shadowOpacity = 0.8
            navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
            navigationBar.layer.shadowRadius = 1
            navigationBar.prefersLargeTitles = true
        }
    }
    
    func setSearchBarUI(subjects: [Int:String]) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        
        self.searchBar = searchController.searchBar
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.white
        searchBar.delegate = self
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            textfield.textColor = UIColor.blue
            if let backgroundview = textfield.subviews.first {
                
                // Background color
                backgroundview.backgroundColor = UIColor.white
                
                // Rounded corner
                backgroundview.layer.cornerRadius = 10;
                backgroundview.clipsToBounds = true;
            }
        }
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = .white
            navigationBar.barTintColor = primaryBlue
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
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
            navigationBar.prefersLargeTitles = true
        }
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: primaryBlue], for: .selected)
        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        //UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [.foregroundColor: UIColor.white]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.defaultTextAttributes = [.foregroundColor: UIColor.white]
        if let glassIconView = searchBar.searchTextField.leftView as? UIImageView {
            //Magnifying glass
            glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
            glassIconView.tintColor = .white
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
