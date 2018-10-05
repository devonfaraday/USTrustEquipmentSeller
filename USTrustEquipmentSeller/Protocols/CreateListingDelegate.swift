//
//  CreateListingDelegate.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 10/4/18.
//  Copyright © 2018 Christian McMullin. All rights reserved.
//

import Foundation

protocol CreateListingDelegate: class {
    func createListingInputNextButtonTapped(withInfo info: String)
    func createListingInputPreviousButtonTapped()
}
