//
//  FirebaseController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/12/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
    
    static let shared = FirebaseController()
    static let databaseRef = Database.database().reference()
    static let storageRef = Storage.storage().reference()
    static let db = Firestore.firestore()
}

protocol FirebaseType {
    
    var endpoint: String { get }
    var identifier: String? { get set }
    var dictionaryCopy: JSONDictionary { get }
    
    mutating func save()
    func delete()
}

extension FirebaseType {
    
    func save() {
        guard let uid = identifier else { return }
        FirebaseController.db.collection(endpoint).document(uid).setData(dictionaryCopy) { (error) in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                
            }
        }
    }
    
    func delete() {
        guard let identifier = identifier else { return }
        FirebaseController.databaseRef.child(endpoint).child(identifier).removeValue()
    }
    
}
