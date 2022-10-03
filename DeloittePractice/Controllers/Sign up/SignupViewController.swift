//
//  SignupViewController.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var tfName: FloatLabelTextField!
    @IBOutlet weak var tfEmail: FloatLabelTextField!
    @IBOutlet weak var tfAge: FloatLabelTextField!
    @IBOutlet weak var tfPassword: FloatLabelTextField!
    
    let signupViewModel = SignUPViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func actionOnSignUp(_ sender: Any) {
        let signupRequest = SignupRequest(name: tfName.text?.trimmed() ?? "", email: tfEmail.text?.trimmed() ?? "", password: tfPassword.text?.trimmed() ?? "", age: Int(tfAge.text?.trimmed() ?? "0") ?? 0)
        
        self.signupViewModel.onClickSignupButton(signupRequest: signupRequest, viewController: self)
    }
    
    @IBAction func actionOnSignIn(_ sender: Any) {
        self.signupViewModel.gotoPreviousViewController(navigationViewController: self.navigationController)
    }
}

extension SignupViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
