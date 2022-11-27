//
//  NewMessageViewModel.swift
//  WhatsappClone
//
//  Created by mert can çifter on 27.11.2022.
//

import Firebase
import SwiftUI


class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
                .filter({ $0.id != Auth.auth().currentUser?.uid })
            
        }
    }
}
