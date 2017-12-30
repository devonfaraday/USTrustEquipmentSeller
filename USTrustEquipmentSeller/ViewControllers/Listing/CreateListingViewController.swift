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
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var itemNameTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    @IBOutlet var postButton: UIButton!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var phoneNumberCheckBoxButton: UIButton!
    @IBOutlet var emailCheckBoxButton: UIButton!
    @IBOutlet var noTextingCheckBoxButton: UIButton!
    @IBOutlet var addImagesButton: UIButton!
    
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
