//
//  Subject.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 9/9/20.
//  Copyright © 2020 Seif eddinne meddeb. All rights reserved.
//

import Foundation

struct SubjectDAO : Codable {
    
    var objectId: Int
    var name: String
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case objectId = "id"
        case name = "label"
        case icon = "icon"
    }
    
}
