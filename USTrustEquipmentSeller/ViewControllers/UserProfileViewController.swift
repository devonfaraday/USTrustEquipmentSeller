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
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var streetAddressTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    
    var currentUser: User? {
        didSet {
            if !isViewLoaded {
                loadViewIfNeeded()
            }
            updateViews()
        }
    }
    var viewState: ViewState = .viewing
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    // MARK: - View Update Functions
    func updateViews() {
        guard let user = currentUser else { return }
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
    }
    
    // MARK: - Edit/Save Profile Functions
    func editProfile() {
        
    }
    
    func saveProfile() {
        modifyUser()
    }
    
    func modifyUser() {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let streetAddress = streetAddressTextField.text,
            let city = cityTextField.text,
            let state = stateTextField.text,
            let zipCode = zipCodeTextField.text else { return }
        currentUser?.firstName = firstName
        currentUser?.lastName = lastName
        currentUser?.streetAddress = streetAddress
        currentUser?.city = city
        currentUser?.state = state
        currentUser?.zipCode = zipCode
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

extension UserProfileViewController {
    enum ViewState {
        case viewing
        case editing
    }
}
