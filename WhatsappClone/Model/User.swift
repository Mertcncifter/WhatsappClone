//
//  User.swift
//  WhatsappClone
//
//  Created by mert can çifter on 27.11.2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}


let MOCK_USER = User(id: "121391939139139193", username: "TEST", fullname: "Test", email: "test@gmail.com", profileImageUrl: "www.google.com")
