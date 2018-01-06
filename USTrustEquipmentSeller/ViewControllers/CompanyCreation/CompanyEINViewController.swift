//
//  CompanyEINViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyEINViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var einTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var company: Company?
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if !einTextField.isTextFieldEmpty() {
            addEINToCompany()
            segueToCompanyLogoViewController()
        } else {
            textFieldsEmptyAlert()
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func addEINToCompany() {
        guard let ein = einTextField.text
            else { return }
        company?.einNumber = ein
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        einTextField.resignFirstResponder()
    }
    
    func textFieldsEmptyAlert() {
        let alertController = UIAlertController(title: "Empty Fields", message: "Please make sure to enter in all the information", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func segueToCompanyLogoViewController() {
        performSegue(withIdentifier: .toCompanyLogoViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyLogoViewController else { return }
        destinationController.company = company
    }

}
