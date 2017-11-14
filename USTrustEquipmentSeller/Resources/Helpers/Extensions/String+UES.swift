//
//  String+UES.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

extension String {
    
    /* Firebase Endpoints*/
    static var userEndpoint: String { get { return "user" } }
    static var companyEndpoint: String { get { return "companyProfile" } }
    
    /* User Model Keys */
    static var firstNameKey: String { get { return "firstName" } }
    static var lastNameKey: String { get { return "lastName" } }
    static var streetAddressKey: String { get { return "streetAddress" } }
    static var cityKey: String { get { return "city" } }
    static var stateKey: String { get { return "state" } }
    static var zipCodeKey: String { get { return "zipCode" } }
    static var emailAddressKey: String { get { return "emailAddress" } }
    static var profileImageKey: String { get { return "profileImage" } }
    static var isBannedKey: String { get { return "isBanned" } }
    static var identifierKey: String { get { return "uid" } }
    
    /* Company Model Keys */
    static var companyNameKey: String { get { return "companyName" } }
    static var companyStreetAddressKey: String { get { return "companyStreetAddress" } }
    static var companyCityKey: String { get { return "companyCity" } }
    static var companyStateKey: String { get { return "companyState" } }
    static var companyZipCodeKey: String { get { return "companyZipCode" } }
    static var companyPhoneKey: String { get { return "companyPhone" } }
    static var companyRatingKey: String { get { return "companyRating" } }
    static var logoKey: String { get { return "logo" } }
    static var einNumberKey: String { get { return "einNumber" } }
    static var administratorAccountKey: String { get { return "administratorAccount" } }
    static var authorizedSellersKey: String { get { return "authorizedSellers" } }
    static var authorizedBuyersKey: String { get { return "authorizedBuyers" } }
    static var companyIsBannedKey: String { get { return "companyIsBanned" } }
    static var isVerifiedKey: String { get { return "isVerified" } }
}
