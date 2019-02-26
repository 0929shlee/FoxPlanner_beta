//
//  Signup.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 11/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation
import Alamofire

class Signup {
    let serverErrorMessages = ["Fine",
                               "Server Problem",
                               "DB Problem",
                               "이미 존재하는 계정입니다",
                               "I don't know"]
    
    func checkInfo(account: Account, confirmPassword: String) throws {
        if account.name == "" {
            throw AccountError.emptyName
        }
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
        if confirmPassword == "" {
            throw AccountError.emptyConfirmPassword
        }
        guard account.password == confirmPassword else {
            throw AccountError.unequalPassword
        }
    }
    
    func requestSignupServer(account: Account, completion: @escaping (Bool, Int) -> ()) {
        let parameters: Parameters = [ "Name" : account.name,
                                       "Email" : account.email,
                                       "Password" : account.password ]
        
        let urlPath = "http://hornz.cafe24.com/Log_in/registerUser.php"
        
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
}
