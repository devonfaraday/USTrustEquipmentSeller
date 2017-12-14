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
    func createListingImages(withImageData imageDataArray: [Data], forCompany company: Company) {
        guard let companyId = company.identifier else { return }
        let storageRef = storage.reference()
        let imageRef = storageRef.child("\(String.imagesEndpointKey)/\(companyId)/\(UUID().uuidString).jpg")
        for imageData in imageDataArray {
        let uploadTask = imageRef.putData(imageData, metadata: nil) { (storageMetaData, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
            uploadTask.resume()
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
