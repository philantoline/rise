//
//  Day.swift
//  rise
//
//  Created by Phillip Antoline on 6/28/18.
//  Copyright © 2018 Phil Antoline. All rights reserved.
//

import Foundation

struct Day {
    
    var dateStamp: String {
        return formatDate(dateFormat: nil)
    }
    var date: String {
        return formatDate(dateFormat: "MMMMd")
    }
    var impulses: [Impulse]?
    enum Status: String {
        case succeeded = "succeeded"
        case failed = "failed"
        case unknown = "unknown"
    }
    var status: String {
        return Status.unknown.rawValue
    }
    
    func formatDate(dateFormat: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let date = Date()
        
        switch dateFormat {
        case "MMMMd":
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")
            return dateFormatter.string(from: date)
        default:
            dateFormatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy") 
            return dateFormatter.string(from: date)
        }
    }

}
