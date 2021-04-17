//
//  AttachementDAO.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/6/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import MessageKit
import UIKit

struct AttachementDAO : Codable, MediaItem {
    
    public var url: URL? {
        return URL(string: self.link ?? "")
    }
    
    public var image: UIImage?
    
    public var placeholderImage: UIImage {
        return UIImage(named: "image-not-found")!
    }
    
    public var size: CGSize {
        return CGSize(width: 250.0, height: 350.0)
    }
    
    var type : String?
    var link : String?
    var name : String?
    var fileSize : String?
    var duration : Double?
    
    enum CodingKeys: String, CodingKey {
        case type = "extension"
        case link = "link"
        case name = "name"
        case fileSize = "size"
        case duration = "duration"
    }
}

struct AudioAttachement : AudioItem {
    
    var model : AttachementDAO
    
    var url: URL {
        return URL(string: self.model.link ?? "")!
    }
    
    var duration: Float {
        return Float(self.model.duration ?? 0.0)
    }
    
    public var size: CGSize {
        return CGSize(width: 250.0, height: 50.0)
    }
    
    
}


struct DocumentAttachement : LinkItem {
    
    var model : AttachementDAO
    
    var text: String? {
        return ""
    }
    
    var attributedText: NSAttributedString?
    
    var url: URL {
        return URL(string: self.model.link ?? "")!
    }
    
    var title: String? {
        return self.model.name ?? ""
    }
    
    var teaser : String {
        return self.model.fileSize ?? ""
    }
    
    var thumbnailImage: UIImage {
        return #imageLiteral(resourceName: "documents")
    }
    
    
}
