//
//  LoginViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let firebaseAuthentication = FirebaseAuthentication()
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IB Actions
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        login()
    }
    
    // MARK: - Login Functions
    func login() {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        firebaseAuthentication.signIn(withEmail: email, password: password) { (error) in
            if let error = error {
                print(error.localizedDescription)
                self.showAlert(withMessage: "Your email and/or password are incorrect")
            } else {
                let userController = UserController()
                print("Signed In")
                userController.fetchCurrentUser(completion: { (user) in
                    self.currentUser = user
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: .toUserProfileSegueKey, sender: self)
                    }
                })
            }
        }
    }
    
    // MARK: - Text Field Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if emailTextField.isFirstResponder {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
            login()
        }
        return true
    }
    
    // MARK: - Alert Controller
    func showAlert(withMessage message: String) {
        let alertController = UIAlertController(title: "Something went wrong", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String.toUserProfileSegueKey {
            guard let destinationController = segue.destination as? UserProfileViewController else { return }
            destinationController.currentUser = currentUser
        }
     }
 
    
}
