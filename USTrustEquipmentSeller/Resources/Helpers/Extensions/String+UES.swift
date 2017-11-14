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
    static var usersEndpoint: String { get { return "users" } }
    static var companiesEndpoint: String { get { return "companies" } }
    static var storesEndpoint: String { get { return "stores" } }
    static var listingsEndpoint: String { get { return "listings" } }
    
    /*  Model Keys */
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
    
    static var companyNameKey: String { get { return "companyName" } }
    static var phoneKey: String { get { return "phone" } }
    static var ratingKey: String { get { return "rating" } }
    static var logoKey: String { get { return "logo" } }
    static var einNumberKey: String { get { return "einNumber" } }
    static var administratorAccountKey: String { get { return "administratorAccount" } }
    static var authorizedSellersKey: String { get { return "authorizedSellers" } }
    static var authorizedBuyersKey: String { get { return "authorizedBuyers" } }
    static var isVerifiedKey: String { get { return "isVerified" } }
}
