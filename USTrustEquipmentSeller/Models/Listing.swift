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
    let catagory: catagoryType
    let description: String
    let price: Double
    let location: String
    let image: [UIImage]
    let listingAccount: CompanyProfile
    var endpoint: String = .listingsEndpoint
    var identifier: String?
    let listingDate: Date
    
    var dictionaryCopy: [String : Any] {
        return [.itemKey: item,
                .catagoryKey: catagory,
                .descriptionKey: description,
                .priceKey: price,
                .locationKey: location,
                .imageKey: image,
                .listingAccountKey: listingAccount,
                .listingDateKey: listingDate
        ]
    }
    
    init(item: String, catagory: catagoryType, description: String, price: Double, location: String, image: [UIImage], listingAccount: CompanyProfile, identifier: String, listingDate: Date = Date()) {
        
        self.item = item
        self.catagory = catagory
        self.description = description
        self.price = price
        self.location = location
        self.image = image
        self.listingAccount = listingAccount
        self.identifier = identifier
        self.listingDate = listingDate
        
    }
    
    required init?(dictionary: JSONDictionary, identifier: String) {
        guard let item = dictionary[.itemKey] as? String,
              let catagory = dictionary[.catagoryKey] as? catagoryType,
              let description = dictionary[.descriptionKey] as? String,
              let price = dictionary[.priceKey] as? Double,
              let location = dictionary[.locationKey] as? String,
              let image = dictionary[.imageKey] as? [UIImage],
              let listingAccount = dictionary[.listingAccountKey] as? CompanyProfile,
              let listingDate = dictionary[.listingDateKey] as? Date
            else { return nil }
        
        self.identifier = identifier
        self.item = item
        self.catagory = catagory
        self.description = description
        self.price = price
        self.location = location
        self.image = image
        self.listingAccount = listingAccount
        self.listingDate = listingDate
        
    }
    
    enum catagoryType {
        case heavyEquipment
        case powerTools
    }
    
}
