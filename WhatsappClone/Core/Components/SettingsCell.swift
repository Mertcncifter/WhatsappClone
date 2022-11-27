//
//  SettingsCell.swift
//  WhatsappClone
//
//  Created by mert can çifter on 24.11.2022.
//

import SwiftUI

struct SettingsCell: View {
    var option: SettingsCellOption
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: option.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6)
                    .foregroundColor(option.backgroundColor)
                    .cornerRadius(6)
                
                Text(option.title)
                    .font(.system(size: 15))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding([.top, .horizontal])
            
            Divider()
                .padding(.leading)
        }
        .background(.white)
        
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell(option: SettingsCellOption.notifications)
    }
}
