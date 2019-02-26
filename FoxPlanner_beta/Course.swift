//
//  Course.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 11/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation

struct Course : Equatable {
    var id = String()
    var title = String()
    var prof = String()
    var time = [DayName: [Int]]()
    
    init(id: String, title: String, prof: String, time: [DayName: [Int]]) {
        self.id = id
        self.title = title
        self.prof = prof
        self.time = time
    }
    init(id: String, title: String, prof: String, array: [Int]) {
        self.id = id
        self.title = title
        self.prof = prof
        self.time = convertIntsToTimeDict(array: array)
    }
    init(array: [String]) {
        let id = array[0]
        let title = array[1]
        let prof = array[2]
        let timeStringArray = array[3...]
        
        var array = [Int]()
        for s in timeStringArray {
            if let i = Int(s) {
                array.append(i)
            }
        }
        self.init(id: id, title: title, prof: prof, array: array)
    }
    
    private func convertIntsToTimeDict(array: [Int]) -> [DayName: [Int]] {
        var tempDict: [DayName: [Int]] = [DayName.Mon: [], DayName.Tue: [], DayName.Wed: [], DayName.Thu: [], DayName.Fri: []]
        for i in array {
            let quotient = i / 30
            let remainder = i % 30
            tempDict[DayName(rawValue: quotient)!]!.append(remainder + 1)
        }
        
        var tempTime = [DayName: [Int]]()
        for (name, arr) in tempDict {
            if arr != [] {
                tempTime[name] = arr
            }
        }
        
        return tempTime
    }
    private func convertTimeToIntArray() -> [Int] {
        var array = [Int]()
        for (name, ises) in self.time {
            for i in ises {
                let value = name.rawValue * 30 + i - 1
                array.append(value)
            }
        }
        return array
    }
    func convertToStringArray() -> [String] {
        var array = [String]()
        
        array.append(self.id)
        array.append(self.title)
        array.append(self.prof)
        for i in convertTimeToIntArray() {
            array.append(String(i))
        }
        return array
    }
}
