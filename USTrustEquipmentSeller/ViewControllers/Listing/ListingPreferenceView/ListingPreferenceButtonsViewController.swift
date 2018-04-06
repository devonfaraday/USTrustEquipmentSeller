//
//  ListingPreferenceButtonsViewController.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 4/6/18.
//  Copyright © 2018 Christian McMullin. All rights reserved.
//

import UIKit

class ListingPreferenceButtonsViewController: UIViewController {

    weak var delegate: ListingPreferenceDelegate?
    
    @IBAction func iGotItButtonTapped(_ sender: Any) {
        delegate?.iGotItButtonTapped()
    }
    
    @IBAction func guidedHelpButtonTapped(_ sender: Any) {
        delegate?.guidedHelpButtonTapped()
    }
}

protocol ListingPreferenceDelegate: class {
    func iGotItButtonTapped()
    func guidedHelpButtonTapped()
}
