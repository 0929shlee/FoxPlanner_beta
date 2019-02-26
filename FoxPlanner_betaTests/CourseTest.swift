//
//  CourseTest.swift
//  FoxPlanner_betaTests
//
//  Created by leeseunghyun on 26/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import XCTest
@testable import FoxPlanner_beta

class CourseTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        let (id1, title1, prof1, time1) = ("id1", "title1", "prof1", [DayName.Mon : [1, 2, 3]])
        let course1_1 = Course(id: id1, title: title1, prof: prof1, time: time1)
        let course1_2 = Course(id: id1, title: title1, prof: prof1, array: [0, 1, 2])
        let course1_3 = Course(array: [id1, title1, prof1, "0", "1", "2"])
        XCTAssert((course1_1 == course1_2) && (course1_2 == course1_3))
        
        let (id2, title2, prof2, time2) = ("id2", "title2", "prof2", [DayName.Tue : [4, 5, 6]])
        let course2_1 = Course(id: id2, title: title2, prof: prof2, time: time2)
        let course2_2 = Course(id: id2, title: title2, prof: prof2, array: [33, 34, 35])
        let course2_3 = Course(array: [id2, title2, prof2, "33", "34", "35"])
        XCTAssert((course2_1 == course2_2) && (course2_2 == course2_3))
    }
    
    func testConvertToStringArray() {
        var (id, title, prof, time) = ("id1", "title1", "prof1", [DayName.Mon : [1, 2, 3]])
        var course = Course(id: id, title: title, prof: prof, time: time)
        var result = [id, title, prof, "0", "1", "2"]
        XCTAssert(course.convertToStringArray() == result)
        
        (id, title, prof, time) = ("id2", "title2", "prof2", [DayName.Tue : [4, 5, 6]])
        course = Course(id: id, title: title, prof: prof, time: time)
        result = [id, title, prof, "33", "34", "35"]
        XCTAssert(course.convertToStringArray() == result)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
