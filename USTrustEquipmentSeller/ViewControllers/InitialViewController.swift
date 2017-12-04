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
        checkAuthentication()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func checkAuthentication() {
        if Auth.auth().currentUser != nil {
            fetchCurrentUser {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: .toUserProfileSegueKey, sender: self)
                }
            }
        } else {
            print("No User signed in")
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: .toLoginSegueKey, sender: self)
            }
            
        }
    }
    
    func fetchCurrentUser(completion: @escaping() -> Void) {
        guard let currentUser = Auth.auth().currentUser else { completion(); return }
        let uid = currentUser.uid
        UserController().fetchUser(withIdentifier: uid) { (user) in
            print("User Fetched in profile")
            self.currentUser = user
            completion()
        }
    }
    
}
