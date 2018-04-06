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
    func createListing(withListing listing: Listing, forCompany company: Company) {
        var newListing = listing
        newListing.save()
    }
    
    // MARK: - Read
    func fetchListing(withIdentifier identifier: String, completion: @escaping(Listing?) -> Void) {
        let listingRef = FirebaseController.databaseRef.child(.listingsEndpoint).child(identifier)
        listingRef.observeSingleEvent(of: .value, with: { (data) in
            guard let value = data.value as? JSONDictionary else { return }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                let listing = try JSONDecoder().decode(Listing.self, from: jsonData)
                completion(listing)
            } catch  {
                completion(nil)
            }
            
        })
    }
    
    func fetchAllListings(competion: @escaping([Listing]) -> Void)  {
        let listingsRef = FirebaseController.databaseRef.child(.listingsEndpoint)
        listingsRef.observeSingleEvent(of: .value) { (snapshot) in
            // the dictionary key is the identifier
            guard let values = snapshot.value as? [JSONDictionary] else { return }
            var listings: [Listing] = []
            for value in values {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                    let listing = try JSONDecoder().decode(Listing.self, from: jsonData)
                    listings.append(listing)
                } catch {
                    print("YOU SUCK")
                }
                competion(listings)
            }
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
