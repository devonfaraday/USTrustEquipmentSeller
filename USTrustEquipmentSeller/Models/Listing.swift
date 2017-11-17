//
//  Listing.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class Listing: FirebaseType {

    let item: String
    let quantity: Int
    let catagoryIdentifier: String
    let description: String
    let price: Double
    let location: String
    let images: [UIImage]
    let listingAccountIdentifier: String
    var endpoint: String = .listingsEndpoint
    var identifier: String?
    let listingDate: Date
    
    var dictionaryCopy: [String : Any] {
        return [.itemKey: item,
                .quantityKey: quantity,
                .catagoryIdentifierKey: catagoryIdentifier,
                .descriptionKey: description,
                .priceKey: price,
                .locationKey: location,
                .imageKey: images,
                .listingAccountIdentifierKey: listingAccountIdentifier,
                .listingDateKey: listingDate
        ]
    }
    
    init(item: String, quantity: Int, catagoryIdentifer: String, description: String, price: Double, location: String, images: [UIImage], listingAccountIdentifer: String, identifier: String, listingDate: Date = Date()) {
        
        self.item = item
        self.quantity = quantity
        self.catagoryIdentifier = catagoryIdentifer
        self.description = description
        self.price = price
        self.location = location
        self.images = images
        self.listingAccountIdentifier = listingAccountIdentifer
        self.identifier = identifier
        self.listingDate = listingDate
        
    }
    
    required init?(dictionary: JSONDictionary, identifier: String) {
        guard let item = dictionary[.itemKey] as? String,
              let quantity = dictionary[.quantityKey] as? Int,
              let catagoryIdentifier = dictionary[.catagoryIdentifierKey] as? String,
              let description = dictionary[.descriptionKey] as? String,
              let price = dictionary[.priceKey] as? Double,
              let location = dictionary[.locationKey] as? String,
              let images = dictionary[.imageKey] as? [UIImage],
              let listingAccountIdentifer = dictionary[.listingAccountIdentifierKey] as? String,
              let listingDate = dictionary[.listingDateKey] as? Date
            else { return nil }
        
        self.identifier = identifier
        self.item = item
        self.quantity = quantity
        self.catagoryIdentifier = catagoryIdentifier
        self.description = description
        self.price = price
        self.location = location
        self.images = images
        self.listingAccountIdentifier = listingAccountIdentifer
        self.listingDate = listingDate
        
    }
  
    enum CatagoryType {
        case heavyEquipment
        case powerTools
    }
    
}
