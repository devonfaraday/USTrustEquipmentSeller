//
//  CompanyNameViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyNameViewController: UIViewController {
    
    @IBOutlet var companyNameTextField: UITextField!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var company: Company?
    
    
    // MARK: - IB Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        createCompanyName()
        segueToCompanyAddressViewController()
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
    
    // MARK: - Navigation
    func segueToCompanyAddressViewController() {
        performSegue(withIdentifier: .toCompanyAddressViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyAddressViewController else { return }
        destinationController.company = company
        
    }
}
