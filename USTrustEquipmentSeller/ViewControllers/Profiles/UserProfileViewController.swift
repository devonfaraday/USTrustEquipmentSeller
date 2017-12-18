//
//  UserProfileViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var streetAddressTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    @IBOutlet var cityTextField: UITextField!
    
    var currentUser: User? {
        didSet {
            if !isViewLoaded {
                loadViewIfNeeded()
            }
            updateViews()
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrentUser()
    }
    
    // MARK: - IB Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        modifyUser()
    }
    
    // MARK: - Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - View Update Functions
    func updateViews() {
        guard let user = currentUser else { return }
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        emailTextField.text = user.email
        phoneNumberTextField.text = user.phoneNumber
        streetAddressTextField.text = user.streetAddress
        cityTextField.text = user.city
        stateTextField.text = user.state
        zipCodeTextField.text = user.zipCode
        
    }
    
    // MARK: - Helper
    func setCurrentUser() {
        let userController = UserController()
        userController.fetchCurrentUser { (user) in
            self.currentUser = user
        }
    }
    
    // MARK: - Edit/Save Profile Functions
    func saveProfile() {
        modifyUser()
    }
    
    func modifyUser() {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let streetAddress = streetAddressTextField.text,
            let city = cityTextField.text,
            let state = stateTextField.text,
            let zipCode = zipCodeTextField.text,
            let phoneNumber = phoneNumberTextField.text,
            let email = emailTextField.text
        else { return }
        currentUser?.firstName = firstName
        currentUser?.lastName = lastName
        currentUser?.streetAddress = streetAddress
        currentUser?.city = city
        currentUser?.state = state
        currentUser?.zipCode = zipCode
        currentUser?.phoneNumber = phoneNumber
        currentUser?.email = email
        let userController = UserController()
        guard let user = currentUser else { return }
        userController.modifyUser(withUser: user)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
