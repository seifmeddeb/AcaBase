//
//  StatsViewController+Helpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 1/11/2021.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension StatsViewController : UISearchControllerDelegate {
 
    func setStatsFilter(filters: [String:Int]) {
        let titles = Array(filters.keys)
        let segmentControl = UISegmentedControl(items: ["Par Jour","Par Matière"])

        segmentControl.selectedSegmentIndex = 0
        segmentControl.sizeToFit()
        segmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: primaryBlue], for: .normal)
        
        if #available(iOS 13.0, *) {
            UISegmentedControl.appearance().selectedSegmentTintColor = primaryBlue
        } else {
            // Fallback on earlier versions
        }
        segmentControl.sendActions(for: .valueChanged)
        segmentControl.frame = CGRect(x: 10, y: 0, width: self.view.bounds.width-20, height: 30)
        segmentControl.apportionsSegmentWidthsByContent = false
        self.segmentedHolderView.addSubview(segmentControl)
    }
}
