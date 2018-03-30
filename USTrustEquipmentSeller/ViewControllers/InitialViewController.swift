//
//  InitialViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class InitialViewController: UIViewController {
    
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        try? Auth.auth().signOut()
        checkAuthentication()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func checkAuthentication() {
        if Auth.auth().currentUser != nil {
            fetchCurrentUser(completion: { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: .toUserProfileSegueKey, sender: self)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: .toLoginSegueKey, sender: self)
                    }
                }
            })
        } else {
                print("No User signed in")
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: .toLoginSegueKey, sender: self)
            }
            
        }
    }
    
    func fetchCurrentUser(completion: @escaping(_ success: Bool) -> Void) {
        guard let currentUser = Auth.auth().currentUser else { completion(false); return }
        let uid = currentUser.uid
        UserController().fetchUser(withIdentifier: uid) { (user) in
            print("User Fetched in profile")
            if user != nil {
                self.currentUser = user
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func segueToUserProfile(withSegue segue: UIStoryboardSegue) {
        guard let destination = segue.destination as? UserProfileViewController else { return }
        destination.currentUser = currentUser
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case String.toUserProfileSegueKey?:
            segueToUserProfile(withSegue: segue)
        default:
            print("not logged in")
        }
    }
}
