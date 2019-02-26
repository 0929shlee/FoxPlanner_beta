//
//  AccountTest.swift
//  FoxPlanner_betaTests
//
//  Created by leeseunghyun on 26/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import XCTest
@testable import FoxPlanner_beta

class AccountTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testToStringArray() {
        let (name, email, password) = ("test01", "test01@gmail.com", "Test01test")
        var account = Account()
        XCTAssert(account.toStringArray() == ["", "", ""])
        
        account = Account(email: email, password: password)
        XCTAssert(account.toStringArray() == ["", email, password])
        
        account = Account(name: name, email: email, password: password)
        XCTAssert(account.toStringArray() == [name, email, password])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
