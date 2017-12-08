//
//  FirebaseAuthentication.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/4/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import FirebaseAuth

struct FirebaseAuthentication {
    
    func createUser(withEmail email: String, password: String, completion: @escaping(_ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping(_ error: Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(error)
            } else {
                completion(nil)
            }
        }
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError {
            print(signOutError.localizedDescription)
        }
    }
    
}
