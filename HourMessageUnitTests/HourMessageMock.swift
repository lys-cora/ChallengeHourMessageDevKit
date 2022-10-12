//
//  HourMessageMock.swift
//  HourMessage
//
//  Created by Cora on 12/10/22.
//

import Foundation

@testable import HourMessage

class HourMessageMorningMock: HourMessage {
    
    override func getCurrentDate() -> Date {
        let dateFormatter = DateFormatter()
        let morningSixAm = dateFormatter.date(from: "08:00:00") ?? Date.now
        return morningSixAm
    }
}
