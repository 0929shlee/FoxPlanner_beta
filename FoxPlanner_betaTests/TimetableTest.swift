//
//  TimetableTest.swift
//  FoxPlanner_betaTests
//
//  Created by leeseunghyun on 26/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import XCTest
@testable import FoxPlanner_beta

class TimetableTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let (id1, title1, prof1, time1) = ("id1", "title1", "prof1", [DayName.Mon : [1, 2, 3]])
        let (id2, title2, prof2, time2) = ("id2", "title2", "prof2", [DayName.Tue : [4, 5, 6]])
        let course1 = Course(id: id1, title: title1, prof: prof1, time: time1)
        let course2 = Course(id: id2, title: title2, prof: prof2, time: time2)
        let args = [[id1, title1, prof1, "0", "1", "2"], [id2, title2, prof2, "33", "34", "35"]]
        
        let timetable = Timetable(stringArrays: args)
        XCTAssert(timetable.courses == [course1, course2])
    }

    func testToStringArrays() {
        let (id1, title1, prof1, time1) = ("id1", "title1", "prof1", [DayName.Mon : [1, 2, 3]])
        let (id2, title2, prof2, time2) = ("id2", "title2", "prof2", [DayName.Tue : [4, 5, 6]])
        let course1 = Course(id: id1, title: title1, prof: prof1, time: time1)
        let course2 = Course(id: id2, title: title2, prof: prof2, time: time2)
        let result = [[id1, title1, prof1, "0", "1", "2"], [id2, title2, prof2, "33", "34", "35"]]
        
        let timetable = Timetable(courses: [course1, course2])
        XCTAssert(timetable.toStringArrays() == result)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
