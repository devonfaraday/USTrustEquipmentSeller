//
//  CompanyCreateButtonViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyCreateButtonViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func createCompanyButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "createCompany", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let destinationController = segue.destination as? CompanyNameViewController else { return }
        
    }
}
