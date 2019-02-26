//
//  SignupTest.swift
//  FoxPlanner_betaTests
//
//  Created by leeseunghyun on 26/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import XCTest
@testable import FoxPlanner_beta

class SignupTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCheckInfo() {
        let account = Account(name: "Test01", email: "test01@gmail.com", password: "Test01test")
        let signup = Signup()
        
        do {
            try signup.checkInfo(account: account, confirmPassword: "Test01test")
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
