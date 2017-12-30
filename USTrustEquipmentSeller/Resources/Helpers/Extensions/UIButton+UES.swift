//
//  UIButton+UES.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/30/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setState(isEnabled enable: Bool) {
        isEnabled = enable
        // If button is disabled alpha is 0.7 if enabled alpha is 1
        if enable {
            self.alpha = 1
        } else {
            self.alpha = 0.7
        }
    }
}
