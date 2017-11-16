//
//  Company.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

struct CompanyProfile: FirebaseType {

    let companyName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var phone: String
    var rating: Int
    var logo: UIImage
    var einNumber: String
    var administratorAccountIdentifier: [String]
    var authorizedSellersIdentifier: [String]
    var authorizedBuyersIdentifier: [String]
    var isBanned: Bool
    var isVerified: Bool
    var endpoint: String = .companiesEndpoint
    var identifier: String?
    var dictionaryCopy: [String : Any] {
        return [.companyNameKey: companyName,
            .streetAddressKey: streetAddress,
            .cityKey: city,
            .stateKey: state,
            .zipCodeKey: zipCode,
            .phoneKey: phone,
            .ratingKey: rating,
            .logoKey: logo,
            .einNumberKey: einNumber,
            .administratorAccountIdentifierKey: administratorAccountIdentifier,
            .authorizedSellersIdentifierKey: authorizedSellersIdentifier,
            .authorizedBuyersIdentifierKey: authorizedBuyersIdentifier,
            .isBannedKey:isBanned,
            .isVerifiedKey: isVerified
            ]
    }
    
    
    init(companyName: String, streetAddress: String, city: String, state: String, zipCode: String, phone: String, rating: Int, logo: UIImage, einNumber: String, administratorAccountIdentifier: [String], authorizedSellersIdentifier: [String], authorizedBuyersIdentifier: [String], isBanned: Bool = false, isVerified: Bool = false, identifier: String) {
        
        self.companyName = companyName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.phone = phone
        self.rating = rating
        self.logo = logo
        self.einNumber = einNumber
        self.administratorAccountIdentifier = administratorAccountIdentifier
        self.authorizedSellersIdentifier = authorizedSellersIdentifier
        self.authorizedBuyersIdentifier = authorizedBuyersIdentifier
        self.isBanned = isBanned
        self.isVerified = isVerified
        self.identifier = identifier
        
    }
    
    init?(dictionary: JSONDictionary, identifier: String) {
        guard let companyName = dictionary[.companyNameKey] as? String,
            let streetAddress = dictionary[.streetAddressKey] as? String,
            let city = dictionary[.cityKey] as? String,
            let state = dictionary[.stateKey] as? String,
            let zipCode = dictionary[.zipCodeKey] as? String,
            let phone = dictionary[.phoneKey] as? String,
            let rating = dictionary[.ratingKey] as? Int,
            let logo = dictionary[.logoKey] as? UIImage,
            let einNumber = dictionary[.einNumberKey] as? String,
            let administratorAccountIdentifier = dictionary[.administratorAccountIdentifierKey] as? [String],
            let authorizedSellersIdentifier = dictionary[.authorizedSellersIdentifierKey] as? [String],
            let authorizedBuyersIdentifier = dictionary[.authorizedBuyersIdentifierKey] as? [String],
            let isBanned = dictionary[.isBannedKey] as? Bool,
            let isVerified = dictionary[.isVerifiedKey] as? Bool
            else { return nil }
        
        self.identifier = identifier
        self.companyName = companyName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.phone = phone
        self.rating = rating
        self.logo = logo
        self.einNumber = einNumber
        self.administratorAccountIdentifier = administratorAccountIdentifier
        self.authorizedSellersIdentifier = authorizedSellersIdentifier
        self.authorizedBuyersIdentifier = authorizedBuyersIdentifier
        self.isBanned = isBanned
        self.isVerified = isVerified
   
    }
    
}
