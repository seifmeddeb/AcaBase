/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Firebase
import MessageKit
import FirebaseFirestore

struct Message: MessageType {
    
    let id: Int?
    let content: String
    let sentDate: Date
    let sender: SenderType
    var kind: MessageKind {
        if let attachement = imageAttachement {
            return .photo(attachement)
        } else if let attachement = audioAttachement {
            return .audio(attachement)
        } else if let attachement = docAttachement {
            return .linkPreview(attachement)
        } else {
            return .text(content)
        }
    }
    
    var messageId: String {
        if let id = id {
            return "\(id)"
        } else {
            return UUID().uuidString
        }
    }
    
    var imageAttachement: AttachementDAO? = nil
    var audioAttachement: AudioAttachement? = nil
    var docAttachement: DocumentAttachement? = nil
    var cachedImage : UIImage?
    
    init(id: Int?, senderId: Int, name: String, content: String) {
        sender = Sender(senderId: "\(senderId)", displayName: name)
        self.content = content
        sentDate = Date()
        self.id = id
    }
    
    init(id: Int?, senderId: Int, name: String, imageAttachement: AttachementDAO) {
        sender = Sender(senderId: "\(senderId)", displayName: name)
        self.imageAttachement = imageAttachement
        content = ""
        sentDate = Date()
        self.id = id
    }
    
    init(id: Int?, senderId: Int, name: String, audioAttachement: AudioAttachement) {
        sender = Sender(senderId: "\(senderId)", displayName: name)
        self.audioAttachement = audioAttachement
        content = ""
        sentDate = Date()
        self.id = id
    }
    
    init(id: Int?, senderId: Int, name: String, docAttachement: DocumentAttachement) {
        sender = Sender(senderId: "\(senderId)", displayName: name)
        self.content = ""
        sentDate = Date()
        self.id = id
        self.docAttachement = docAttachement
    }
    
}

extension Message: Comparable {
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: Message, rhs: Message) -> Bool {
        return lhs.sentDate < rhs.sentDate
    }
    
}
