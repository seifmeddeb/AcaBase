//
//  User.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/2/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

// MARK: UserDAO
class UserDAO : NSObject, Codable, NSCoding, NSSecureCoding {
    
    var currentUser: CurrentUser
    var accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case currentUser = "current_user"
        case accessToken = "access_token"
    }
    
    internal init(currentUser: CurrentUser, accessToken: String) {
        self.currentUser = currentUser
        self.accessToken = accessToken
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(currentUser, forKey: "currentUser")
        coder.encode(accessToken, forKey: "accessToken")
    }

    required convenience init?(coder: NSCoder) {
        let currentUser = coder.decodeObject(forKey: "currentUser") as! CurrentUser
        let accessToken = coder.decodeObject(forKey: "accessToken") as! String
        
        self.init(currentUser: currentUser, accessToken: accessToken)
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
}

class CurrentUser : NSObject, Codable, NSCoding, NSSecureCoding {
    
    var userId: Int
    var userName: String
    var gender: String?
    var email: String
    var firstName: String
    var lastName: String
    var phone: String
    var birthday: String?
    var picture: String
    var status: String
    var level: Level?
    var region: String?
    var statistics: Statistics?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case userName = "user_name"
        case gender = "gender"
        case email = "email"
        case firstName = "first_name"
        case lastName = "last_name"
        
        case phone = "phone_number"
        case birthday = "birth_day"
        case picture = "picture"
        case status = "status"
        case level = "level"
        case region = "region"
        case statistics = "statistics"
    }
    
    internal init(userId: Int, userName: String, gender: String? = nil, email: String, firstName: String, lastName: String, phone: String, birthday: String? = nil, picture: String, status: String, level: Level? = nil, region: String? = nil, statistics: Statistics? = nil) {
        self.userId = userId
        self.userName = userName
        self.gender = gender
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.birthday = birthday
        self.picture = picture
        self.status = status
        self.level = level
        self.region = region
        self.statistics = statistics
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(userId, forKey: "userId")
        coder.encode(userName, forKey: "userName")
        coder.encode(gender, forKey: "gender")
        coder.encode(email, forKey: "email")
        coder.encode(firstName, forKey: "firstName")
        coder.encode(lastName, forKey: "lastName")
        
        coder.encode(phone, forKey: "phone")
        coder.encode(birthday, forKey: "birthday")
        coder.encode(picture, forKey: "picture")
        coder.encode(status, forKey: "status")
        coder.encode(level, forKey: "level")
        coder.encode(region, forKey: "region")
        coder.encode(statistics, forKey: "statistics")
    }
    
    
    
    required convenience init?(coder: NSCoder) {
        let userId = coder.decodeInteger(forKey: "userId")
        let userName = coder.decodeObject(forKey: "userName") as! String
        let gender = coder.decodeObject(forKey: "gender") as? String
        
        let email = coder.decodeObject(forKey: "email") as! String
        let firstName = coder.decodeObject(forKey: "firstName") as! String
        let lastName = coder.decodeObject(forKey: "lastName") as! String
        
        let phone = coder.decodeObject(forKey: "phone") as! String
        let birthday = coder.decodeObject(forKey: "birthday") as? String
        let picture = coder.decodeObject(forKey: "picture") as! String
        
        let status = coder.decodeObject(forKey: "status") as! String
        let level = coder.decodeObject(forKey: "level") as? Level
        let region = coder.decodeObject(forKey: "region") as? String
        let statistics = coder.decodeObject(forKey: "statistics") as? Statistics
        
        self.init(userId: userId, userName: userName, gender: gender, email: email, firstName: firstName, lastName: lastName, phone: phone, birthday: birthday, picture: picture, status: status, level: level, region: region, statistics: statistics)
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
}

class Level : NSObject, Codable, NSCoding, NSSecureCoding {
    var levelId : Int
    var specialityId : Int
    var label : String
    
    enum CodingKeys: String, CodingKey {
        case levelId = "level_id"
        case specialityId = "speciality_id"
        case label = "label"
    }
    
    internal init(levelId: Int, specialityId: Int, label: String) {
        self.levelId = levelId
        self.specialityId = specialityId
        self.label = label
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(levelId, forKey: "levelId")
        coder.encode(specialityId, forKey: "specialityId")
        coder.encode(label, forKey: "label")
    }

