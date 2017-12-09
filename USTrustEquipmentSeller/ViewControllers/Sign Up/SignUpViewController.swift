//
//  SignUpViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var streetAddressTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    
    var user: User?
    var userMeetsRequirements: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IB Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        checkIfUserMeetsRequirements()
        if userMeetsRequirements {
            createUser()
            performSegue(withIdentifier: .toUsernamePasswordCreationSegueKey, sender: self)
        }
    }
    
    // MARK: - Helpers
    func createUser() {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let email = emailTextField.text,
            let streetAddress = streetAddressTextField.text,
            let city = cityTextField.text,
            let state = stateTextField.text,
            let zipCode = zipCodeTextField.text else { return }
        let user = User(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, email: email, username: "")
        self.user = user
    }
    
    // MARK: - Required Fields
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
    
    func checkIfUserMeetsRequirements() {
         if checkIfTextFieldIsEmpty(textField: firstNameTextField, addMessageIfEmpty: "Please enter your first name") &&
        checkIfTextFieldIsEmpty(textField: lastNameTextField, addMessageIfEmpty: "Please enter your last name") &&
        checkIfTextFieldIsEmpty(textField: emailTextField, addMessageIfEmpty: "Please enter your email") &&
        checkIfTextFieldIsEmpty(textField: streetAddressTextField, addMessageIfEmpty: "Please enter your street address") &&
        checkIfTextFieldIsEmpty(textField: cityTextField, addMessageIfEmpty: "Please enter your city") &&
            checkIfTextFieldIsEmpty(textField: stateTextField, addMessageIfEmpty: "Please enter your state") &&
            checkIfTextFieldIsEmpty(textField: zipCodeTextField, addMessageIfEmpty: "Please enter your zip code") {
            userMeetsRequirements = true
         } else {
            userMeetsRequirements = false
        }
    }
    
    // MARK: - TextField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.text = textField.text?.trimmingCharacters(in: .whitespaces)
        switch textField.isFirstResponder {
        case firstNameTextField.isFirstResponder:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField.isFirstResponder:
            emailTextField.becomeFirstResponder()
        case emailTextField.isFirstResponder:
            streetAddressTextField.becomeFirstResponder()
        case streetAddressTextField.isFirstResponder:
            cityTextField.becomeFirstResponder()
        case cityTextField.isFirstResponder:
            stateTextField.becomeFirstResponder()
        case stateTextField.isFirstResponder:
            zipCodeTextField.becomeFirstResponder()
        case zipCodeTextField.isFirstResponder:
            checkIfUserMeetsRequirements()
            if userMeetsRequirements {
                createUser()
                performSegue(withIdentifier: .toUsernamePasswordCreationSegueKey, sender: self)
            }
        default:
            print("Whatever")
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? UsernameViewController else { return }
        destination.user = user
    }
}
