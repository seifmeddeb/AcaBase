//
//  ChatAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 3/16/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class ChatAPI : ChatStoreProtocol {
    
    func sendAttachements(images: [UIImage], attachements: [Attachement], completionHandler: @escaping (() throws -> AttachementResponse) -> Void) {
        
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.upload(
            multipartFormData: { multipartFormData in
                for image in images {
                    multipartFormData.append(image.jpegData(compressionQuality: 0.5)!, withName: "image" , fileName: "image\(fileDateComplement()).jpeg", mimeType: "image/jpeg")
                }
                for file in attachements {
                    if let url = file.objectUrl {
                        let mimeType = url.absoluteString.mimeType()
                        multipartFormData.append(url, withName: file.isAudio ? "Audio" : "Fichier" , fileName: file.name ?? "", mimeType:mimeType)
                    }
                }
            },
            to: attachementChatUrl, method: .post , headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: AttachementResponse.self) { response in
                guard let attachementResponse = response.value else {
                    print("fetchTrainers: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return attachementResponse}
            }
    }
    
    func submitChatRating(request: RateTutorRequest, completionHandler: @escaping (() throws -> ()) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.request(quizScoreUrl,
                   method: .post,
                   parameters: request,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate(statusCode:200..<300)
            .response{ response in
                
                guard let _ = response.value else {
                    print("Rate tutor Error: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{}
        }
    }
}
