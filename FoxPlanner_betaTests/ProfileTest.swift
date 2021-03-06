//
//  ProfileTest.swift
//  FoxPlanner_betaTests
//
//  Created by leeseunghyun on 26/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import XCTest
@testable import FoxPlanner_beta

class ProfileTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCheckInfo() {
        let (name, password, confirmPassword) = ("test01", "Test01test", "Test01test")
        let profile = Profile()
        do {
            try profile.checkInfo(name: name, password: password, confirmPassword: confirmPassword)
            try profile.checkInfo(name: name, password: "", confirmPassword: "")
        } catch {
            XCTAssert(false)
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
