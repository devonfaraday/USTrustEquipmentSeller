//
//  CompanyNameViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyNameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var companyNameTextField: UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var company: Company?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setState(isEnabled: false)
    }
    
    // MARK: - IB Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if userMayProgress() {
            createCompanyName()
            segueToCompanyAddressViewController()
        } else {
            textFieldsEmptyAlert()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Create company helpers
    func createCompanyName() {
        guard let companyName = companyNameTextField.text else { return }
        let newCompany = Company(companyName: companyName, streetAddress: "", city: "", state: "", zipCode: "", phoneNumber: "", einNumber: "")
        self.company = newCompany
    }
    
    func checkIfNameIsEmpty() -> Bool {
        return companyNameTextField.isTextFieldEmpty()
    }
    
    func userMayProgress() -> Bool {
        var returnValue = true
        if checkIfNameIsEmpty() {
            returnValue = false
        }
        return returnValue
    }
    
    func setButtonState() {
        nextButton.setState(isEnabled: userMayProgress())
    }
    
    // MARK: - TextField Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setButtonState()
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldsEmptyAlert() {
        let alertController = UIAlertController(title: "Empty Fields", message: "Please make sure to enter in all the information", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Touch gesture methods
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setButtonState()
        companyNameTextField.resignFirstResponder()
    }
    
    // MARK: - Navigation
    func segueToCompanyAddressViewController() {
        performSegue(withIdentifier: .toCompanyAddressViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyAddressViewController else { return }
        destinationController.company = company
    }
}
