//
//  CompanyLogoViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyLogoViewController: UIViewController {

    
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var logoImageView: UIImageView!
    
    var company: Company?

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        segueToCompanyCompletionViewController()
    }
    
    @IBAction func backButtontTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func addLogoImageToCompany() {
        
    }
    
    func segueToCompanyCompletionViewController() {
        performSegue(withIdentifier: .toCompanyCompletionViewControllerSegueKey, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationController = segue.destination as? CompanyCompletionViewController else { return }
        destinationController.company = company
    }

}
