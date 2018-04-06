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
    var companyReference: String? = nil
    var companyWatchList: [String]? = nil
    var state: String
    var zipCode: String
    var email: String
    var phoneNumber: String
    var isBanned: Bool = false
    var endpoint: String = .usersEndpoint
    var identifier: String?
    var listingWatchList: [String]? = nil
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case streetAddress
        case companyReference
        case companyWatchList
        case city
        case state
        case listingWatchList
        case zipCode
        case email
        case phoneNumber
        case isBanned
        case identifier
    }
    
    var dictionaryCopy: JSONDictionary {
        return [.firstNameKey: firstName,
                .lastNameKey: lastName,
                .streetAddressKey: streetAddress,
                .companyReferenceKey: companyReference ?? "",
                .companyWatchListKey: companyWatchList ?? [],
                .cityKey: city,
                .stateKey: state,
                .listingWatchListKey: listingWatchList ?? [],
                .zipCodeKey: zipCode,
                .emailKey: email,
                .phoneKey: phoneNumber,
                .isBannedKey: isBanned]
    }
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, email: String, username: String, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.email = email
        self.phoneNumber = phoneNumber
     }
}

// MARK: - Decoder
extension User: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        streetAddress = try values.decode(String.self, forKey: .streetAddress)
        companyReference = try values.decodeIfPresent(String.self, forKey: .companyReference)
        companyWatchList = try values.decodeIfPresent([String].self, forKey: .companyWatchList)
        city = try values.decode(String.self, forKey: .city)
        state = try values.decode(String.self, forKey: .state)
        zipCode = try values.decode(String.self, forKey: .zipCode)
        isBanned = try values.decode(Bool.self, forKey: .isBanned)
        email = try values.decode(String.self, forKey: .email)
        phoneNumber = try values.decode(String.self, forKey: .phoneNumber)
        listingWatchList = try values.decodeIfPresent([String].self, forKey: .listingWatchList)
    }
}



