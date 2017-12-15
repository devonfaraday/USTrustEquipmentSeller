//
//  ImageController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/4/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import FirebaseStorage

class ImageController {
    let storageRef = Storage().reference()
    
    // MARK: - Create
    func createListingImages(withImageData imageDataArray: [Data], forCompany company: CompanyProfile, underListingEndpoint listing: Listing) {
        guard let companyId = company.identifier,
            let listingID = listing.identifier
        else { return }
        let imageRef = storageRef.child("\(String.imagesEndpointKey)/\(companyId)/\(listing.endpoint)/\(listingID)/\(UUID().uuidString).jpg")
        for imageData in imageDataArray {
            DispatchQueue.global().async {
                let uploadTask = imageRef.putData(imageData, metadata: nil) { (storageMetaData, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let metaData = storageMetaData {
                        guard let downloadURL = metaData.downloadURL() else { return }
                        let urlString = downloadURL.absoluteString
                        let listingToModify = listing
                        listingToModify.imageURLs.append(urlString)
                        listingToModify.saveListing(toCompany: company)
                    }
                }
                uploadTask.resume()
            }
        }
    }
    
    func createLogo(withImageData imageData: Data, forCompany company: CompanyProfile) {
        guard let companyId = company.identifier else { return }
        let logoRef = storageRef.child("\(String.imagesEndpointKey)/\(companyId)/\(String.logoKey)/\(UUID().uuidString).jpg")
        let uploadTask = logoRef.putData(imageData, metadata: nil) { (metaData, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let metaData = metaData {
                guard let downloadURL = metaData.downloadURL() else { return }
                let modifiedCompany = company
                // modifiedCompany.logoURL = downloadURL
                modifiedCompany.save()
            }
        }
        uploadTask.resume()
    }
    
    // MARK: - Read
    func fetchImage(fromURL url: URL, completion: @escaping() -> Void) {
        
    }
    
    func fetchImages(fromURLs urls: [URL], completion: @escaping() -> Void) {
        
    }
    
    // MARK: - Update
    func updateImage(withURL url: URL) {
        
    }
    
    // MARK: - Delete
    func deleteImage(atURL url: URL)  {
        
    }
}
