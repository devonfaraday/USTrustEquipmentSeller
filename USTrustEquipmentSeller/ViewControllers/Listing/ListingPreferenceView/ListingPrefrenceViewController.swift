//
//  ListingPrefrenceViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 4/6/18.
//  Copyright © 2018 Christian McMullin. All rights reserved.
//

import UIKit

class ListingPrefrenceViewController: UIViewController {

    // MARK: - Navigation
    func segue(withIdentifier identifier: String) {
        performSegue(withIdentifier: identifier, sender: self)
    }
    
    func setUpEmbededSegue(withSegue segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? ListingPreferenceButtonsViewController else { return }
        destinationController.delegate = self
    }
    
    func segueToCreateListingViewController(withSegue segue: UIStoryboardSegue) {
//        guard let destinationController = segue.destination as? CreateListingViewController else { return }
    }
    
    func segueToCreateListingName(withSegue segue: UIStoryboardSegue) {
//        guard let destinationController = segue.destination as? CreateListingNameViewController else { return }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case .listingPreferenceButtonsEmbededSegueKey?:
            setUpEmbededSegue(withSegue: segue)
        case .toCreateListingFullSegueKey?:
            segueToCreateListingViewController(withSegue: segue)
        case .toCreateListingNameSegueKey?:
            segueToCreateListingName(withSegue: segue)
        default:
            print("prepare for segue called without no prep needed")
        }
    }
}

extension ListingPrefrenceViewController: ListingPreferenceDelegate {
    func iGotItButtonTapped() {
        segue(withIdentifier: .toCreateListingFullSegueKey)
    }
    
    func guidedHelpButtonTapped() {
        segue(withIdentifier: .toCreateListingNameSegueKey)
    }
}
