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
        displayCompanyProfileView()
        setCurrentCompanyInfo()
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
        containerView.addSubview(companyViewController.view)
        viewState = .companyProfile
    }
    
    // MARK: - Helpers
    func setCurrentUser() {
        let userController = UserController()
        userController.fetchCurrentUser { (user) in
            self.user = user
        }
    }
    
    func setUserInfo() {
        nameLabel.text = user?.fullName
    }
    
    func setCurrentCompanyInfo() {
        nameLabel.text = company?.companyName
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
    }
}
