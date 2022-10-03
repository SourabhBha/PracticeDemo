//
//  LoginApiResourceTestCases.swift
//  DeloittePracticeTests
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import XCTest
@testable import DeloittePractice

class LoginApiResourceTestCases: XCTestCase {

    let viewController = LoginViewController()
    let loginViewModel = LoginViewModel()
    
    func testLoginApiWithValidRequestReturnsLoginResponse() {
        // ARRANGE
        let request = LoginRequest(email: "sourabhbhawsar19@gmail.com", password: "12345678")
        
        let expectation = self.expectation(description: "ValidRequest_Returns_LoginResponse")

        // ACT
        loginViewModel.userLogin(reqModel: request, viewController: viewController) { (loginResponse) in
            
            // ASSERT
            XCTAssertNotNil(loginResponse)
//            XCTAssertNil(loginResponse?.errorMessage)
            XCTAssertEqual(request.email, loginResponse?.user.email)
            XCTAssertEqual("Sourabh Bhavsar", loginResponse?.user.name)
            XCTAssertEqual("63286508a481be0017484a7b", loginResponse?.user.id)
            XCTAssertNotNil(loginResponse?.token)
            expectation.fulfill()
            return ()
        }

        waitForExpectations(timeout: 8, handler: nil)
    }
    
    /*func test_LoginApiResource_With_InValidRequest_Returns_Error(){

        // ARRANGE
        let request = LoginRequest(email: "Hello@world.com", password: "1234")
        let loginViewModel = LoginViewModel()
        let expectation = self.expectation(description: "InValidRequest_Returns_Error")

        // ACT
        loginViewModel.userLogin(reqModel: request, viewController: viewController) { (loginResponse) in
            
            // ASSERT
            XCTAssertNotNil(loginResponse)
//            XCTAssertNotNil(loginResponse?.errorMessage)
            XCTAssertNil(loginResponse?.)
            XCTAssertEqual("Unable to login", loginResponse?.errorMessage)

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }*/
    
}
