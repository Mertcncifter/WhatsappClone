//
//  WhatsappClone
//
//  Created by mert can çifter on 27.11.2022.
//

import Foundation

struct MessageViewModel {
    
    let message: Message
    
    init(_ message: Message){
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
}
