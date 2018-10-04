//
//  TabBarViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/9/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passUserToProfile()
    }

    func passUserToProfile() {
        if let tabBarController = self.tabBarController {
            if let tabBarViewControllers = tabBarController.viewControllers {
                for vc in tabBarViewControllers {
                    if let profile = vc as? UserProfileViewController {
                        profile.currentUser = currentUser
                    }
                }
            }
        }
    }
}
