//
//  UserProfileViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 11/13/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Properties
    @IBOutlet var addPhotoButton: UIButton!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var streetAddressTextField: UITextField!
    @IBOutlet var zipCodeTextField: UITextField!
    
    var currentUser: User? {
        didSet {
            if !isViewLoaded {
                loadViewIfNeeded()
            }
            updateViews()
        }
    }
    var viewState: ViewState = .viewing
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: Any) {
        addPhotoActionSheet()
    }
    
    // MARK: - Image Picker Delegates
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
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { dismiss(animated: true, completion: nil); return }
        let size = CGSize(width: 1000, height: 1000)
        let resizedImage = ImageHandler.resizeImage(image: selectedImage, targetSize: size )
        profileImage.image = resizedImage
        saveImage(withImage: resizedImage)
        addPhotoButton.setTitle("", for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - View Update Functions
    func updateViews() {
        guard let user = currentUser else { return }
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        streetAddressTextField.text = user.streetAddress
        cityTextField.text = user.city
        stateTextField.text = user.state
        zipCodeTextField.text = user.zipCode
    }
    
    // MARK: - Edit/Save Profile Functions
    func editProfile() {
        
    }
    
    func saveProfile() {
        modifyUser()
    }
    
    func saveImage(withImage image: UIImage) {
        let imageController = ImageController()
        guard let imageData = createImageData(withImage: image) else { return }
        imageController.createProfileImage(withImageData: imageData, forUser: currentUser)
    }
    
    func createImageData(withImage image: UIImage) -> Data? {
        let imageData = UIImageJPEGRepresentation(image, 1.0)
        return imageData
    }
    
    func modifyUser() {
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let streetAddress = streetAddressTextField.text,
            let city = cityTextField.text,
            let state = stateTextField.text,
            let zipCode = zipCodeTextField.text else { return }
        currentUser?.firstName = firstName
        currentUser?.lastName = lastName
        currentUser?.streetAddress = streetAddress
        currentUser?.city = city
        currentUser?.state = state
        currentUser?.zipCode = zipCode
        let userController = UserController()
        guard let user = currentUser else { return }
        userController.modifyUser(withUser: user)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

extension UserProfileViewController {
    enum ViewState {
        case viewing
        case editing
    }
}
