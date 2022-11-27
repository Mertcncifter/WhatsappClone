//
//  ConversationCellVewModel.swift
//  WhatsappClone
//
//  Created by mert can çifter on 27.11.2022.
//

import SwiftUI
import Firebase

class ConversationCellViewModel: ObservableObject {
    
    @Published var message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var chatPartnerId: String {
        return message.fromId == AuthViewModel.shared.userSession?.uid ? message.toId : message.fromId
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = message.user else { return nil }
        return URL(string: user.profileImageUrl)
    }
    
    var fullname: String {
        guard let user = message.user else { return "" }
        return user.fullname
    }
    
    func fetchUser() {
        
        Firestore.firestore().collection("users").document(chatPartnerId).getDocument { snapshot, _ in
            self.message.user = try? snapshot?.data(as: User.self)
        }
    }
}
