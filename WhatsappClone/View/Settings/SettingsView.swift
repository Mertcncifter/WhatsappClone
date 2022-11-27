//
//  SettingsView.swift
//  WhatsappClone
//
//  Created by mert can çifter on 24.11.2022.
//

import SwiftUI

struct SettingsView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        ZStack {
            
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                
                NavigationLink {
                    EditProfileView()
                } label: {
                    SettingsHeaderView(user: user)
                        .padding(.top)
                }

                VStack(spacing: 1) {
                    ForEach(SettingsCellOption.allCases, id: \.self) { option in
                        SettingsCell(option: option)
                    }
                }
                
                Button {
                    AuthViewModel.shared.signOut()
                } label: {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: UIScreen.main.bounds.width, height: 50)
                        .background(.white)
                }
                
                Spacer()

            }
        }
    }
}

