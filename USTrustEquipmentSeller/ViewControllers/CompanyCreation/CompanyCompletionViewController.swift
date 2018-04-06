//
//  CompanyCompletionViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class CompanyCompletionViewController: UIViewController {

    var company: Company?
    var userID: String {
        guard let uid = Auth.auth().currentUser?.uid else { return "" }
        return uid
    }
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var completeButton: UIButton!
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        saveCompanyToDatabase()
        removeNavigationControllerFromParent()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        let _ = navigationController?.popViewController(animated: true)
    }
    
    func saveCompanyToDatabase() {
        self.company?.administratorAccountsIdentifiers.append(userID)
        guard let company = self.company else { return }
        let companyController = CompanyController()
        companyController.createUserDefaultCompany(withCompany: company)
        companyController.createCompany(company: company)
        var companyOwner = UserController.shared.user
        companyOwner?.companyReference = company.identifier
        companyOwner?.save()
        
    }
    
    func removeNavigationControllerFromParent() {
        NotificationCenter.default.post(name: NSNotification.Name(.companyCreationDidFinishNotificationNameKey), object: nil)
    }
    
     
}



