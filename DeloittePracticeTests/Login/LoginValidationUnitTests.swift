//
//  LoginValidationUnitTests.swift
//  DeloittePracticeTests
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import XCTest
@testable import DeloittePractice

class LoginValidationUnitTests: XCTestCase {

    func testLoginValidationWithEmptyEmailReturnsValidationFailure(){
        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(email: "", password: "")
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, Constants.AlertMessages.enterEmailMessage)
    }
    
    func testLoginValidationWithInvalidEmailReturnsValidationFailure(){
        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(email: "test", password: "")
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, Constants.AlertMessages.enterValidEmailMessage)
    }
    
    func testLoginValidationWithEmptyPasswordReturnsValidationFailure(){
        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(email: "test@gmail.com", password: "")
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, Constants.AlertMessages.enterPasswordMessage)
    }
    
    func testLoginValidationWithValidRequestReturnsSuccessResponse(){
        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(email: "test@gmail.com", password: "test")
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertTrue(result.isValid)
        XCTAssertNil(result.message)
    }
}
