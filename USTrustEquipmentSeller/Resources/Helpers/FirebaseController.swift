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
    let db = Firestore.firestore()
    
    init() {
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
    }
    
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
        let firebaseController = FirebaseController()
        guard let uid = identifier else { return }
        firebaseController.db.collection(endpoint).document(uid).setData(dictionaryCopy) { (error) in
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
