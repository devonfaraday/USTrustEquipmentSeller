//
//  Listing.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class Listing {
    
    let item: String
    let catagory: catagoryType
    let description: String
    let price: Double
    let location: String
    let image: UIImage
    let listingAccount: CompanyProfile
    let listingID: String
    let listingDate: Date
    
    init(item: String, catagory: catagoryType, description: String, price: Double, location: String, image: UIImage, listingAccount: CompanyProfile, listingID: String, listingDate: Date = Date()) {
        
        self.item = item
        self.catagory = catagory
        self.description = description
        self.price = price
        self.location = location
        self.image = image
        self.listingAccount = listingAccount
        self.listingID = listingID
        self.listingDate = listingDate
        
    }
    
    enum catagoryType {
        case heavyEquipment
        case powerTools
    }
    
}
