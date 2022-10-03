//
//  SignupValidation.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation
struct SignupValidation {
    
    func validate(request: SignupRequest) -> ValidationResponse{
        
        guard let name = request.name, !name.isEmpty  else {
            return ValidationResponse(message: Constants.AlertMessages.enterNameMessage, isValid: false)
        }
        
        guard let email = request.email, !email.isEmpty  else {
            return ValidationResponse(message: Constants.AlertMessages.enterEmailMessage, isValid: false)
        }
        
        if !email.isValidEmail(){
            return ValidationResponse(message: Constants.AlertMessages.enterValidEmailMessage, isValid: false)
        }
        
        guard let age = request.age, age != 0  else {
            return ValidationResponse(message: Constants.AlertMessages.enterAgeMessage, isValid: false)
        }
        
        if age < 5{
            return ValidationResponse(message: Constants.AlertMessages.enterValidAge, isValid: false)
        }
        
        guard let password = request.password, !password.isEmpty else {
            return ValidationResponse(message: Constants.AlertMessages.enterPasswordMessage, isValid: false)
        }
        
        if password.count < 7{
            return ValidationResponse(message: Constants.AlertMessages.enterValidPassword, isValid: false)
        }
        
        return ValidationResponse(message: nil, isValid: true)
    }
}
