//
//  User.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

class User {
    
    let firstName: String
    let lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var phone: String
    var emailAddress: String
    var personalRating: Int?
    var company: CompanyProfile?
    var listings: [Listing]?
    var isBanned: Bool
    let uuid: String
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, phone: String, emailAddress: String, personalRating: Int?, company: CompanyProfile?, listings: [Listing]?, isBanned: Bool = false, uuid: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.phone = phone
        self.emailAddress = emailAddress
        self.personalRating = personalRating
        self.company = company
        self.listings = listings
        self.isBanned = isBanned
        self.uuid = uuid
        
    }
    
}


