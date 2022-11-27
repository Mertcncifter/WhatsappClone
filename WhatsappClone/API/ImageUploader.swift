//
//  ImageUploader.swift
//  WhatsappClone
//
//  Created by mert can çifter on 26.11.2022.
//

import Firebase
import UIKit


struct ImageUploader{
    
    static func uploadImage(image : UIImage, completion : @escaping(String)-> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
                
        ref.putData(imageData,metadata: nil){ _ ,error in
            if let error = error{
                print("Failed to upload image")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
    }
}
