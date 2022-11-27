//
//  Message.swift
//  WhatsappClone
//
//  Created by mert can çifter on 25.11.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable,Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
