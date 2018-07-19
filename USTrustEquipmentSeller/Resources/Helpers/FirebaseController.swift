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
    
    mutating func save() {
        var ref: DocumentReference? = nil
        ref = FirebaseController.db.collection(endpoint).addDocument(data: dictionaryCopy) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func delete() {
        guard let identifier = identifier else { return }
        FirebaseController.databaseRef.child(endpoint).child(identifier).removeValue()
    }
    
}
