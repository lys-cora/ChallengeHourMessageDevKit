//
//  HourMessage.swift
//  HourMessage
//
//  Created by Cora on 26/09/22.
//

import Foundation

class HourMessage: HourMessageProtocol {
    func getCurrentDate() -> Date {
        return Date.now
    }
}
