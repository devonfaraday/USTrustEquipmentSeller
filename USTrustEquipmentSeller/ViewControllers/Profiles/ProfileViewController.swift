//
//  ProfileViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/9/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var containerView: UIView!
    @IBOutlet var companyProfileButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var userProfileButton: UIButton!
    
    var company: Company?
    var companyViewController: CompanyProfileViewController? {
        return companyProfileStoryboard as? CompanyProfileViewController
    }
    var createCompanyViewController: CompanyCreationNavigationController? {
        return createCompanyNavigationStoryboard as? CompanyCreationNavigationController
    }
    let createCompanyNavigationStoryboard = UIStoryboard(name: .createCompanyNavigationStoryboardNameKey, bundle: nil).instantiateViewController(withIdentifier: .CompanyCreationNavigationStoryboardIdentifier)
    let companyProfileStoryboard = UIStoryboard(name: .companyProfileStoryboardNameKey, bundle: nil).instantiateViewController(withIdentifier: .companyProfileStoryboardIdentifier)
    var viewState: ViewState = .userProfile
    let userProfileStoryboard = UIStoryboard(name: .userProfileStoryboardNameKey, bundle: nil).instantiateViewController(withIdentifier: .userProfileStoryboardIdentifier)
    var user: User?
    var userProfileViewController: UserProfileViewController? {
        return userProfileStoryboard as? UserProfileViewController
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addDidCompleteSettingUpCompanyObserver()
        displayUserProfileView()
        setCurrentUser()
        setUserInfo()
    }

    
    // MARK: - UI Actions
    @IBAction func userProfileButtonTapped(_ sender: Any) {
        displayUserProfileView()
        setUserInfo()
    }
    
    @IBAction func companyProfileButtonTapped(_ sender: Any) {
        if company != nil {
            displayCompanyProfileView()
            setCurrentCompanyInfo()
        } else {
            displayCreateCompanyView()
        }
    }
    
    // MARK: - Container View Functions
    func displayUserProfileView() {
        guard let userProfileViewController = userProfileViewController else { return }
        userProfileViewController.currentUser = user
        containerView.addSubview(userProfileViewController.view)
        viewState = .userProfile
    }
    
    func displayCompanyProfileView() {
        guard let companyViewController = companyViewController else { return }
        companyViewController.company = company
        containerView.addSubview(companyViewController.view)
        viewState = .companyProfile
    }
    
    func displayCreateCompanyView() {
        guard let createCompanyViewController = createCompanyViewController else { return }
        containerView.addSubview(createCompanyViewController.view)
        viewState = .createCompany
    }
    
    // MARK: - Helpers
    func setCurrentUser() {
        let userController = UserController()
        userController.fetchCurrentUser { (user) in
            self.user = user
            self.setUsersCompany()
        }
    }
    
    func setUsersCompany() {
        guard let companyIdentifier = user?.companyReference else { return }
        CompanyController().fetchCompany(identifier: companyIdentifier) { (company) in
            self.company = company
        }
    }
    
    func setUserInfo() {
        nameLabel.text = user?.fullName
    }
    
    func setCurrentCompanyInfo() {
        nameLabel.text = company?.companyName
    }
    
    // MARK: - Observers
    func addDidCompleteSettingUpCompanyObserver() {
        if company == nil {
        NotificationCenter.default.addObserver(self, selector: #selector(createCompanyCompleted), name: NSNotification.Name(.companyCreationDidFinishNotificationNameKey), object: nil)
        }
    }
    
    func removeDidCompleteSettingUpCompanyObserver() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(.companyCreationDidFinishNotificationNameKey), object: nil)
    }
    
    @objc func createCompanyCompleted() {
        setCompanyFromUserDefaults()
        displayCompanyProfileView()
    }
    
    func setCompanyFromUserDefaults() {
        guard let companyDictionary = UserDefaults().value(forKey: "company") as? JSONDictionary,
            let companyIdentifier = UserDefaults().string(forKey: "companyIdentifier")
            else { return }
        self.company = Company(dictionary: companyDictionary, identifier: companyIdentifier)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}

extension ProfileViewController {
    enum ViewState {
        case userProfile
        case companyProfile
        case createCompany
    }
}
