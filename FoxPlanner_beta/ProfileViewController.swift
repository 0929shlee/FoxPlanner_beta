//
//  ProfileTableViewController.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 31/01/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting views
        self.navigationItem.title = "Profile"
        initTextFieldsTag()
        
        if let account = controller.lastLoginAccount {
            setAccountViews(to: account)
        } else {
            assert(false, "This statement should not be executed")
        }
    }
    
    let controller = Profile()

    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var emailLabel: UILabel!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var confirmPasswordTextField: UITextField!
    
    @IBAction private func doneButton(_ sender: Any) {
        let name = nameTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        
        do {
            try controller.checkInfo(name: name, password: password, confirmPassword: confirmPassword)
        } catch let error as AccountError {
            showAlertController(message: error.rawValue)
            return
        } catch {
            assert(false, "Unexpected error: \(error)")
        }
        
        controller.saveDataOnDoneEditing(name: name, password: password)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func initTextFieldsTag() {
        let textFields = [nameTextField!, passwordTextField!, confirmPasswordTextField!]
        
        for i in (0..<textFields.count) {
            textFields[i].delegate = self
            textFields[i].tag = i
        }
    }
    private func setAccountViews(to account: Account) {
        nameTextField.text = account.name
        emailLabel.text = account.email
    }
    
    private func setMainMenuTVCsViews(to account: Account) {
        let root = UIApplication.shared.windows[0].rootViewController
        let mainMenuTVC = root?.children[0] as! MainMenuTableViewController
        mainMenuTVC.setAccountViews(to: account)
    }
}

extension ProfileViewController: UITextFieldDelegate {
    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            self.doneButton(true)
        }
        return false
    }
}
