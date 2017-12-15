//
//  ListingController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/14/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class ListingController {
    
    // MARK: - Create
    func createListing(withListing listing: Listing, forCompany company: CompanyProfile) {
        var newListing = listing
        newListing.save()
    }
    
    // MARK: - Read
    func fetchListing(withIdentifier identifier: String, completion: @escaping(Listing?) -> Void) {
        let listingRef = FirebaseController.databaseRef.child(.listingsEndpoint).child(identifier)
        listingRef.observeSingleEvent(of: .value, with: { (data) in
            guard let listingDict = data.value as? [String: Any] else {
                completion(nil)
                return
            }
            let listing = Listing(dictionary: listingDict, identifier: identifier)
            completion(listing)
        })
    }
    
    func fetchAllListings(competion: @escaping([Listing]) -> Void)  {
        let listingsRef = FirebaseController.databaseRef.child(.listingsEndpoint)
        listingsRef.observeSingleEvent(of: .value) { (data) in
            guard let listingsDict = data.value as? [String: Any] else { return }
            let listings = listingsDict.flatMap { Listing(dictionary: $0.value as! JSONDictionary, identifier: $0.key) }
            competion(listings)
        }
    }
    
    // MARK: - Update
    func update(withListing listing: Listing) {
        var modifiedListing = listing
        modifiedListing.save()
    }
    
    // MARK: - Delete
    func deleteListing(withIdentifier identifier: String) {
        let listingRef = FirebaseController.databaseRef.child(.listingsEndpoint).child(identifier)
        listingRef.removeValue()
    }
}
