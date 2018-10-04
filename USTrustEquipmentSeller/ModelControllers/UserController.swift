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
    
    static let shared = UserController()
    var user: User?
    
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
        guard let currentUser = Auth.auth().currentUser
            else { completion(nil); return }
        let uid = currentUser.uid
        let userController: UserController = UserController()
        userController.fetchUser(withIdentifier: uid) { (user) in
            print("User Fetched in profile")
            completion(user)
        }
    }
    
    func fetchUser(withIdentifier identifier: String, completion: @escaping (User?) -> Void) {
        let firebaseController = FirebaseController()
        let docRef = firebaseController.db.collection(String.usersEndpoint).document(identifier)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists,
                let dataDictionary = document.data(),
                let userData: Data = try? JSONSerialization.data(withJSONObject: dataDictionary) {
//                let user: User? = try? JSONDecoder().decode(User.self, from: userData)
                let user = User(dictionaryRepresentation: dataDictionary, uid: identifier)
                completion(user)
            } else {
                print("Document does not exist")
            }
        }
    }
    
//    func fetchUser(withIdentifier identifier: String, completion: @escaping (User?) -> Void) {
//        let userRef = FirebaseController.databaseRef.child(.usersEndpoint).child(identifier)
//        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let value = snapshot.value as? JSONDictionary else { return }
//            do {
//                let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
//                var user = try JSONDecoder().decode(User.self, from: jsonData)
//                user.identifier = identifier
//                UserController.shared.user = user
//                completion(user)
//            } catch {
//                completion(nil)
//            }
//        })
//    }
    
    func fetchUsers() {
        
    }
    
    // MARK: - Update
    func modifyUser(withUser user: User) {
        let modifiedUser = user
        modifiedUser.save()
    }
    
    // MARK: - Delete
    
}
