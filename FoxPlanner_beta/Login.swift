//
//  Login.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 11/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation
import Alamofire

class Login {
    var lastLoginAccount: Account? {
        get {
            return LastLoginData.load()
        }
    }
    
    let serverErrorMessages = ["Fine",
                               "Server Problem",
                               "DB Problem",
                               "비밀번호가 맞지 않거나\n 없는 계정입니다",
                               "I don't know"]
    
    func checkInfo(account: Account) throws {
        if account.email == "" {
            throw AccountError.emptyEmail
        }
        guard account.email.validateEmail() else {
            throw AccountError.invalidEmail
        }
        if account.password == "" {
            throw AccountError.emptyPassword
        }
        guard account.password.validatePassword() else {
            throw AccountError.invalidPassword
        }
    }
    
    func requestLoginFromServer(account: Account, completion: @escaping (Bool, Int) -> ()) {
        let parameters: Parameters = [ "Email" : account.email,
                                       "Password" : account.password ]
        
        let urlPath = "http://hornz.cafe24.com/Log_in/LoginUser.php"
        
        AF.request(urlPath, method: .post, parameters: parameters).responseJSON {
            response in
            print(response)
            
            if let result = response.result.value {
                let jsonData = result as! NSDictionary
                
                let isSuccess = jsonData.value(forKey: "isSuccess") as! Bool
                let errorCode = jsonData.value(forKey: "errorCode") as! Int
                
                DispatchQueue.main.async {
                    completion(isSuccess, errorCode)
                }

            }
        }
    }
    
    func saveDataOnLoginSuccess(account: Account) {
        LastLoginData.save(account: account)
    }
}
