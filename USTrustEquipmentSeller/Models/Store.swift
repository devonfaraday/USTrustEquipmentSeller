//
//  Store.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/15/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import Firebase

class Store: FirebaseType {
    
    var storeName: String
    let storeType: String
    var listingsIdentifiers: [String]
    var storeOwnerIdentifier: String
    var identifier: String?
    var endpoint: String = .storesEndpoint
    
    var dictionaryCopy: [String : Any] {
        return [.storeNameKey: storeName,
                .storeTypeKey: storeType,
                .listingsIdentifiersKey: listingsIdentifiers,
                .storeOwnerIdentifierKey: storeOwnerIdentifier
        ]
    }
    
    init(storeName: String, storeType: String, listingsIdentifiers: [String], storeOwnerIdentifier: String, identifier: String) {
        
        self.storeName = storeName
        self.storeType = storeType
        self.listingsIdentifiers = listingsIdentifiers
        self.storeOwnerIdentifier = storeOwnerIdentifier
        self.identifier = identifier
        
    }
    
    required init?(dictionary: JSONDictionary, identifier: String) {
        guard let storeName = dictionary[.storeNameKey] as? String,
            let storeType = dictionary[.storeTypeKey] as? String,
            let listingsIdentifiers = dictionary[.listingsIdentifiersKey] as? [String],
            let storeOwnerIdentifier = dictionary[.storeOwnerIdentifierKey] as? String
            else { return nil }
        
        self.storeName = storeName
        self.storeType = storeType
        self.listingsIdentifiers = listingsIdentifiers
        self.storeOwnerIdentifier = storeOwnerIdentifier
        self.identifier = identifier
    }
    
    enum StoreType {
        case retail
        case rental
    }
    
}
