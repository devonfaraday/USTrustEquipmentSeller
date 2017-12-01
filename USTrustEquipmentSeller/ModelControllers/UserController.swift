//
//  UserController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/30/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    // MARK: - Create
    func createUser(withUser user: User) {
        var uid = ""
        if let currentUser = Auth.auth().currentUser {
            uid = currentUser.uid
        }
        var newUser = user
        newUser.identifier = uid
        newUser.save()
    }
    
    // MARK: - Read
    func fetchUser(withIdentifier identifier: String, completion: @escaping (User?) -> Void) {
        let userRef = FirebaseController.databaseRef.child(.usersEndpoint).child(identifier)
        userRef.observeSingleEvent(of: .value, with: { (data) in
            guard let userDict = data.value as? [String: Any] else {
                completion(nil)
                return
            }
            guard let user = User(dictionary: userDict, identifier: identifier) else { return }
            completion(user)
        })
    }
    
    // MARK: - Update
    
    // MARK: - Delete
    
}
