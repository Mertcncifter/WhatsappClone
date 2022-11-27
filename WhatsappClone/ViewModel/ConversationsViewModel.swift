//
//  ConversationsViewModel.swift
//  WhatsappClone
//
//  Created by mert can çifter on 27.11.2022.
//

import Firebase


class ConversationsViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let query = Firestore.firestore().collection("messages").document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.recentMessages = documents.compactMap({ try? $0.data(as: Message.self) })
        }
    }
}
