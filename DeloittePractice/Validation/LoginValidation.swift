//
//  LoginValidation.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation

struct LoginValidation {
    func validate(request: LoginRequest) -> ValidationResponse{
        
        guard let email = request.email, !email.isEmpty  else {
            return ValidationResponse(message: Constants.AlertMessages.enterEmailMessage, isValid: false)
        }
        
        if !email.isValidEmail(){
            return ValidationResponse(message: Constants.AlertMessages.enterValidEmailMessage, isValid: false)
        }
        
        guard let password = request.password, !password.isEmpty else {
            return ValidationResponse(message: Constants.AlertMessages.enterPasswordMessage, isValid: false)
        }
        
        return ValidationResponse(message: nil, isValid: true)
    }
}
