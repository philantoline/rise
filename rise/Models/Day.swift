//
//  Day.swift
//  rise
//
//  Created by Phillip Antoline on 6/28/18.
//  Copyright © 2018 Phil Antoline. All rights reserved.
//

import Foundation

struct Day {
    
    var date: String {
        return formatDate()
    }
    var impulses: [Impulse]?
    enum Status {
        case succeeded, failed, undetermined
    }
    var status = Status.undetermined
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        let date = Date()
        
        // US English Locale (en_US)
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMMd")

        return dateFormatter.string(from: date)
    }

}
