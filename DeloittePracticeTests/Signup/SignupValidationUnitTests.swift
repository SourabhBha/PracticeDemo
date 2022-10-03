//
//  SignupValidationUnitTests.swift
//  DeloittePracticeTests
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import XCTest
@testable import DeloittePractice

class SignupValidationUnitTests: XCTestCase {

    func testSignupValidationWithEmptyNameReturnValidationFailure(){
        // ARRANGE
        let validation = SignupValidation()
        let request = SignupRequest(name: "", email: "", password: "", age: 0)
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, Constants.AlertMessages.enterNameMessage)
    }
    
    func testSignupValidationWithEmptyEmailReturnValidationFailure(){
        // ARRANGE
        let validation = SignupValidation()
        let request = SignupRequest(name: "test", email: "", password: "", age: 0)
        
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
    
    
    func testSignupValidationWithEmptyAgeReturnValidationFailure(){
        // ARRANGE
        let validation = SignupValidation()
        let request = SignupRequest(name: "test", email: "test@gmail.com", password: "", age: 0)
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, Constants.AlertMessages.enterAgeMessage)
    }
    
    func testSignupValidationWithInvalidAgeReturnValidationFailure(){
        // ARRANGE
        let validation = SignupValidation()
        let request = SignupRequest(name: "test", email: "test@gmail.com", password: "", age: 2)
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, Constants.AlertMessages.enterValidAge)
    }
    
    func testSignupValidationWithemptyPasswordReturnValidationFailure(){
        // ARRANGE
        let validation = SignupValidation()
        let request = SignupRequest(name: "test", email: "test@gmail.com", password: "", age: 5)
        
        //ACT
        let result = validation.validate(request: request)
        
        //ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, Constants.AlertMessages.enterPasswordMessage)
    }
}
