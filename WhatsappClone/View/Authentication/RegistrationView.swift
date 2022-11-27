//
//  RegistrationView.swift
//  WhatsappClone
//
//  Created by mert can çifter on 24.11.2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink(
                    destination: ProfilePhotoSelectorView().navigationBarBackButtonHidden(true),
                    isActive: $viewModel.didAuthenticateUser,
                    label: {})
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack {
                        Spacer()
                    }
                    
                    Text("Get started")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Crate your account.")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 40) {
                        
                        CustomTextField(imageName: "envelope", placeHolderText: "Email", isSecureField: false, text: $email)
                        
                        CustomTextField(imageName: "person", placeHolderText: "Fullname", isSecureField: false, text: $fullname)
                        
                        CustomTextField(imageName: "person", placeHolderText: "Username", isSecureField: false, text: $username)
                        
                        CustomTextField(imageName: "lock", placeHolderText: "Password", isSecureField: true, text: $password)
                    }
                    .padding([.top, .horizontal], 32)
                }
                .padding(.leading)
                                
                Button {
                    viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                
                Spacer()

                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        
                        Text("Already have an account?")
                            .font(.system(size: 15))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
        }
        .padding(.top, -56)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
