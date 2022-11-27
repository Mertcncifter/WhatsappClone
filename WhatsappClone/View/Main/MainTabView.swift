//
//  MainTabView.swift
//  WhatsappClone
//
//  Created by mert can çifter on 24.11.2022.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            NavigationView {
                TabView(selection: $selectedIndex) {
                    
                    ConversationsView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem { Image(systemName: "bubble.left") }
                        .tag(0)
                            
                    ChannelsView()
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                        .tag(1)
                    
                    SettingsView(user: user)
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem { Image(systemName: "gear") }
                        .tag(2)
                }
                .navigationTitle(tabTitle)
            }
        }
    }
    
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Chats"
        case 1: return "Channels"
        case 2: return "Settings"
        default: return ""
        }
    }
}


