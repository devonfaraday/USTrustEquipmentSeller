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
    
    let firstName: String
    let lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var emailAddress: String
    var profileImage: UIImage?
    var phoneNumber: Int?
    var isBanned: Bool = false
    var endpoint: String = .usersEndpoint
    var identifier: String?
    var username: String
    
    var dictionaryCopy: [String : Any] {
        return [.firstNameKey: firstName,
                .lastNameKey: lastName,
                .streetAddressKey: streetAddress,
                .cityKey: city,
                .stateKey: state,
                .zipCodeKey: zipCode,
                .emailAddressKey: emailAddress,
                .phoneKey: phoneNumber as Any,
                .isBannedKey: isBanned,
                .usernameKey: username]
    }
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, emailAddress: String, username: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.emailAddress = emailAddress
        self.username = username
     }
    
    init?(dictionary: JSONDictionary, identifier: String) {
        guard let firstName = dictionary[.firstNameKey] as? String,
            let lastName = dictionary[.lastNameKey] as? String,
            let streetAddress = dictionary[.streetAddressKey] as? String,
            let city = dictionary[.cityKey] as? String,
            let state = dictionary[.stateKey] as? String,
            let zipCode = dictionary[.zipCodeKey] as? String,
            let emailAddress = dictionary[.emailAddressKey] as? String,
            let isBanned = dictionary[.isBannedKey] as? Bool,
            let username = dictionary[.usernameKey] as? String
            else { return nil }
        
        self.identifier = identifier
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.emailAddress = emailAddress
        self.isBanned = isBanned
        self.username = username
        if let phoneNumber = dictionary[.phoneKey] as? Int { self.phoneNumber = phoneNumber }
        if let profileImage = dictionary[.imageKey] as? UIImage { self.profileImage = profileImage }
    }
}


