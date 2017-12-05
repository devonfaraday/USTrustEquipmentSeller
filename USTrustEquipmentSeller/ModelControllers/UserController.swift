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
    func fetchCurrentUser(completion: @escaping(User?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else { completion(nil); return }
        let uid = currentUser.uid
        UserController().fetchUser(withIdentifier: uid) { (user) in
            print("User Fetched in profile")
            completion(user)
        }
    }
    
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
    
    func fetchUsers() {
        
    }
    
    // MARK: - Update
    func modifyUser(withUser user: User) {
        var modifiedUser = user
        modifiedUser.save()
    }
    
    // MARK: - Delete
    
}
