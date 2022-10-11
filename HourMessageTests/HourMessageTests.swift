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
    
//    let dateFormatter = DateFormatter()
//    let hourMessageProtocolStub: HourMessageProtocolStub? = nil
//    
//    override func setUp() {
//        dateFormatter.dateFormat = "HH:mm:ss"
//    }
//
//    func test_WhenHourIs8Am_SoMorningReturnTrue() throws {
//        let morningSixAm = try XCTUnwrap(dateFormatter.date(from: "08:00:00"))
//        let viewController = HourMessageViewController(hourMessageProtocol: hourMessageProtocolStub!)
//        viewController.verifyPeriod(dateNow: morningSixAm)
//        XCTAssertEqual(viewController.morning, true)
//    }
//    
//    func test_WhenHourIs13Pm_SoEveningReturnTrue() throws {
//        let eveningElevenPm = try XCTUnwrap(dateFormatter.date(from: "13:00:00"))
//        let viewController = HourMessageViewController(hourMessageProtocol: hourMessageProtocolStub!)
//        
//        XCTAssertEqual(viewController.evening, true)
//    }
//    
//    func test_WhenHourIs20Pm_SoNightReturnTrue() throws {
//        let nightEightPm = try XCTUnwrap(dateFormatter.date(from: "20:00:00"))
//        let viewController = HourMessageViewController(hourMessageProtocol: hourMessageProtocolStub!)
//        
//        XCTAssertEqual(viewController.night, true)
//    }
//    
//    func test_WhenHourIs2Am_SoEveningReturnTrue() throws {
//        let dawnTwoAm = try XCTUnwrap(dateFormatter.date(from: "02:00:00"))
//        let viewController = HourMessageViewController(hourMessageProtocol: hourMessageProtocolStub!)
//        XCTAssertEqual(viewController.dawn, true)
//    }

}
