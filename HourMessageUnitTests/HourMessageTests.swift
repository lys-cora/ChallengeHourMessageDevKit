//
//  HourMessageTests.swift
//  HourMessageTests
//
//  Created by Cora on 25/09/22.
//

import XCTest
@testable import HourMessage

protocol HourMessageProtocolStub: HourMessageProtocol {
    func getCurrentDate() -> Date
}

class HourMessageTests: XCTestCase {
    
    let dateFormatter = DateFormatter()
    let hourMessageProtocolStub: HourMessageProtocolStub? = nil
    
    override func setUp() {
        dateFormatter.dateFormat = "HH:mm:ss"
    }
    
    func test_WhenHourIs8Am_SoVerifyPeriodReturnMorning() throws {
        let morning = HourMessageMorningMock()
        let viewController = HourMessageViewController(hourMessage: morning)
        XCTAssertEqual(viewController.verifyPeriod(), Period.morning)
    }

    func test_WhenHourIs8Am_SoMorningReturnTrue() throws {
        let morningSixAm = try XCTUnwrap(dateFormatter.date(from: "08:00:00"))
        let viewController = HourMessageViewController()
        viewController.verifyPeriod()
        let hour = try XCTUnwrap(Calendar.current.dateComponents([.hour], from: morningSixAm).hour)
        XCTAssertEqual(viewController.isMorning(hour: hour), true)
    }
    
    func test_WhenHourIs13Pm_SoEveningReturnTrue() throws {
        let morningSixAm = try XCTUnwrap(dateFormatter.date(from: "13:00:00"))
        let viewController = HourMessageViewController()
        viewController.verifyPeriod()
        let hour = try XCTUnwrap(Calendar.current.dateComponents([.hour], from: morningSixAm).hour)
        XCTAssertEqual(viewController.isEvening(hour: hour), true)
    }
    
    func test_WhenHourIs13Pm_SoVerifyPeriodReturnEvening() throws {
        let evening = HourMessageEveningMock()
        let viewController = HourMessageViewController(hourMessage: evening)
        XCTAssertEqual(viewController.verifyPeriod(), Period.evening)
    }
    
    func test_WhenHourIs20Pm_SoNightReturnTrue() throws {
        let morningSixAm = try XCTUnwrap(dateFormatter.date(from: "20:00:00"))
        let viewController = HourMessageViewController()
        viewController.verifyPeriod()
        let hour = try XCTUnwrap(Calendar.current.dateComponents([.hour], from: morningSixAm).hour)
        XCTAssertEqual(viewController.isNight(hour: hour), true)
    }
    
    func test_WhenHourIs20Pm_SoVerifyPeriodReturnNight() throws {
        let night = HourMessageNightMock()
        let viewController = HourMessageViewController(hourMessage: night)
        XCTAssertEqual(viewController.verifyPeriod(), Period.night)
    }
    
    func test_WhenHourIs2Am_SoMorningAndEveningAndNightReturnFalse() throws {
        let morningSixAm = try XCTUnwrap(dateFormatter.date(from: "02:00:00"))
        let viewController = HourMessageViewController()
        viewController.verifyPeriod()
        let hour = try XCTUnwrap(Calendar.current.dateComponents([.hour], from: morningSixAm).hour)
        XCTAssertEqual(viewController.isMorning(hour: hour), false)
        XCTAssertEqual(viewController.isEvening(hour: hour), false)
        XCTAssertEqual(viewController.isNight(hour: hour), false)
    }

    func test_WhenHourIs2Am_SoVerifyPeriodReturnDawn() throws {
        let dawn = HourMessageDawnMock()
        let viewController = HourMessageViewController(hourMessage: dawn)
        XCTAssertEqual(viewController.verifyPeriod(), Period.dawn)
    }
}
