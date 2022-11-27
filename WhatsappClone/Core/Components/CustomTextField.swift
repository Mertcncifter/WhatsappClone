//
//  CustomTextField.swift
//  WhatsappClone
//
//  Created by mert can çifter on 24.11.2022.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeHolderText: String
    let isSecureField: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    
                if isSecureField {
                    SecureField(placeHolderText, text: $text)
                } else {
                    TextField(placeHolderText, text: $text)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}


