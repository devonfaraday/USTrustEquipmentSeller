//
//  UITextField+UES.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 1/1/18.
//  Copyright © 2018 Christian McMullin. All rights reserved.
//

import UIKit

extension UITextField {
    
    func isTextFieldEmpty() -> Bool {
        var returnValue = false
        if let text = self.text {
            if (text.isEmpty) {
                returnValue = true
            }
        }
        return returnValue
    }
    
}
