//
//  UserProfileViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    var currentUser: User?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
