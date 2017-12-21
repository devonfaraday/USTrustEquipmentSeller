//
//  CompanyEINViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyEINViewController: UIViewController {

    @IBOutlet var einTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var company: Company?
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        addEINToCompany()
        segueToCompanyLogoViewController()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func addEINToCompany() {
        guard let ein = einTextField.text
            else { return }
        company?.einNumber = ein
    }
    
    func segueToCompanyLogoViewController() {
        performSegue(withIdentifier: .toCompanyLogoViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyLogoViewController else { return }
        destinationController.company = company
    }

}
