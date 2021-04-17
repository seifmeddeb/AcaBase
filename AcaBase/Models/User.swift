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
    }
    
    internal init(userId: Int, userName: String, gender: String? = nil, email: String, firstName: String, lastName: String, phone: String, birthday: String? = nil, picture: String, status: String, level: Level? = nil, region: String? = nil) {
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
        
        self.init(userId: userId, userName: userName, gender: gender, email: email, firstName: firstName, lastName: lastName, phone: phone, birthday: birthday, picture: picture, status: status, level: level, region: region)
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
