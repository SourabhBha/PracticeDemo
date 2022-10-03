//
//  Utility.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 20/09/22.
//

import Foundation
import UIKit

struct Utility {
    
    static let loaderView = Bundle.main.loadNibNamed("AppLoaderView", owner: nil, options: nil)![0] as! AppLoaderView
    
    static func isLoader(visible:Bool) {
        
        if visible {
            let window = Constants.Shared.sharedApplication.keyWindow
            self.loaderView.frame = (window?.frame)!
            window?.addSubview(self.loaderView)
        }
        else{
            self.loaderView.removeFromSuperview()
        }
    }
    
    func showDashboardScreen(){
        DispatchQueue.main.async {
            if let usersListVC = UIStoryboard.init(name: StoryBoardName.mainSBName.rawValue, bundle: nil).instantiateViewController(withIdentifier: Constants.ControllerId.rootNV) as? UINavigationController{
                
                if let keyWindow = UIWindow.key {
                    // Do something
                    keyWindow.rootViewController = usersListVC
                }
            }
        }
    }
    
    func showLogoutScreen(){
        DispatchQueue.main.async {
            if let authNV = UIStoryboard.init(name: StoryBoardName.mainSBName.rawValue, bundle: nil).instantiateViewController(withIdentifier: Constants.ControllerId.authNV) as? UINavigationController{
                
                if let keyWindow = UIWindow.key {
                    // Do something
                    keyWindow.rootViewController = authNV
                }
            }
        }
    }
    
    func saveUserToken(token: String){
        UserDefaults.standard.set(token, forKey: Constants.KString.token)
    }
    
    func getUserToken() -> String{
        UserDefaults.standard.string(forKey: Constants.KString.token) ?? ""
    }
}
