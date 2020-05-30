//
//  LoginModels.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/1/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login
{
    // MARK: User Login
    
    enum User
    {
        struct Request : Codable
        {
            var email : String
            var password : String
            
            enum CodingKeys: String, CodingKey {
                case email = "username"
                case password = "password"
            }
        }
        struct Response
        {
            var user : UserDAO?
            var emailError : String?
            var passwordError : String?
        }
        struct ViewModel
        {
            enum Result
            {
                struct Successfull {
                    var name : String
                    var email : String
                }
                struct Failure {
                    var errorMsg : String
                    var emailError : String?
                    var passwordError : String?
                }
            }
        }
    }
    
    // MARK: AutoFill data
    enum ResetPassword
    {
        struct Request
        {
            var email : String
        }
        struct Response
        {
            var apiResponse : APIResponse?
        }
        struct ViewModel
        {
            var message : String
        }
    }
    
    // MARK: AutoFill data
    enum Users
    {
        struct Request
        {
        }
        struct Response
        {
            var users : [UserDAO]?
        }
        struct ViewModel
        {
            var email : String
        }
    }
}
