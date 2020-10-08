//
//  HelperFunctions.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/8/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

func getSubjectsString(for subjects: [SubjectDAO]?) -> String {
    var subjectsString = ""
    if let unwrappedSubjects = subjects {
        for subject in unwrappedSubjects.enumerated() {
            subjectsString += subject.element.name
            if subject.offset != unwrappedSubjects.count-1 {
                subjectsString += "/"
            }
        }
    }
    return subjectsString
}

func getAnsweredQuestions(answersNbr: Int) -> NSAttributedString {
    let answersLocalized = "Answers:"
    let string = "\(answersLocalized) \(answersNbr)"
    let attStr = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    guard let nsRange = string.range(of: answersLocalized)?.nsRange(in: string) else { return attStr }
    attStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: nsRange)
    return attStr
}

extension RangeExpression where Bound == String.Index  {
    func nsRange<S: StringProtocol>(in string: S) -> NSRange { .init(self, in: string) }
}
