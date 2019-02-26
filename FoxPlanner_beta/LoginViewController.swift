//
//  LoginViewController.swift
//  FoxPlanner_beta
//
//  Created by Seunghyun Lee on 31/12/2018.
//  Copyright © 2018 Seunghyun Lee. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting views
        initTextFieldsTag()
        fillLastLoginInfo()
    }
    
    let controller = Login()
    
    @IBOutlet weak private var emailField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    
    @IBAction private func loginButton(_ sender: Any) {
        let email = emailField.text!
        let password = passwordField.text!
        let account = Account(email: email, password: password)
        
        do {
            try controller.checkInfo(account: account)
        } catch let error as AccountError {
            showAlertController(message: error.rawValue)
            return
        } catch {
            assert(false, "Unexpected error: \(error)")
        }
        
        controller.requestLoginFromServer(account: account) { (isSuccess, errorCode) in
            if isSuccess {
                self.controller.saveDataOnLoginSuccess(account: account)
                self.setMainMenuTVCsViews(to: account)
                self.dismiss(animated: true, completion: nil)
            } else {
                let message = self.controller.serverErrorMessages
                self.showAlertController(message: message[errorCode])
                return
            }
        }
    }
    @IBAction private func signupButton(_ sender: Any) {
        //Show Sign Up Page by Segue
    }
    @IBAction private func findPasswordButton(_ sender: Any) {
    }
    
    public func setAccountViews(to account: Account) {
        emailField!.text = account.email
        passwordField.text = account.password
    }
    
    private func initTextFieldsTag() {
        let textFields = [emailField!, passwordField!]
        
        for i in (0..<textFields.count) {
            textFields[i].delegate = self
            textFields[i].tag = i
        }
    }
    private func fillLastLoginInfo() {
        if let account = controller.lastLoginAccount {
            emailField.text = account.email
            passwordField.text = account.password
        }
    }
    
    private func setMainMenuTVCsViews(to account: Account) {
        let root = UIApplication.shared.windows[0].rootViewController
        let mainMenuTVC = root?.children[0] as! MainMenuTableViewController
        mainMenuTVC.setAccountViews(to: account)
    }
}

extension LoginViewController: UITextFieldDelegate {
    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            self.loginButton(true)
        }
        return false
    }
}
