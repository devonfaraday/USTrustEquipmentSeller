//
//  Listing.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class Listing: FirebaseType, Equatable {

    let itemName: String
    let quantity: Int
    let catagoryIdentifier: String
    let description: String
    let price: Double
    let location: String
    var imageURLReferences: [String] = []
    var images: [UIImage] = []
    let companyIdentifier: String
    var endpoint: String = .listingsEndpoint
    var identifier: String?
    let created: Date
    var updated: Date
    
    var dictionaryCopy: JSONDictionary {
        return [.itemNameKey: itemName,
                .quantityKey: quantity,
                .catagoryIdentifierKey: catagoryIdentifier,
                .descriptionKey: description,
                .priceKey: price,
                .locationKey: location,
                .imageKey: images,
                .companyIdentifierKey: companyIdentifier,
                .createdKey: created,
                .updatedKey: updated
        ]
    }
    
    init(itemName: String, quantity: Int = 1, catagoryIdentifer: String, description: String, price: Double, location: String, images: [UIImage], companyIdentifer: String, identifier: String, created: Date = Date(), updated: Date = Date()) {
        
        self.itemName = itemName
        self.quantity = quantity
        self.catagoryIdentifier = catagoryIdentifer
        self.description = description
        self.price = price
        self.location = location
        self.images = images
        self.companyIdentifier = companyIdentifer
        self.identifier = identifier
        self.created = created
        self.updated = updated
        
    }
    
    required init?(dictionary: JSONDictionary, identifier: String) {
        guard let itemName = dictionary[.itemNameKey] as? String,
            let quantity = dictionary[.quantityKey] as? Int,
            let catagoryIdentifier = dictionary[.catagoryIdentifierKey] as? String,
            let description = dictionary[.descriptionKey] as? String,
            let price = dictionary[.priceKey] as? Double,
            let location = dictionary[.locationKey] as? String,
            let companyIdentifier = dictionary[.companyIdentifierKey] as? String,
            let createdString = dictionary[.createdKey] as? String,
            let created = createdString.toDate(),
            let updatedString = dictionary[.updatedKey] as? String,
            let updated = updatedString.toDate()
            else { return nil }
        self.identifier = identifier
        self.itemName = itemName
        self.quantity = quantity
        self.catagoryIdentifier = catagoryIdentifier
        self.description = description
        self.price = price
        self.location = location
        self.companyIdentifier = companyIdentifier
        self.created = created
        self.updated = updated
        // this will not work.  It's only here to silence warnings and errors.  The images will need their own network call to fetch the images fromt the firebase storage.
        if let images = dictionary[.imageKey] as? [UIImage] { self.images = images }
    }
}

extension Listing {
    enum CategoryType: String {
        case carpentry
        case masonry
        case excavating
        case plumbing
        case eletric
        case concrete
    }
    
    enum SubCategoryType {
        
    }
}

func ==(lhs: Listing, rhs: Listing) -> Bool {
    return lhs.identifier == rhs.identifier
}
