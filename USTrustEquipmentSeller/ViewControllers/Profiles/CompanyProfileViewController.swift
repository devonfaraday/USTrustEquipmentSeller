//
//  CompanyProfileViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class CompanyProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    /* Outlets */
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var einNumberTextField: UITextField!
    
    /* Button Outlets */
    @IBOutlet weak var saveEditButton: UIButton!
    @IBOutlet weak var administratorSettingsButton: UIButton!
    @IBOutlet weak var companyListingsButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    var company: Company? {
        didSet {
            if !isViewLoaded {
                loadViewIfNeeded()
            }
            updateViews()
        }
    }
    
    @IBAction func addImageButtonTapped(_ sender: Any) {
        addPhotoActionSheet()
    }
    
    
    @IBAction func saveEditButtonTapped(_ sender: Any) {
        saveEditButton.isEnabled = false
        saveCompany()
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
        let size = CGSize(width: selectedImage.size.width / 3, height: selectedImage.size.height / 3)
        let resizedImage = ImageHandler.resizeImage(image: selectedImage, targetSize: size )
        
        logoImage.image = resizedImage
        guard let imageData = UIImageJPEGRepresentation(resizedImage, 1.0),
            let company = company
        else { return }
        let imageController = ImageController()
        imageController.createLogo(withImageData: imageData, forCompany: company)
        
        addImageButton.setTitle("", for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    
    func updateViews() {
        guard let company = company else { return }
        companyNameTextField.text = company.companyName
        streetAddressTextField.text = company.streetAddress
        cityTextField.text = company.city
        stateTextField.text = company.state
        zipCodeTextField.text = company.zipCode
        phoneNumberTextField.text = company.phoneNumber
        einNumberTextField.text = company.einNumber
    }
    
    func saveCompany() {
        guard let companyName = companyNameTextField.text,
            let streetAddress = streetAddressTextField.text,
            let city = cityTextField.text,
            let state = stateTextField.text,
            let zipCode = zipCodeTextField.text,
            let phoneNumber = phoneNumberTextField.text,
            let einNumber = einNumberTextField.text
            else { return }
        let company = Company(companyName: companyName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, phoneNumber: phoneNumber, einNumber: einNumber)
        let companyController = CompanyController()
        companyController.createCompany(company: company)
    }
    
}
