//
//  Company.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class CompanyProfile {
    
    let companyName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var phone: String
    var companylRating: Int?
    var logo: UIImage
    var einNumber: String
    var administratorAccount: User
    var authorizedSellers: [User]?
    var authorizedBuyers: [User]?
    var isBanned: Bool
    var isVerified: Bool
    let uuid: String
    
    init(companyName: String, streetAddress: String, city: String, state: String, zipCode: String, phone: String, companyRating: Int?, logo: UIImage, einNumber: String, administratorAccount: User, authorizedSellers: [User], authorizedBuyers: [User], isBanned: Bool = false, isVerified: Bool = false, uuid: String) {
        
        self.companyName = companyName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.phone = phone
        self.companylRating = companyRating
        self.logo = logo
        self.einNumber = einNumber
        self.administratorAccount = administratorAccount
        self.authorizedSellers = authorizedSellers
        self.authorizedBuyers = authorizedBuyers
        self.isBanned = isBanned
        self.isVerified = isVerified
        self.uuid = uuid
        
    }
    
}
