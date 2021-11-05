//
//  AskAPI.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/20/21.
//  Copyright © 2021 Seif eddinne meddeb. All rights reserved.
//

import Foundation
import Alamofire

class AskAPI : AskStoreProtocol {
    
    func askQuestion(request: AskRequest, completionHandler: @escaping (() throws -> AskResponse) -> Void) {
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.request(askUrl,
                   method: .post,
                   parameters: request,
                   encoder: JSONParameterEncoder.default,
                   headers: headers)
            .validate(statusCode:200..<499)
            .responseDecodable(of: AskResponse.self) { response in
                
                if let data = response.request?.httpBody {
                    let str = String(data: data, encoding: .utf8)
                    print("Ask Question Request: \(str ?? "empty")")
                }
                guard let askResponse = response.value else {
                    print("Ask Question Error: \(response.error!)")
                    completionHandler{throw response.error!}
                    return
                }
                completionHandler{return askResponse}
                
        }
    }
    
    func uploadAttachements(questionId: String, images: [UIImage], attachements: [Attachement], completionHandler: @escaping (Error?) -> Void) {
        let parameters : Parameters = ["questionId": questionId]
        let headers = HTTPHeaders([HTTPHeader(name: "Authorization", value: "Bearer "+UserManager.shared.token!)])
        
        AF.upload(
            multipartFormData: { multipartFormData in
                for (key, value) in parameters {
                    if let temp = value as? String {
                        multipartFormData.append(temp.data(using: .utf8)!, withName: key)
                    }
                    if let temp = value as? Int {
                        multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
                    }
                    if let temp = value as? NSArray {
                        temp.forEach({ element in
                            let keyObj = key + "[]"
                            if let string = element as? String {
                                multipartFormData.append(string.data(using: .utf8)!, withName: keyObj)
                            } else
                            if let num = element as? Int {
                                let value = "\(num)"
                                multipartFormData.append(value.data(using: .utf8)!, withName: keyObj)
                            }
                        })
                    }
                }
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
            to: "\(attachementsUrl)?questionId=\(questionId)", method: .post , headers: headers)
            .validate(statusCode: 200..<300)
            .response { resp in
                switch resp.result{
                case .failure(let error):
                    print(error)
                    completionHandler(error)
                case.success( _):
                    completionHandler(nil)
                    print("🥶🥶Response after upload Img: \(resp.result)")
                }
            }
    }
}
