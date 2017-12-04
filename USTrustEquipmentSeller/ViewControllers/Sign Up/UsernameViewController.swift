//
//  UsernameViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/30/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class UsernameViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var verifyPasswordTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    
    func createUsernameAndPassword() {
        guard let username = usernameTextField.text,
            let password = passwordTextField.text,
            let verifyPassword = verifyPasswordTextField.text else { return }
        if checkIfTextFieldIsEmpty(textField: usernameTextField, addMessageIfEmpty: "Please enter a username") && checkIfTextFieldIsEmpty(textField: passwordTextField, addMessageIfEmpty: "Please enter your password")
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
    
    // MARK: - Alert Controller
    func showAlert(withMessage message: String) {
        let alertController = UIAlertController(title: "Something went wrong", message: message, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }

}
