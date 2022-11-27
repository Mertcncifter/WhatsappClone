//
//  UIApplication+Extension.swift
//  WhatsappClone
//
//  Created by mert can çifter on 25.11.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
