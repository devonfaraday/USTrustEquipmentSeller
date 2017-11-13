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

class User: FirebaseType {
    
    let firstName: String
    let lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var emailAddress: String
    var profileImage: UIImage
    var isBanned: Bool
    let uuid: String
    
    var dictionaryCopy: [String:Any] {
        return [.firstNameKey: firstName,
            .lastNameKey: lastName,
            .streetAddressKey: streetAddress,
            .cityKey: city,
            .stateKey: state,
            .zipCodeKey: zipCode,
            .emailAddressKey: emailAddress,
            .profileImageKey: profileImage,
            .isBannedKey: isBanned,
            .uuidKey: uuid]
    }
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, emailAddress: String, profileImage: UIImage, isBanned: Bool = false, uuid: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.emailAddress = emailAddress
        self.profileImage = profileImage
        self.isBanned = isBanned
        self.uuid = uuid
        
    }
    
    init?(dictionary: JSONDictionary, identifier: String) {
        guard let firstName = dictionary[.firstNameKey] as? String,
            let lastName = dictionary[.lastNameKey] as? String,
            let streetAddress = dictionary[.streetAddressKey] as? String,
            let city = dictionary[.cityKey] as? String,
            let state = dictionary[.stateKey] as? String,
            let zipCode = dictionary[.zipCodeKey] as? String,
            let emailAddress = dictionary[.emailAddressKey] as? String,
            let profileImage = dictionary[.profileImageKey] as? UIImage,
            let isBanned = dictionary[.isBannedKey] as? Bool,
            let uuid = dictionary[.uuidKey] as? String
        else { return nil }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.emailAddress = emailAddress
        self.profileImage = profileImage
        self.isBanned = isBanned
        self.uuid = uuid
        
    }
    
}


