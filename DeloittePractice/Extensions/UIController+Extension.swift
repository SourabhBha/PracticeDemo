//
//  UIController+Extension.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation
import UIKit

extension UIViewController{
    
    func showAlert(message: String){
        // create the alert
        let alert = UIAlertController(title: Constants.KString.appName, message: message, preferredStyle: UIAlertController.Style.alert)

       // add an action (button)
        alert.addAction(UIAlertAction(title: Constants.KString.ok, style: UIAlertAction.Style.default, handler: nil))

       // show the alert
       self.present(alert, animated: true, completion: nil)
    }
}
