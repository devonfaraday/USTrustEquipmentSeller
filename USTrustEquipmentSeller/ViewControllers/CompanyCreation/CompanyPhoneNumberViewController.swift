//
//  CompanyPhoneNumberViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyPhoneNumberViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var company: Company?
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if !phoneNumberTextField.isTextFieldEmpty() {
            addPhoneNumberToCompany()
            segueToCompanyEINViewController()
        } else {
            textFieldsEmptyAlert()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func addPhoneNumberToCompany() {
        guard let phoneNumber = phoneNumberTextField.text
            else { return }
        company?.phoneNumber = phoneNumber
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberTextField.resignFirstResponder()
    }
    
    func textFieldsEmptyAlert() {
        let alertController = UIAlertController(title: "Empty Fields", message: "Please make sure to enter in all the information", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func segueToCompanyEINViewController() {
        performSegue(withIdentifier: .toCompanyEINViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyEINViewController else { return }
        destinationController.company = company
        
    }
}
