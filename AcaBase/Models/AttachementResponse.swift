//
//  AttachementResponse.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/16/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct AttachementResponse : Codable {
    var status : String
    var files : [File]?
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case files = "files"
    }
}

struct File : Codable {
    var objectId : Int
    var url : String
    var fileName : String
    var mimeType : String
    var fileSize : String
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case url = "url"
        case fileName = "fileName"
        case mimeType = "mimeType"
        case fileSize = "fileSize"
    }
}
