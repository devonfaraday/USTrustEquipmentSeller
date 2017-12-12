//
//  CompanyController.swift
//  USTrustEquipmentSeller
//
//  Created by Demick McMullin on 12/9/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import Firebase

class CompanyController {

    let shared = CompanyController()

func createCompany(companyName: String, streetAddress: String, city: String, state: String, zipCode: String, phone: String, einNumber: String, completion: @escaping() -> Void) {
    
    var company = Company(companyName: companyName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, phone: phone, einNumber: einNumber)
    company.save()
    completion()
}

    
}
