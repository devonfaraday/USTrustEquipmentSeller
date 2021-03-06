//
//  Company.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

struct Company: FirebaseType {

    var companyName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var phoneNumber: String
    var rating: Int = 0
    var logoURL: URL?
    var logoImageReference: String?
    var einNumber: String
    var administratorAccountsIdentifiers: [String] = []
    var authorizedSellersIdentifiers: [String] = []
    var isBanned: Bool = false
    var isVerified: Bool = false
    var endpoint: String = .companiesEndpoint
    var identifier: String? = UUID().uuidString
    var dictionaryCopy: JSONDictionary {
        var returnDict: JSONDictionary = [.companyNameKey: companyName,
                          .streetAddressKey: streetAddress,
                          .cityKey: city,
                          .stateKey: state,
                          .zipCodeKey: zipCode,
                          .phoneKey: phoneNumber,
                          .ratingKey: rating,
                          .einNumberKey: einNumber,
                          .administratorAccountsIdentifierKey: administratorAccountsIdentifiers,
                          .authorizedSellersIdentifierKey: authorizedSellersIdentifiers,
                          .isBannedKey: isBanned,
                          .isVerifiedKey: isVerified
        ]
        if let logoImageReference = self.logoImageReference { returnDict[String.logoImageReferenceKey] = logoImageReference  }
        return returnDict
    }
    
    
    init(companyName: String, streetAddress: String, city: String, state: String, zipCode: String, phoneNumber: String, einNumber: String) {
        
        self.companyName = companyName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.phoneNumber = phoneNumber
        self.einNumber = einNumber
        
    }
    
    init?(dictionary: JSONDictionary, identifier: String) {
        guard let companyName = dictionary[.companyNameKey] as? String,
            let streetAddress = dictionary[.streetAddressKey] as? String,
            let city = dictionary[.cityKey] as? String,
            let state = dictionary[.stateKey] as? String,
            let zipCode = dictionary[.zipCodeKey] as? String,
            let phoneNumber = dictionary[.phoneKey] as? String,
            let rating = dictionary[.ratingKey] as? Int,
            // let logo = dictionary[.logoKey] as? UIImage,
            let einNumber = dictionary[.einNumberKey] as? String,
            let administratorAccountsIdentifiers = dictionary[.administratorAccountsIdentifierKey] as? [String],
            let authorizedSellersIdentifiers = dictionary[.authorizedSellersIdentifierKey] as? [String],
            let isBanned = dictionary[.isBannedKey] as? Bool,
            let isVerified = dictionary[.isVerifiedKey] as? Bool
            else { return nil }
        
        self.identifier = identifier
        self.companyName = companyName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.phoneNumber = phoneNumber
        self.rating = rating
        // self.logo = logo
        self.einNumber = einNumber
        self.administratorAccountsIdentifiers = administratorAccountsIdentifiers
        self.authorizedSellersIdentifiers = authorizedSellersIdentifiers
        self.isBanned = isBanned
        self.isVerified = isVerified
   
    }
    
}
