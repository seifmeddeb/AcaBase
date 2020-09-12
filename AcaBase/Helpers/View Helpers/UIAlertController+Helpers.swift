//
//  UIAlertController+Helpers.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/29/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit
extension UIAlertController {
    
    @objc func textDidChangeInResetPasswordAlert() {
        if let email = textFields?[0].text,
            let action = actions.last {
            action.isEnabled = (email.count > 0)
        }
    }
}
