//
//  HelperFunctions.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 10/8/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import UIKit

// MARK: Presenter Helpers
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

// MARK: File Manager Helpers
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
func getFileSize(url: URL) -> String {
    do {
        let attr = try FileManager.default.attributesOfItem(atPath: url.path)
        let fileSize = attr[FileAttributeKey.size] as! UInt64
        return convertToFileString(with:fileSize)
    } catch {
        print("Error: \(error)")
        return "0KB"
    }
}

func convertToFileString(with size: UInt64) -> String {
    var convertedValue: Double = Double(size)
    var multiplyFactor = 0
    let tokens = ["bytes", "KB", "MB", "GB", "TB", "PB",  "EB",  "ZB", "YB"]
    while convertedValue > 1024 {
        convertedValue /= 1024
        multiplyFactor += 1
    }
    return String(format: "%4.2f %@", convertedValue, tokens[multiplyFactor])
}

func fileDateComplement() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyyMMddHHmmss"
    
    return dateFormatter.string(from: Date())
}

var exportOutputURL: URL? {
    do {
        let pathURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return pathURL.appendingPathComponent("recording-\(fileDateComplement()).m4a")}
    catch {
        print("errrrooooooorrrrrr:\(error)")
        return nil
    }
}

// MARK: time Helpers
func hmsFrom(seconds: Int, completion: @escaping (_ hours: Int, _ minutes: Int, _ seconds: Int)->()) {

        completion(seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)

}

func getStringFrom(seconds: Int) -> String {

    return seconds < 10 ? "0\(seconds)" : "\(seconds)"
}
