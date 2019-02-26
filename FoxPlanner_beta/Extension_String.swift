//
//  Extension_String.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 07/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation

extension String {
    //Email: xxxx@xxx.xxx
    func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    //Password: 8 <= (A + a + 0).length <= 16
    func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
}
