//
//  WhatsappCloneApp.swift
//  WhatsappClone
//
//  Created by mert can çifter on 24.11.2022.
//

import SwiftUI
import Firebase

@main
struct WhatsappCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
        }
    }
}
