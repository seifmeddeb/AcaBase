//
//  DataValidationWorker.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/18/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

class DataValidationWorker {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
