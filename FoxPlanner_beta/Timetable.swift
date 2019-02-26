//
//  Timetable.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 01/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation

class Timetable {
    var courses: [Course]
    
    init(courses: [Course]) {
        self.courses = courses
    }
    init(stringArrays: [[String]]) {
        var result = [Course]()
        for sArray in stringArrays {
            let course = Course(array: sArray)
            result.append(course)
        }
        self.courses = result
    }
    
    func toStringArrays() -> [[String]] {
        var array = [[String]]()
        for course in self.courses {
            array.append(course.convertToStringArray())
        }
        return array
    }
}
