//
//  CreateListingViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class CreateListingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    @IBOutlet var addImagesButton: UIButton!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var emailCheckBoxButton: UIButton!
    @IBOutlet var itemNameTextField: UITextField!
    @IBOutlet var noTextingCheckBoxButton: UIButton!
    @IBOutlet var phoneNumberCheckBoxButton: UIButton!
    @IBOutlet var postButton: UIButton!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    
    var images = [UIImage]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IB Actions
    @IBAction func addImagesButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Create Functions
    func createListing() {
//        guard let itemName = itemNameTextField.text,
//            let price = priceTextField.text,
//            let zipCode = zipCodeTextField.text,
//            let description = descriptionTextView.text else { return }
//        let listing = Listing(itemName: itemName, quantity: <#T##Int#>, catagoryIdentifer: <#T##String#>, description: description, price: price, location: <#T##String#>, images: <#T##[UIImage]#>, companyIdentifer: <#T##String#>, identifier: UUID().uuidString, created: <#T##Date#>, updated: <#T##Date#>)
    }
    
    func postListing() {
        
    }
    
    func saveImages() {
        
    }
    
    // MARK: - Image Selection Functions
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
