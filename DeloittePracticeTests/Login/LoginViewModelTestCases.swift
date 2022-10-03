//
//  LoginViewModelTestCases.swift
//  DeloittePracticeTests
//
//  Created by Sourabh Bhawsar on 21/09/22.
//

import XCTest
@testable import DeloittePractice

class LoginViewModelTestCases: XCTestCase {

    let viewController = LoginViewController()
    let loginViewModel = LoginViewModel()
    
//    let mockRequest = LoginRequest(email: "test@gmail.com", password: "1234")
    let mockRequest = LoginRequest(email: "sourabhbhawsar19@gmail.com", password: "12345678")
    
    func testValidateLoginRequest(){
        
        XCTAssertNotNil(mockRequest)
        let validationResponse = loginViewModel.validateLoginFields(request: mockRequest)
        XCTAssertTrue(validationResponse.isValid)
        XCTAssertNil(validationResponse.message)
        
    }
    
    func testOnClickSignupButton(){
        loginViewModel.onClickSignupButton(viewController: viewController)
        
        if let signupVC = viewController.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerId.signupVC) as? SignupViewController{
            XCTAssertNotNil(signupVC)
            viewController.navigationController?.pushViewController(signupVC, animated: true)
        }
    }
    
    func testOnClickLoginButton(){
        let validationResponse = loginViewModel.validateLoginFields(request: mockRequest)
        
        XCTAssertNotNil(validationResponse)
        if validationResponse.isValid {
            loginViewModel.userLogin(reqModel: mockRequest, viewController: viewController) { (userData) in
                XCTAssertNotNil(userData)
                XCTAssertNotNil(userData?.token)
                XCTAssertNotNil(userData?.user)
                return ()
            }
        }else{
            viewController.showAlert(message: validationResponse.message ?? "")
        }
    }
    
    func testUserLogin(){
        loginViewModel.userLogin(reqModel: mockRequest, viewController: viewController) { userData in
            XCTAssertNotNil(userData)
            XCTAssertNotNil(userData?.token)
            XCTAssertNotNil(userData?.user)
            return ()
        }
    }
    
}
