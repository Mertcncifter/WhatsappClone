//
//  StatusViewModel.swift
//  WhatsappClone
//
//  Created by mert can çifter on 25.11.2022.
//

import SwiftUI

class StatusViewModel: ObservableObject {
    
    @Published var status: UserStatus = .notConfigured
    
    func updateStatus(_ status: UserStatus) {
        self.status = status
    }
}


