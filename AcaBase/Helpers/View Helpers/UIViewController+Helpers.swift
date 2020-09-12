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
    
    func setError(for textField: UITextField, label: UILabel, text: String) {
        label.text = text
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    func resetFormErrors(for textFields: [UITextField?], and labels: [UILabel?]) {
        for label in labels {
            label?.text = ""
        }
        for textField in textFields {
            textField?.layer.borderWidth = 0
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
