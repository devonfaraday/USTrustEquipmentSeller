//
//  UsernameViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/30/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class UsernameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var verifyPasswordTextField: UITextField!
    
    let firebaseAuthentication = FirebaseAuthentication()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        signUp()
    }
    
    func createUsernameAndPassword() {
        if checkIfTextFieldIsEmpty(textField: usernameTextField, addMessageIfEmpty: "Please enter a username") &&
            checkIfTextFieldIsEmpty(textField: passwordTextField, addMessageIfEmpty: "Please enter your password") &&
            checkIfTextFieldIsEmpty(textField: verifyPasswordTextField, addMessageIfEmpty: "Please verify your password") {
        }
    }
    
    func checkIfTextFieldIsEmpty(textField: UITextField, addMessageIfEmpty message: String) -> Bool {
        var success = false
        if let textFieldText = textField.text {
            if textFieldText.isEmpty || textFieldText == "" {
                showAlert(withMessage: message)
                success = false
            } else {
                success = true
            }
        }
        return success
    }
    
    func createUser() {
        guard let username = usernameTextField.text else { return }
            user?.username = username
            user?.save()
        
    }
    
    func signUp() {
        guard let email = user?.email,
            let password = passwordTextField.text,
            let verify = verifyPasswordTextField.text else { return }
        if password == verify {
            firebaseAuthentication.createUser(withEmail: email, password: password, completion: { (error) in
                if let error = error {
                    print(error.localizedDescription)
                    self.showAlert(withMessage: error.localizedDescription)
                } else {
                    self.createUser()
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: .toUserProfileSegueKey, sender: self)
                    }
                }
            })
        } else {
            showAlert(withMessage: "Your passwords don't match")
        }
    }
    
    // MARK: - Text Field Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.text = textField.text?.trimmingCharacters(in: .whitespaces)
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String.toUserProfileSegueKey {
            guard let destinationController = segue.destination as? UserProfileViewController else { return }
            destinationController.currentUser = user
        }
    }
    
}
