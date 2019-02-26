//
//  Profile.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 11/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation

class Profile {
    var lastLoginAccount: Account? {
        get {
            return LastLoginData.load()
        }
    }
    
    func checkInfo(name: String, password: String, confirmPassword: String) throws {
        if name == "" {
            throw AccountError.emptyName
        }
        if (password != "") && (confirmPassword == "") {
            throw AccountError.emptyConfirmPassword
        }
        guard (password == "") || password.validatePassword() else {
            throw AccountError.invalidPassword
        }
        if password != confirmPassword {
            throw AccountError.unequalPassword
        }
    }
    
    func saveDataOnDoneEditing(name: String, password: String) {
        let account = lastLoginAccount!
        
        account.name = name
        if password != "" {
            account.password = password
        }
        
        LastLoginData.save(account: account)
    }
}
