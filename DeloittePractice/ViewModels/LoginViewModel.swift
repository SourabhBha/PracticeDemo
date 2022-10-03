//
//  LoginViewModel.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation
import UIKit

class LoginViewModel: NSObject {
    
    let loginValidation = LoginValidation()
    let utility = Utility()
    
    func validateLoginFields(request: LoginRequest) -> ValidationResponse {
        
        let validationResponse = loginValidation.validate(request: request)
        
        return validationResponse
    }
    
    func userLogin(reqModel: LoginRequest, viewController: UIViewController ,completionHandler: @escaping ((UserData?))-> Void?) {
        
            //Established Connection  From the Sever  and user to Login with Parameter and and Connection with the Post Api
            NetworkManager.sharedInstance.executeApi(BaseUrl.development.rawValue, endPoint: APIEndPoints.login.rawValue, reqModel: reqModel, methodType: .post, parameter: nil,resultType: UserData.self,viewController: viewController) { (loginResponse) in
                
                guard loginResponse != nil else { return }
                completionHandler(loginResponse)
            }
    }
    
    func onClickLoginButton(loginRequest: LoginRequest, viewController: UIViewController){
        
        let validationResponse = self.validateLoginFields(request: loginRequest)
        
        if validationResponse.isValid {
            
            self.userLogin(reqModel: loginRequest, viewController: viewController) { (userData) in
                self.utility.saveUserToken(token: userData?.token ?? "")
                self.utility.showDashboardScreen()
                return ()
            }
        }else{
            viewController.showAlert(message: validationResponse.message ?? "")
        }
    }
    
    func onClickSignupButton(viewController: UIViewController?){
        if let signupVC = viewController?.storyboard?.instantiateViewController(withIdentifier: Constants.ControllerId.signupVC) as? SignupViewController{
            
            viewController?.navigationController?.pushViewController(signupVC, animated: true)
        }
    }
    
}
