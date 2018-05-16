//
//  CreateListingNameViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 4/6/18.
//  Copyright © 2018 Christian McMullin. All rights reserved.
//

import UIKit

class CreateListingNameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var listingNameTextField: UITextField!
    var listing: Listing = Listing()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addNameToListing() {
        guard let listingName = listingNameTextField.text, !listingName.isEmpty else { return }
        listing.itemName = listingName
    }
    
    func segueTo

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
