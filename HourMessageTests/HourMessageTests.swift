//
//  HourMessageTests.swift
//  HourMessageTests
//
//  Created by Cora on 25/09/22.
//

import XCTest
@testable import HourMessage

class HourMessageTests: XCTestCase {
    
    let dateFormatter = DateFormatter()

    func test_WhenHourIs8Am_SoMorningReturnTrue() throws {
        dateFormatter.dateFormat = "HH:mm:ss"
        let morningSixAm = try XCTUnwrap(dateFormatter.date(from: "08:00:00"))
        let viewController = ViewController()
        viewController.hour = 8
        viewController.getHour(dateNow: morningSixAm)
        XCTAssertEqual(viewController.morning, true)
    }
    
    func test_WhenHourIs13Pm_SoEveningReturnTrue() throws {
        dateFormatter.dateFormat = "HH:mm:ss"
        let eveningElevenPm = try XCTUnwrap(dateFormatter.date(from: "13:00:00"))
        let viewController = ViewController()
        viewController.hour = 8
        viewController.getHour(dateNow: eveningElevenPm)
        XCTAssertEqual(viewController.evening, true)
    }
    
    func test_WhenHourIs20Pm_SoNightReturnTrue() throws {
        dateFormatter.dateFormat = "HH:mm:ss"
        let nightEightPm = try XCTUnwrap(dateFormatter.date(from: "20:00:00"))
        let viewController = ViewController()
        viewController.hour = 8
        viewController.getHour(dateNow: nightEightPm)
        XCTAssertEqual(viewController.night, true)
    }

}
