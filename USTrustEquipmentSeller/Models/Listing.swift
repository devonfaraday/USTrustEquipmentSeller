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
    
    var dictionaryCopy: [String : Any] {
        return [.itemNameKey: itemName,
                .quantityKey: quantity,
                .catagoryIdentifierKey: catagoryIdentifier,
                .descriptionKey: description,
                .priceKey: price,
                .locationKey: location,
                .imageKey: images,
                .companyIdentifierKey: companyIdentifier,
                .createdKey: created
        ]
    }
    
    init(itemName: String, quantity: Int = 1, catagoryIdentifer: String, description: String, price: Double, location: String, images: [UIImage], companyIdentifer: String, identifier: String, created: Date = Date()) {
        
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
        
    }
    
    required init?(dictionary: JSONDictionary, identifier: String) {
        guard let itemName = dictionary[.itemNameKey] as? String,
              let quantity = dictionary[.quantityKey] as? Int,
              let catagoryIdentifier = dictionary[.catagoryIdentifierKey] as? String,
              let description = dictionary[.descriptionKey] as? String,
              let price = dictionary[.priceKey] as? Double,
              let location = dictionary[.locationKey] as? String,
              let companyIdentifier = dictionary[.companyIdentifierKey] as? String,
              let created = dictionary[.createdKey] as? Date
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
        if let images = dictionary[.imageKey] as? [UIImage] { self.images = images }
        
    }
  
    enum CatagoryType {
        case heavyEquipment
        case powerTools
    }
    
}

func ==(lhs: Listing, rhs: Listing) -> Bool {
    return lhs.identifier == rhs.identifier
}
