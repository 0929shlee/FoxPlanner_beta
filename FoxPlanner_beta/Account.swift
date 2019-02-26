//
//  Account.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 28/01/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation

class Account {
    var name: String
    var email: String
    var password: String
    
    convenience init(name: String, email: String, password: String) {
        self.init(email: email, password: password)
        self.name = name
    }
    init(email: String, password: String) {
        self.name = ""
        self.email = email
        self.password = password
    }
    init() {
        self.name = ""
        self.email = ""
        self.password = ""
    }
    
    func toStringArray() -> [String] {
        return [self.name, self.email, self.password]
    }
}
