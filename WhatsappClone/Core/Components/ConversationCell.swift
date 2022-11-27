//
//  ConversationCell.swift
//  WhatsappClone
//
//  Created by mert can çifter on 25.11.2022.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var viewModel: ConversationCellViewModel
    
    var body: some View {
        if let user = viewModel.message.user {
            NavigationLink {
                ChatView(user: user)
            } label: {
                VStack {
                    HStack {
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading,spacing: 4) {
                            Text(viewModel.fullname)
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                        }
                        .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                .padding(.top)
            }
        }
    }
}

