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
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var einNumber: UITextField!
    
    /* Button Outlets */
    @IBOutlet weak var saveEditButton: UIButton!
    @IBOutlet weak var administratorSettingsButton: UIButton!
    @IBOutlet weak var companyListingsButton: UIButton!
    @IBOutlet weak var addImageButton: UIButton!
    
    var company: Company?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
        let size = CGSize(width: 600, height: 400)
        let resizedImage = ImageHandler.resizeImage(image: selectedImage, targetSize: size )
        
        logoImage.image = resizedImage
        
        addImageButton.setTitle("", for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func editCompany() {
//        guard let companyName = companyName.text,
//            let streetAddress = streetAddress.text,
//            let city = city.text,
//            let state = state.text,
//            let zipCode = zipCode.text,
//            let phoneNumber = phoneNumber.text,
//            let einNumber = einNumber.text
//            else { return }
//        currentCompany?.companyName = companyName
//        currentCompany?.streetAddress = streetAddress
//        currentCompany?.city = city
//        currentCompany?.state = state
//        currentCompany?.zipCode = zipCode
//        currentCompany?.phone = phoneNumber
//        currentCompany?.einNumber = einNumber
//        let companyController = CompanyController()
//        guard let currentCompany = currentCompany else { return }
//        companyController.update(company: currentCompany)
    }
    
    func saveCompany() {
        guard let companyName = companyName.text,
            let streetAddress = streetAddress.text,
            let city = city.text,
            let state = state.text,
            let zipCode = zipCode.text,
            let phoneNumber = phoneNumber.text,
            let einNumber = einNumber.text
            else { return }
        let company = Company(companyName: companyName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, phoneNumber: phoneNumber, einNumber: einNumber)
        let companyController = CompanyController()
        companyController.createCompany(company: company)
    }
    
}
