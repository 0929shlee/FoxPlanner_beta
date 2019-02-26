//
//  SignupViewController.swift
//  FoxPlanner_beta
//
//  Created by Seunghyun Lee on 31/12/2018.
//  Copyright © 2018 Seunghyun Lee. All rights reserved.
//

import UIKit
import Alamofire

class SignupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting views
        initTextFieldsTag()
    }
    
    let controller = Signup()
    
    @IBOutlet weak private var nameField: UITextField!
    @IBOutlet weak private var emailField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    @IBOutlet weak private var confirmPasswordField: UITextField!
    
    @IBAction private func signupButton(_ sender: Any) {
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        let confirmPassword = confirmPasswordField.text!
        let account = Account(name: name, email: email, password: password)
        
        do {
            try controller.checkInfo(account: account, confirmPassword: confirmPassword)
        } catch let error as AccountError {
            showAlertController(message: error.rawValue)
            return
        } catch {
            assert(false, "Unexpected error: \(error)")
        }
        
        controller.requestSignupServer(account: account) { (isSuccess, errorCode) in
            if isSuccess {
                self.setLoginVCsViews(to: account)
                self.dismiss(animated: true, completion: nil)
            } else {
                let message = self.controller.serverErrorMessages
                self.showAlertController(message: message[errorCode])
                return
            }
        }
    }
    @IBAction private func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction private func findAccountButton(_ sender: Any) {
    }
    
    private func initTextFieldsTag() {
        let textFields = [nameField!, emailField!, passwordField!, confirmPasswordField!]
        
        for i in (0..<textFields.count) {
            textFields[i].delegate = self
            textFields[i].tag = i
        }
    }
    
    private func resetTextFields() {
        emailField.text = ""
        passwordField.text = ""
        confirmPasswordField.text = ""
    }
    
    private func setLoginVCsViews(to account: Account) {
        let loginVC = self.presentingViewController as! LoginViewController
        loginVC.setAccountViews(to: account)
    }
}

extension SignupViewController: UITextFieldDelegate {
    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            self.signupButton(true)
        }
        return false
    }
}
