//
//  AccountData.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 16/01/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation

class AccountData {
    static private var plistURL: URL {
        let documentDirectoryURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentDirectoryURL.appendingPathComponent("AccountList.plist")
    }
    static private func savePropertyList(_ plist: Any) throws {
        let plistData = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
        try plistData.write(to: plistURL)
    }
    static private func loadPropertyList() throws -> [String : [String]] {
        let data = try Data(contentsOf: plistURL)
        guard let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String : [String]] else {
            return [String : [String]]()
        }
        return plist
    }
    
    static private func _append(dictionary: [String: [String]], key account: Account) {
        do {
            let key = account.email
            var tempDict = dictionary
            if tempDict[key] != nil {
                return
            } else {
                tempDict[key] = account.toStringArray()
                try savePropertyList(tempDict)
            }
        } catch {
            print(error)
        }
    }
    static func append(account: Account) {
        do {
            let dictionary = try loadPropertyList()
            _append(dictionary: dictionary, key: account)
        } catch {
            _append(dictionary: [String: [String]](), key: account)
            print(error)
        }
    }
    static func replace(account: Account) {
        do {
            let key = account.email
            var dictionary = try loadPropertyList()
            if dictionary[key] == nil {
                return
            } else {
                dictionary[key] = account.toStringArray()
                try savePropertyList(dictionary)
            }
        } catch {
            print(error)
        }
    }
    static func load(by email: String) -> Account? {
        do {
            let dictionary = try loadPropertyList()
            if let list = dictionary[email] {
                let account = Account(name: list[0], email: list[1], password: list[2])
                return account
            }
        } catch {
            print(error)
        }
        return nil
    }
}

class LastLoginData {
    static private var plistURL: URL {
        let documentDirectoryURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentDirectoryURL.appendingPathComponent("LastLogin.plist")
    }
    static private func savePropertyList(_ plist: Any) throws {
        let plistData = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
        try plistData.write(to: plistURL)
    }
    static private func loadPropertyList() throws -> [String] {
        let data = try Data(contentsOf: plistURL)
        guard let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String] else {
            return [String]()
        }
        return plist
    }
    
    static func save(account: Account) {
        do {
            if let loadedAccount = AccountData.load(by: account.email) {
                try savePropertyList(loadedAccount.toStringArray())
            } else {
                try savePropertyList(account.toStringArray())
            }
        } catch {
            print(error)
        }
    }
    static func load() -> Account? {
        do {
            let list = try loadPropertyList()
            let account = Account(name: list[0], email: list[1], password: list[2])
            return account
        } catch {
            print(error)
        }
        return nil
    }
    static func remove() {
        do {
            try savePropertyList(Account().toStringArray())
        } catch {
            print(error)
        }
    }
}

class TimetableData {
    static private var plistURL: URL {
        let documentDirectoryURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        return documentDirectoryURL.appendingPathComponent("TimetableList.plist")
    }
    static private func savePropertyList(_ plist: Any) throws {
        let plistData = try PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0)
        try plistData.write(to: plistURL)
    }
    static private func loadPropertyList() throws -> [String : [[String]]] {
        let data = try Data(contentsOf: plistURL)
        guard let plist = try PropertyListSerialization.propertyList(from: data, format: nil) as? [String : [[String]]] else {
            return [String : [[String]]]()
        }
        return plist
    }
    
    static private func _append(dictionary: [String: [[String]]], key account: Account, timetable: Timetable) {
        do {
            let key = account.email
            var tempDict = dictionary
            if tempDict[key] != nil {
                return
            } else {
                tempDict[key] = timetable.toStringArrays()
                try savePropertyList(tempDict)
            }
        } catch {
            print(error)
        }
    }
    static func append(key account: Account, timetable: Timetable) {
        do {
            let dictionary = try loadPropertyList()
            _append(dictionary: dictionary, key: account, timetable: timetable)
        } catch {
            _append(dictionary: [String: [[String]]](), key: account, timetable: timetable)
            print(error)
        }
    }
    static func replace(key account: Account, timetable: Timetable) {
        do {
            let key = account.email
            var dictionary = try loadPropertyList()
            if dictionary[key] == nil {
                return
            } else {
                dictionary[key] = timetable.toStringArrays()
                try savePropertyList(dictionary)
            }
        } catch {
            print(error)
        }
    }
    static func load(key account: Account) -> Timetable? {
        do {
            let key = account.email
            let dictionary = try loadPropertyList()
            if let arrays = dictionary[key] {
                let timetable = Timetable(stringArrays: arrays)
                return timetable
            }
        } catch {
            print(error)
        }
        return nil
    }
}
