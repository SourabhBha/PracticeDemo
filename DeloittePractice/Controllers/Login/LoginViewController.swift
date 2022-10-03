//
//  LoginViewController.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfEmail: FloatLabelTextField!
    @IBOutlet weak var tfPassword: FloatLabelTextField!
    
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func actionOnLogin(_ sender: Any) {
        let loginRequest = LoginRequest(email: tfEmail.text?.trimmed(), password: tfPassword.text?.trimmed())
        self.loginViewModel.onClickLoginButton(loginRequest: loginRequest, viewController: self)
    }
        
    @IBAction func actionOnSignup(_ sender: Any) {
        self.loginViewModel.onClickSignupButton(viewController: self)
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

