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
    
    let companyProfileStoryboard = UIStoryboard(name: .companyProfileStoryboardNameKey, bundle: nil).instantiateViewController(withIdentifier: .companyProfileStoryboardIdentifier)
    let userProfileStoryboard = UIStoryboard(name: .userProfileStoryboardNameKey, bundle: nil).instantiateViewController(withIdentifier: .userProfileStoryboardIdentifier)
    var user: User?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayUserProfileView()
        assignCurrentUser()
    }
    
    
    // MARK: - UI Actions
    @IBAction func userProfileButtonTapped(_ sender: Any) {
        displayUserProfileView()
    }
    
    @IBAction func companyProfileButtonTapped(_ sender: Any) {
        displayCompanyProfileView()
    }
    
    // MARK: - Container View Functions
    func displayUserProfileView() {
        containerView.addSubview(userProfileStoryboard.view)
    }
    
    func displayCompanyProfileView() {
        containerView.addSubview(companyProfileStoryboard.view)
    }
    
    // MARK: - Helpers
    func assignCurrentUser() {
        let userController = UserController()
        userController.fetchCurrentUser { (user) in
            self.user = user
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