    required convenience init?(coder: NSCoder) {
        let levelId = coder.decodeInteger(forKey: "levelId")
        let specialityId = coder.decodeInteger(forKey: "specialityId")
        let label = coder.decodeObject(forKey: "label") as! String
        
        self.init(levelId: levelId, specialityId: specialityId, label: label)
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
}

class Statistics : NSObject, Codable, NSCoding, NSSecureCoding {
    var leftDays : Int
    var leftQuestions : Int
    var nbrSolvedQuestions : Int
    var nbrTakenCourses : Int
    var nbrFinishedQuiz : Int
    var totalHours : Int
    var totalDays : Int
    var totalQuestions : Int
    var learningPathPerDays : [LearningPathPerDays]? = nil
    
    internal init(leftDays: Int, leftQuestions: Int, nbrSolvedQuestions: Int, nbrTakenCourses: Int, nbrFinishedQuiz: Int, totalHours: Int, totalDays: Int, totalQuestions: Int, learningPathPerDays: [LearningPathPerDays]? = nil) {
        
        self.leftDays = leftDays
        self.leftQuestions = leftQuestions
        self.nbrSolvedQuestions = nbrSolvedQuestions
        self.nbrTakenCourses = nbrTakenCourses
        self.nbrFinishedQuiz = nbrFinishedQuiz
        self.totalHours = totalHours
        self.totalDays = totalDays
        self.totalQuestions = totalQuestions
        self.learningPathPerDays = learningPathPerDays
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(leftDays, forKey: "leftDays")
        coder.encode(leftQuestions, forKey: "leftQuestions")
        coder.encode(nbrSolvedQuestions, forKey: "nbrSolvedQuestions")
        coder.encode(nbrTakenCourses, forKey: "nbrTakenCourses")
        coder.encode(nbrFinishedQuiz, forKey: "nbrFinishedQuiz")
        coder.encode(totalHours, forKey: "totalHours")
        coder.encode(totalDays, forKey: "totalDays")
        coder.encode(totalQuestions, forKey: "totalQuestions")
        coder.encode(learningPathPerDays, forKey: "learningPathPerDays")
    }

    required convenience init?(coder: NSCoder) {
        let leftDays = coder.decodeInteger(forKey: "leftDays")
        let leftQuestions = coder.decodeInteger(forKey: "leftQuestions")
        let nbrSolvedQuestions = coder.decodeInteger(forKey: "nbrSolvedQuestions")
        let nbrTakenCourses = coder.decodeInteger(forKey: "nbrTakenCourses")
        let nbrFinishedQuiz = coder.decodeInteger(forKey: "nbrFinishedQuiz")
        let totalHours = coder.decodeInteger(forKey: "totalHours")
        let totalDays = coder.decodeInteger(forKey: "totalDays")
        let totalQuestions = coder.decodeInteger(forKey: "totalQuestions")
        let learningPathPerDays = coder.decodeObject(forKey: "learningPathPerDays") as? [LearningPathPerDays]
        
        self.init(leftDays: leftDays, leftQuestions: leftQuestions, nbrSolvedQuestions: nbrSolvedQuestions, nbrTakenCourses: nbrTakenCourses, nbrFinishedQuiz: nbrFinishedQuiz, totalHours: totalHours, totalDays: totalDays, totalQuestions: totalQuestions, learningPathPerDays: learningPathPerDays)
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
}

class LearningPathPerDays : NSObject, Codable, NSCoding, NSSecureCoding {
    var timestamp: Int
    var value: Int
    
    internal init(timestamp: Int, value: Int) {
        self.timestamp = timestamp
        self.value = value
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(timestamp, forKey: "timestamp")
        coder.encode(value, forKey: "value")
    }

    required convenience init?(coder: NSCoder) {
        let timestamp = coder.decodeInteger(forKey: "timestamp")
        let value = coder.decodeInteger(forKey: "value")
        
        self.init(timestamp: timestamp, value: value)
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
}

struct SubscribeRequest : Codable {
    var firstName : String
    var lastName : String
    var phone : String
    var email : String
    var password : String
    var image : String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case phone = "phone_number"
        case email = "email"
        case password = "password"
        case image = "picture"
    }
    
}
struct APIResponse : Codable {
    var status : String
    var message : String
}
