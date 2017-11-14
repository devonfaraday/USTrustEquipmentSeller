//
//  Store.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/14/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
class Store: FirebaseType {
    
    var storyName: String
    let storeType: storeType
    var listings: [Listing]
    var identifier: String?
    var endpoint: String
    
    var dictionaryCopy: [String : Any] {
        return ["":""]
    }
    
    
    
    required init?(dictionary: JSONDictionary, identifier: String) {
        <#code#>
    }
    
    
    enum storeType {
        case sales
        case rentals
    }
    
}
