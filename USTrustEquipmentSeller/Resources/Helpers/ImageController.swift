//
//  ImageController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/4/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import FirebaseStorage

class ImageController {
    let storage = Storage()
    
    // MARK: - Create
    func createProfileImage(withImageData imageData: Data, forUser user: User?) {
        guard let userId = user?.identifier else { return }
        let storageRef = storage.reference()
        let imageRef = storageRef.child("\(String.imagesEndpointKey)/\(String.profileImagesEndpointKey)/\(userId)/\(UUID().uuidString)")
        let metaData = StorageMetadata()
        metaData.contentType = "images/jpeg"
        imageRef.putData(imageData, metadata: metaData) { (storageMetaData, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Read
    func fetchImage() {
        
    }
    
    func fetchImages() {
        
    }
    
    // MARK: - Update
    func updateImage() {
        
    }
    
    // MARK: - Delete
    func deleteImage()  {
        
    }
}
