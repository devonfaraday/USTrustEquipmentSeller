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
                        var listingToModify = listing
                        listingToModify.imageURLReferences.append(metaData.bucket)
                        listingToModify.save()
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
                var modifiedCompany = company
                // modifiedCompany.logoURL = downloadURL
                modifiedCompany.save()
            }
        }
        uploadTask.resume()
    }
    
    // MARK: - Read
    func fetchImage(withURL url: URL, completion: @escaping(UIImage?) -> Void) {
        let downloadRef = storageRef
            var image: UIImage?
            if let imageData = try? Data(contentsOf: url) {
                image = UIImage(data: imageData, scale: 1)
                completion(image)
            } else {
                completion(nil)
            }
    }
    
    func fetchImages(withURLs urls: [URL], completion: @escaping([UIImage]) -> Void) {
        var images = [UIImage]()
        for url in urls {
            DispatchQueue.global().async {
                self.fetchImage(withURL: url, completion: { (image) in
                    guard let image = image else { return }
                    images.append(image)
                })
            }
        }
        completion(images)
    }
    
    // MARK: - Update
    func updateImage(withURL url: URL) {
        
    }
    
    // MARK: - Delete
    func deleteImage(withURLReference reference: String)  {
        let deleteRef = storageRef.child(reference)
        deleteRef.delete { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("image deleted successfully")
            }
        }
    }
}
