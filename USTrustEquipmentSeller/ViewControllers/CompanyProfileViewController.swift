//
//  CompanyProfileViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class CompanyProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets ===================================================
    
    @IBOutlet var city: UITextField!
    @IBOutlet var companyName: UITextField!
    @IBOutlet var einNumber: UITextField!
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var state: UITextField!
    @IBOutlet var streetAddress: UITextField!
    @IBOutlet var zipCode: UITextField!
    
    // MARK: - Button Outlets ============================================
    
    @IBOutlet var addImageButton: UIButton!
    @IBOutlet var administratorSettingsButton: UIButton!
    @IBOutlet var companyListingsButton: UIButton!
    @IBOutlet var saveEditButton: UIButton!
    
    // MARK: - Variables and Constants ====================================
    
    var company: Company?
    var user: User?
    var authenticatedUser: Bool
    var categories: [ItemCategory] = []
    var selectedCategory: ItemCategory?
    
    // MARK: - Override Functions =========================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButtonSetup()
        
    }
    
    
    
    // MARK: - Navigation ==================================================
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    // MARK: Add Image Functions ============================================
    
    @IBAction func addImageButtonTapped(_ sender: Any) {
        addPhotoActionSheet()
        
    }
    
    
    
    
    @IBAction func saveEditButtonTapped(_ sender: Any) {
        saveEditButton.isEnabled = false
        
        if saveEditButton.titleLabel?.text == "Edit" {
            saveEditButton.titleLabel?.text = "Save"
        } else {
            saveEditButton.titleLabel?.text = "Edit"
            guard let companyName = companyName.text,
                let streetAddress = streetAddress.text,
                let city = city.text,
                let state = state.text,
                let zipCode = zipCode.text,
                let phone = phoneNumber.text,
                let einNumber = einNumber.text
                else { return }
           
            company = Company(companyName: companyName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, phone: phone, einNumber: einNumber)
        }
        
    }
    
    func uploadButton() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func cameraButton() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func addPhotoActionSheet() {
        let actionController = UIAlertController(title: "Upload Photo", message: nil, preferredStyle: .actionSheet)
        let uploadAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            self.uploadButton()
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            self.cameraButton()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)  &&  UIImagePickerController.isSourceTypeAvailable(.camera){
            actionController.addAction(uploadAction)
            actionController.addAction(cameraAction)
        } else if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionController.addAction(cameraAction)
        } else if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionController.addAction(uploadAction)
        }
        actionController.addAction(cancelAction)
        present(actionController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        let size = CGSize(width: 600, height: 400)
        let resizedImage = ImageHandler.resizeImage(image: selectedImage, targetSize: size )
        
        logoImage.image = resizedImage
        
        addImageButton.setTitle("", for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Other Functions =============================================
    
    func saveButtonSetup() {
        if saveEditButton.titleLabel?.text != nil {
            saveEditButton.titleLabel?.text = "Edit"
        } else {
            saveEditButton.titleLabel?.text = "Save"
        }
    }
    
    func verifyUser(user: User) -> Bool {
        if !user.isBanned {
            return false
        } else {
            return true
        }
    }
    func delete() {
        guard let identifier = identifier else { return }
        FirebaseController.databaseRef.child(endpoint).child(identifier).removeValue()
    }
    
}
