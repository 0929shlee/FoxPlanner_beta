//
//  Extension_StringTest.swift
//  FoxPlanner_betaTests
//
//  Created by leeseunghyun on 26/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import XCTest
@testable import FoxPlanner_beta

class Extension_StringTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testValidateEmail() {
        let email = "test01@gmail.com"
        XCTAssert(email.validateEmail())
        let falseEmails = ["", "test01@gmail", "test01@gmail.", "test01", "test01@", "test01@.", "test01@.com", "test01.com", "test01.com@gmail", "@gmail.com"]
        for falseEmail in falseEmails {
            XCTAssertFalse(falseEmail.validateEmail())
        }
    }
    
    func testValidatePassword() {
        let truePasswords = ["Test01test", "Te01test", "T00000000000000t"]
        for truePassword in truePasswords {
            XCTAssert(truePassword.validatePassword())
        }
        
        let falsePasswords = ["", "0", "t", "t0", "T0", "Tt", "T0t", "testtest", "test01test", "00000000000000000", "t0000000000000000", "T0000000000000000", "Tt000000000000000"]
        for falsePassword in falsePasswords {
            XCTAssertFalse(falsePassword.validateEmail())
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
