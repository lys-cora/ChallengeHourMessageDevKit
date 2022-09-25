//
//  HourMessageString.swift
//  hour-message
//
//  Created by Cora on 19/09/22.
//

import Foundation

enum HourMessageString: String {
    case messageMorning
    case messageEvening
    case messageNight
    case messageDawn
    
    var localized: String {
        return self.rawValue.localized(tableName: "HourMessageString")
    }
    
}
