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
    var companyStreetAddress: String
    var companyCity: String
    var companyState: String
    var companyZipCode: String
    var companyPhone: String
    var companyRating: Int
    var logo: UIImage
    var einNumber: String
    var administratorAccount: User
    var authorizedSellers: [User]
    var authorizedBuyers: [User]
    var companyIsBanned: Bool
    var isVerified: Bool
    var endpoint: String = .companyEndpoint
    var identifier: String?
    var dictionaryCopy: [String : Any] {
        return [.companyNameKey: companyName,
            .companyStreetAddressKey: companyStreetAddress,
            .companyCityKey: companyCity,
            .companyStateKey: companyState,
            .companyZipCodeKey: companyZipCode,
            .companyPhoneKey: companyPhone,
            .companyRatingKey: companyRating,
            .logoKey: logo,
            .einNumberKey: einNumber,
            .administratorAccountKey: administratorAccount,
            .authorizedSellersKey: authorizedSellers,
            .authorizedBuyersKey: authorizedBuyers,
            .companyIsBannedKey: companyIsBanned,
            .isVerifiedKey: isVerified
            ]
    }
    
    
    init(companyName: String, companyStreetAddress: String, companyCity: String, companyState: String, companyZipCode: String, companyPhone: String, companyRating: Int, logo: UIImage, einNumber: String, administratorAccount: User, authorizedSellers: [User], authorizedBuyers: [User], companyIsBanned: Bool = false, isVerified: Bool = false, identifier: String) {
        
        self.companyName = companyName
        self.companyStreetAddress = companyStreetAddress
        self.companyCity = companyCity
        self.companyState = companyState
        self.companyZipCode = companyZipCode
        self.companyPhone = companyPhone
        self.companyRating = companyRating
        self.logo = logo
        self.einNumber = einNumber
        self.administratorAccount = administratorAccount
        self.authorizedSellers = authorizedSellers
        self.authorizedBuyers = authorizedBuyers
        self.companyIsBanned = companyIsBanned
        self.isVerified = isVerified
        self.identifier = identifier
        
    }
    
    init?(dictionary: JSONDictionary, identifier: String) {
        guard let companyName = dictionary[.companyNameKey] as? String,
            let companyStreetAddress = dictionary[.companyStreetAddressKey] as? String,
            let companyCity = dictionary[.companyCityKey] as? String,
            let companyState = dictionary[.companyStateKey] as? String,
            let companyZipCode = dictionary[.companyZipCodeKey] as? String,
            let companyPhone = dictionary[.companyPhoneKey] as? String,
            let companyRating = dictionary[.companyRatingKey] as? Int,
            let logo = dictionary[.logoKey] as? UIImage,
            let einNumber = dictionary[.einNumberKey] as? String,
            let administratorAccount = dictionary[.administratorAccountKey] as? User,
            let authorizedSellers = dictionary[.authorizedSellersKey] as? [User],
            let authorizedBuyers = dictionary[.authorizedBuyersKey] as? [User],
            let companyIsBanned = dictionary[.companyIsBannedKey] as? Bool,
            let isVerified = dictionary[.isVerifiedKey] as? Bool
            else { return nil }
        
        self.identifier = identifier
        self.companyName = companyName
        self.companyStreetAddress = companyStreetAddress
        self.companyCity = companyCity
        self.companyState = companyState
        self.companyZipCode = companyZipCode
        self.companyPhone = companyPhone
        self.companyRating = companyRating
        self.logo = logo
        self.einNumber = einNumber
        self.administratorAccount = administratorAccount
        self.authorizedSellers = authorizedSellers
        self.authorizedBuyers = authorizedBuyers
        self.companyIsBanned = companyIsBanned
        self.isVerified = isVerified
   
    }
    
}
