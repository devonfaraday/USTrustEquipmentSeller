//
//  CompanyController.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 12/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import Firebase

class CompanyController {
   
    func createCompany(company: Company) {
        var newCompany = company
        newCompany.save()
    }
    
    
}
