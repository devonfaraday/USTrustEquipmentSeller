//
//  Listing.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class Listing: FirebaseType, Decodable {

    var catagoryIdentifier: String
    var companyIdentifier: String
    let created: Date
    var description: String
    var endpoint: String = .listingsEndpoint
    var experationDate: Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: updated)
    }
    var identifier: String?
    var imageURLReferences: [String]? = nil
    var images: [UIImage] = []
    var itemName: String
    var location: String
    var price: Double
    var quantity: Int
    var updated: Date
    
    var dictionaryCopy: JSONDictionary {
        return [.itemNameKey: itemName,
                .catagoryIdentifierKey: catagoryIdentifier,
                .descriptionKey: description,
                .priceKey: price,
                .locationKey: location,
                .imageKey: images,
                .companyIdentifierKey: companyIdentifier,
                .createdKey: created,
                .updatedKey: updated
        ]
    }
    
    init(itemName: String = "", quantity: Int = 1, catagoryIdentifer: String = "", description: String = "", price: Double = 0.0, location: String = "", images: [UIImage] = [], companyIdentifer: String = "", identifier: String = "", created: Date = Date(), updated: Date = Date()) {
        
        self.itemName = itemName
        self.quantity = quantity
        self.catagoryIdentifier = catagoryIdentifer
        self.description = description
        self.price = price
        self.location = location
        self.images = images
        self.companyIdentifier = companyIdentifer
        self.identifier = identifier
        self.created = created
        self.updated = updated
    }
    
    
    enum CodingKeys: String, CodingKey {
        case itemName
        case quantity
        case catagoryIdentifier
        case description
        case price
        case location
        case companyIdentifier
        case created
        case updated
        case imageURLReferences
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        itemName = try values.decode(String.self, forKey: .itemName)
        quantity = try values.decode(Int.self, forKey: .quantity)
        catagoryIdentifier = try values.decode(String.self, forKey: .catagoryIdentifier)
        description = try values.decode(String.self, forKey: .description)
        price = try values.decode(Double.self, forKey: .price)
        location = try values.decode(String.self, forKey: .location)
        companyIdentifier = try values.decode(String.self, forKey: .companyIdentifier)
        created = try values.decode(String.self, forKey: .created).toDate()
        updated = try values.decode(String.self, forKey: .updated).toDate()
        imageURLReferences = try values.decodeIfPresent([String].self, forKey: .imageURLReferences)
    }
    
}

extension Listing {
    enum CategoryType: String {
        case carpentry
        case masonry
        case excavating
        case plumbing
        case eletric
        case concrete
    }
    
    enum SubCategoryType {
        
    }
}
