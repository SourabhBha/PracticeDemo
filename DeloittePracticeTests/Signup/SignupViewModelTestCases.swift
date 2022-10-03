//
//  SignupViewModelTestCases.swift
//  DeloittePracticeTests
//
//  Created by Sourabh Bhawsar on 21/09/22.
//

import XCTest
@testable import DeloittePractice

class SignupViewModelTestCases: XCTestCase {

    let viewController = SignupViewController()
    let signupViewModel = SignUPViewModel()
    
    let mockRequest = SignupRequest(name: "Hello", email: "hello@world.com", password: "12345678", age: 12)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidateSignupRequest(){
        
        XCTAssertNotNil(mockRequest)
        let validationResponse = signupViewModel.validateSignupFields(request: mockRequest)
        XCTAssertTrue(validationResponse.isValid)
        XCTAssertNil(validationResponse.message)
        
    }
    
    func testOnClickSignupButton(){
        let validationResponse = signupViewModel.validateSignupFields(request: mockRequest)
        XCTAssertNotNil(validationResponse)
        
        if validationResponse.isValid {
            signupViewModel.registerUser(reqModel: mockRequest, viewController: viewController) { userData in
                XCTAssertNotNil(userData)
                XCTAssertNotNil(userData?.token)
                XCTAssertNotNil(userData?.user)
                XCTAssertEqual(self.mockRequest.name, userData?.user.name)
                XCTAssertEqual(self.mockRequest.email, userData?.user.email)
                XCTAssertEqual(self.mockRequest.age, userData?.user.age)
                
                return ()
            }
        }else{
            viewController.showAlert(message: validationResponse.message ?? "")
        }
    }
    
    func testGotoPreviousViewController(){
        signupViewModel.gotoPreviousViewController(navigationViewController: viewController.navigationController)
    }
    
    func registerUser(reqModel: SignupRequest,viewController: UIViewController ,completionHandler: @escaping ((UserData?))-> Void?){
        
            //Established Connection  From the Sever  and user to Login with Parameter and and Connection with the Post Api
            NetworkManager.sharedInstance.executeApi(BaseUrl.development.rawValue, endPoint: APIEndPoints.register.rawValue, reqModel: reqModel, methodType: .post, parameter: nil, resultType: UserData.self, viewController: viewController) { (loginResponse) in
                
                guard loginResponse != nil else { return }
                completionHandler(loginResponse)
            }
    }
    
    func testRegisterUser(){
        signupViewModel.registerUser(reqModel: mockRequest, viewController: viewController) { userData in
            XCTAssertNotNil(userData?.token)
            XCTAssertNotNil(userData?.user)
            XCTAssertEqual(self.mockRequest.name, userData?.user.name)
            XCTAssertEqual(self.mockRequest.email, userData?.user.email)
            XCTAssertEqual(self.mockRequest.age, userData?.user.age)
            
            return ()
        }
    }
}
