//
//  CompanyAddressViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyAddressViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties
    var company: Company?
    
    @IBOutlet var cityTextfield: UITextField!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var streetAddressTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IB Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if !checkIfTextFieldIsEmpty() {
            addAddressToCompany()
            segueToCompanyPhoneNumberViewController()
        } else {
            textFieldsEmptyAlert()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Company Helper
    func addAddressToCompany() {
        guard let streetAddress = streetAddressTextField.text,
            let city = cityTextfield.text,
            let state = stateTextField.text,
            let zipCode = zipCodeTextField.text
            else { return }
        company?.streetAddress = streetAddress
        company?.city = city
        company?.state = state
        company?.zipCode = zipCode
    }
    
    // MARK: - Progression Methods
    func checkIfTextFieldIsEmpty() -> Bool {
        return streetAddressTextField.isTextFieldEmpty() || cityTextfield.isTextFieldEmpty() || stateTextField.isTextFieldEmpty() || zipCodeTextField.isTextFieldEmpty()
    }
    
    // MARK: - Text Field Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    // MARK: - Touch Gestures
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        streetAddressTextField.resignFirstResponder()
        cityTextfield.resignFirstResponder()
        stateTextField.resignFirstResponder()
        zipCodeTextField.resignFirstResponder()
    }
    
    // MARK: - AlertController
    func textFieldsEmptyAlert() {
        let alertController = UIAlertController(title: "Empty Fields", message: "Please make sure to enter in all the information", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    func segueToCompanyPhoneNumberViewController() {
        performSegue(withIdentifier: .toCompanyPhoneNumberViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyPhoneNumberViewController else { return }
        destinationController.company = company
        
    }

}
