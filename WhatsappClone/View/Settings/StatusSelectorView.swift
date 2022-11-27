//
//  StatusSelectorView.swift
//  WhatsappClone
//
//  Created by mert can çifter on 25.11.2022.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    
    var body: some View {
        ZStack {
            
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    Text("Currently Set To")
                        .foregroundColor(.gray)
                        .padding()
                    
                    StatusCell(statu: viewModel.status)
                    
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured}) , id: \.self) { status in
                        Button {
                            viewModel.updateStatus(status)
                        } label: {
                            StatusCell(statu: status)
                        }

                    }
                }
            }
            
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}


struct StatusCell: View {
    var statu: UserStatus
    
    var body: some View {
        HStack {
            Text(statu.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)
    }
}
