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
        dateFormatter.dateFormat = "HH:mm:ss"
        let morningSixAm = dateFormatter.date(from: "08:00:00") ?? Date.now
        return morningSixAm
    }
}

class HourMessageEveningMock: HourMessage {
    override func getCurrentDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let morningSixAm = dateFormatter.date(from: "14:00:00") ?? Date.now
        return morningSixAm
    }
}

class HourMessageNightMock: HourMessage {
    override func getCurrentDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let morningSixAm = dateFormatter.date(from: "22:00:00") ?? Date.now
        return morningSixAm
    }
}

class HourMessageDawnMock: HourMessage {
    override func getCurrentDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let morningSixAm = dateFormatter.date(from: "02:00:00") ?? Date.now
        return morningSixAm
    }
}
