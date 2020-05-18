//
//  User.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/2/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

// MARK: UserDAO
struct UserDAO : Codable {
    
    var currentUser: CurrentUser
    var accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case currentUser = "current_user"
        case accessToken = "access_token"
    }
    
}

struct CurrentUser : Codable {
    
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
    
}

struct Level : Codable {
    var levelId : Int
    var specialityId : Int
    var label : String
    
    enum CodingKeys: String, CodingKey {
        case levelId = "level_id"
        case specialityId = "speciality_id"
        case label = "label"
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
