//
//  User.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit
import Firebase

struct User: FirebaseType {
    
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var companyWatchList: [String] = []
    var state: String
    var zipCode: String
    var email: String
    var phoneNumber: String
    var isBanned: Bool = false
    var endpoint: String = .usersEndpoint
    var identifier: String?
    var username: String
    var listingWatchList: [String] = []
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var dictionaryCopy: [String : Any] {
        return [.firstNameKey: firstName,
                .lastNameKey: lastName,
                .streetAddressKey: streetAddress,
                .companyWatchListKey: companyWatchList,
                .cityKey: city,
                .stateKey: state,
                .listingWatchListKey: listingWatchList,
                .zipCodeKey: zipCode,
                .emailKey: email,
                .phoneKey: phoneNumber,
                .isBannedKey: isBanned,
                .usernameKey: username]
    }
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, email: String, username: String, phoneNumber: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.email = email
        self.username = username
        self.phoneNumber = phoneNumber
     }
    
    init?(dictionary: JSONDictionary, identifier: String) {
        guard let firstName = dictionary[.firstNameKey] as? String,
            let lastName = dictionary[.lastNameKey] as? String,
            let streetAddress = dictionary[.streetAddressKey] as? String,
            let city = dictionary[.cityKey] as? String,
            let state = dictionary[.stateKey] as? String,
            let zipCode = dictionary[.zipCodeKey] as? String,
            let email = dictionary[.emailKey] as? String,
            let isBanned = dictionary[.isBannedKey] as? Bool,
            let username = dictionary[.usernameKey] as? String,
            let phoneNumber = dictionary[.phoneKey] as? String
            else { return nil }
        
        self.identifier = identifier
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.email = email
        self.isBanned = isBanned
        self.username = username
        self.phoneNumber = phoneNumber
        
        if let companyWatchList = dictionary[.companyWatchListKey] as? [String] { self.companyWatchList = companyWatchList }
        if let listingWatchList = dictionary[.listingWatchListKey] as? [String] { self.listingWatchList = listingWatchList }
        }
    }



