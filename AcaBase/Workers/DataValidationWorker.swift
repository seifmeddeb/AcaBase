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
    
    func isValidPhoneNumber(_ phone: String) -> Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: phone, options: [], range: NSRange(location: 0, length: phone.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == phone.count
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}
