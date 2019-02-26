//
//  Extension_UIViewController.swift
//  FoxPlanner_beta
//
//  Created by leeseunghyun on 07/02/2019.
//  Copyright © 2019 Seunghyun Lee. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func presentNewVC(storyboardName: String, identifier: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        self.present(viewController, animated: true, completion: nil)
    }
    
    func showAlertController(message: String, buttonMessage: String = "OK") {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonMessage, style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
