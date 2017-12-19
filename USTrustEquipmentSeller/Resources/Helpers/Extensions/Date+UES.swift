//
//  Date+UES.swift
//  USTrustEquipmentSeller
//
//  Created by Christian McMullin on 12/18/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(withFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        var dateString = dateFormatter.string(from: self)
        if dateString.first == "0" {
            dateString.removeFirst()
        }
        return dateString
    }
}
