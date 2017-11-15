//
//  Store.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/14/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
class Store: FirebaseType {
    
    var storeName: String
    let storeType: storeType
    var listings: [Listing]
    var storeOwner: CompanyProfile
    var identifier: String?
    var endpoint: String = .storesEndpoint
    
    var dictionaryCopy: [String : Any] {
        return [.storeNameKey: storeName,
                .storeTypeKey: storeType,
                .listingsKey: listings,
                .storeOwnerKey: storeOwner
                ]
    }
    
    init(storeName: String, storeType: storeType, listings: [Listing], storeOwner: CompanyProfile, identifier: String) {
        
        self.storeName = storeName
        self.storeType = storeType
        self.listings = listings
        self.storeOwner = storeOwner
        self.identifier = identifier
        
    }

    required init?(dictionary: JSONDictionary, identifier: String) {
        guard let storeName = dictionary[.storeNameKey] as? String,
              let storeTyper = dictionary[.storeTypeKey] as? storeType,
              let listings = dictionary[.listingsKey] as? [Listing],
              let storeOwner = dictionary[.storeOwnerKey] as? CompanyProfile
        else { return nil }
        
        self.storeName = storeName
        self.storeType = storeType
        self.listings = listings
        self.storeOwner = storeOwner
        self.identifier = identifier
    }

    enum storeType {
        case retail
        case rental
    }
    
}
