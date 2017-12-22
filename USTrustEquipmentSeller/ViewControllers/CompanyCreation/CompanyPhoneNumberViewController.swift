//
//  CompanyPhoneNumberViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyPhoneNumberViewController: UIViewController {

    
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var company: Company?
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        addPhoneNumberToCompany()
        segueToCompanyEINViewController()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func addPhoneNumberToCompany() {
        guard let phoneNumber = phoneNumberTextField.text
            else { return }
        company?.phoneNumber = phoneNumber
    }
    
    func segueToCompanyEINViewController() {
        performSegue(withIdentifier: .toCompanyEINViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyEINViewController else { return }
        destinationController.company = company
        
    }
}
