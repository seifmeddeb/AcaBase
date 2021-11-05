//
//  UIViewController+Helpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/28/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setError(for borderView: UIView, label: UILabel, text: String) {
        label.text = text
        borderView.borderColor = UIColor.red
    }
    
    func resetFormErrors(for borderViews: [UIView], and labels: [UILabel?]) {
        for label in labels {
            label?.text = ""
        }
        for borderView in borderViews {
            borderView.borderColor = primaryGreen
        }
    }
    
    func startAnimating(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopAnimating(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}
