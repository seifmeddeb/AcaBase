//
//  ChatInteractor.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 2/28/21.
//  Copyright (c) 2021 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ChatBusinessLogic
{
    func getMessages(request: Chat.Messages.Request)
    func sendMessage(request: Chat.SendMessage.Request)
    func sendAttachement(request: Chat.SendAttachement.Request)
}

protocol ChatDataStore
{
    var discussionId: Int? { get set }
    var tutorId: Int? { get set }
    var tutor : TutorDAO? { get set }
}

class ChatInteractor: ChatBusinessLogic, ChatDataStore
{
    var presenter: ChatPresentationLogic?
    var worker: ChatWorker?
    var tutorWorker: HomeWorker?
    var discussionId: Int?
    var tutorId : Int?
    var tutor : TutorDAO?
    
    // MARK: getMessages
    func getMessages(request: Chat.Messages.Request)
    {
        if let tutor = tutor {
            worker = ChatWorker()
            if let discussionId = discussionId {
                worker?.getMessages(for: discussionId) { (messages) in
                    let response = Chat.Messages.Response(messages: messages ?? [MessageDAO](), tutor: tutor, discussionId: discussionId)
                    self.presenter?.presentMessages(response: response)
                }
            }
        } else {
            tutorWorker = HomeWorker(mainPageStore: MainPageAPI())
            tutorWorker?.getTutors(completionHandler: { (tutors) in
                for tutor in tutors ?? [TutorDAO]() {
                    if tutor.objectId == self.tutorId! {
                        self.tutor = tutor
                        break
                    }
                }
                self.worker = ChatWorker()
                if let discussionId = self.discussionId {
                    self.worker?.getMessages(for: discussionId) { (messages) in
                        let response = Chat.Messages.Response(messages: messages ?? [MessageDAO](), tutor: self.tutor!, discussionId: discussionId)
                        self.presenter?.presentMessages(response: response)
                    }
                }
            })
        }
    }
    
    // MARK: sendMessage
    func sendMessage(request: Chat.SendMessage.Request) {
        worker = ChatWorker()
        if let discussionId = discussionId, let tutorId = tutorId {
            worker?.sendMessage(for: discussionId, tutorId: tutorId, message: request.body, messageId: request.id)
        }
    }
    
    // MARK: sendAttachement
    func sendAttachement(request: Chat.SendAttachement.Request) {
        worker?.sendAttachement(images: request.images, attachements: request.attachements, completionHandler: { (attachements,error) in
            if let _ = error {
                // present error msg
                // self.presenter?.presentErrorMessage(response: response)
            } else {
                if let attachementList = attachements, let discussionId = self.discussionId, let tutorId = self.tutorId {
                    self.worker?.sendAttachementMessage(for: discussionId, tutorId: tutorId, message: "", messageId: request.id, sentAttachements: request.attachements ,attachement: attachementList)
                }
            }
        })
    }

}
