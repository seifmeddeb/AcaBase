//
//  PracticeViewController+UIHelpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 11/28/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension PracticeViewController {
    
    func setNavBarWhenAppearing() {
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.tintColor = primaryBlue
            navigationBar.barTintColor = .white
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: primaryBlue]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: primaryBlue]
            navBarAppearance.backgroundColor = .white
            navBarAppearance.shadowColor = .clear
            navigationBar.standardAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
            navigationBar.barStyle = .black
        }
    }
    
    func setSubjectsFilter(subjects: [String:Int]) {
        let titles = Array(subjects.keys)
        let segmentControl = UISegmentedControl(items: titles)

        segmentControl.selectedSegmentIndex = 0
        segmentControl.sizeToFit()
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: primaryBlue], for: .normal)
        
        UISegmentedControl.appearance().selectedSegmentTintColor = primaryBlue
        segmentControl.sendActions(for: .valueChanged)
        segmentControl.frame = CGRect(x: 10, y: 0, width: self.segmentedHolderView.bounds.width-20, height: 30)
        segmentControl.apportionsSegmentWidthsByContent = true
        self.segmentedHolderView.addSubview(segmentControl)
    }
    
}
