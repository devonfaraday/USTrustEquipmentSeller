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
    
    func createUserDefaultCompany(withCompany company: Company) {
        let userDefaults = UserDefaults()
        userDefaults.set(company.dictionaryCopy, forKey: "company")
        userDefaults.set(company.identifier ?? "", forKey: "companyIdentifier")
    }
    
    // MARK: - Read
   
    func fetchCompany(identifier: String, completion: @escaping(Company?) -> Void) {
        let companyRef = FirebaseController.databaseRef.child(.companiesEndpoint).child(identifier)
        companyRef.observeSingleEvent(of: .value, with: { (data) in
            guard let companyDict = data.value as? [String: Any] else {
                completion(nil)
                return
            }
            let company = Company(dictionary: companyDict, identifier: identifier)
            completion(company)
        })
    }
    
    // MARK: - Update
   
    func update(company: Company) {
        var modifiedCompany = company
       modifiedCompany.save()
    }
    
    // MARK: - Delete
   
    func deleteCompany(identifier: String) {
        let companyRef = FirebaseController.databaseRef.child(.companiesEndpoint).child(identifier)
        companyRef.removeValue()
    }
}
    

