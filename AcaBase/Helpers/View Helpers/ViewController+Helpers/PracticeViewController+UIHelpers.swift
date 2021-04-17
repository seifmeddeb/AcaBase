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
    
    func setSubjectsFilter(subjects: [String:Int]) {
        let titles = Array(subjects.keys).sorted{return $0 < $1}
        let segmentControl = UISegmentedControl(items: titles)

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
        segmentControl.frame = CGRect(x: 10, y: 0, width: self.segmentedHolderView.bounds.width-20, height: 30)
        segmentControl.apportionsSegmentWidthsByContent = true
        self.segmentedHolderView.addSubview(segmentControl)
    }
    
}
