//
//  MainMenuTableViewController.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 30/01/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Fox Planner"
        
        if let account = LastLoginData.load() {
            setAccountViews(to: account)
        } else {
            performSegue(withIdentifier: "MainMenuLoginSegue", sender: self)
        }
    }
    
    @IBOutlet weak private var accountImage: UIImageView!
    @IBOutlet weak private var accountEmail: UILabel!
    @IBAction private func logoutButton(_ sender: Any) {
        //Show Login Page by Segue
    }
        
    public func setAccountViews(to account: Account) {
        accountEmail.text = account.email
    }
}
