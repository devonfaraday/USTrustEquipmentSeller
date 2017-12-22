//
//  CompanyAddressViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyAddressViewController: UIViewController {

    var company: Company?
    
    
    @IBOutlet var cityTextfield: UITextField!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var streetAddressTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        addAddressToCompany()
        segueToCompanyPhoneNumberViewController()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
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
    
    func segueToCompanyPhoneNumberViewController() {
        performSegue(withIdentifier: .toCompanyPhoneNumberViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyPhoneNumberViewController else { return }
        destinationController.company = company
        
    }

}
