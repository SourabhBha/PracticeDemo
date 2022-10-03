//
//  SignupViewModel.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import Foundation
import UIKit

class SignUPViewModel: NSObject{
    
    let utility = Utility()
    
    func validateSignupFields(request: SignupRequest) -> ValidationResponse{
        let validationResponse = SignupValidation().validate(request: request)
        
        return validationResponse
    }
    
    func registerUser(reqModel: SignupRequest,viewController: UIViewController ,completionHandler: @escaping ((UserData?))-> Void?){
        
            //Established Connection  From the Sever  and user to Login with Parameter and and Connection with the Post Api
            NetworkManager.sharedInstance.executeApi(BaseUrl.development.rawValue, endPoint: APIEndPoints.register.rawValue, reqModel: reqModel, methodType: .post, parameter: nil, resultType: UserData.self, viewController: viewController) { (loginResponse) in
                
                guard loginResponse != nil else { return }
                completionHandler(loginResponse)
            }
    }
    
    func onClickSignupButton(signupRequest: SignupRequest, viewController: UIViewController){
        
        let validationResponse = self.validateSignupFields(request: signupRequest)
        
        if validationResponse.isValid {
            self.registerUser(reqModel: signupRequest, viewController: viewController)  { (userData) in
                self.utility.saveUserToken(token: userData?.token ?? "")
                self.utility.showDashboardScreen()
                return ()
            }
        }else{
            viewController.showAlert(message: validationResponse.message ?? "")
        }
    }
    
    func gotoPreviousViewController(navigationViewController: UINavigationController?){
        navigationViewController?.popViewController(animated: true)
    }
}
