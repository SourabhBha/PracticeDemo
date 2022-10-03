//
//  Constants.swift
//  DeloittePractice
//
//  Created by Sourabh Bhawsar on 19/09/22.
//

import Foundation
import UIKit

struct Constants{
    
    struct APIEndPoints{
        static let baseUrl = "https://api-nodejs-todolist.herokuapp.com/"//"https://jsonplaceholder.typicode.com/"//"https://gorest.co.in/public/v2/"
        static let userLogin = "user/login"
        static let users = "users"
    }
    
    struct Shared {
        static let sharedApplication = UIApplication.shared
        
    }
    
    struct CellIdentifier{
        static let taskTableViewCell =  "TaskTableViewCell"
    }
    
    struct ControllerId {
        static let userDetailsVC = "UserDetailsViewController"
        static let usersListVC = "UsersListViewController"
        static let rootNV = "RootNV"
        static let authNV = "AuthNV"
        static let signupVC = "SignupViewController"
    }
    
    struct KString {
        static let users = "Users"
        static let alert = "Alert"
        static let userDetails = "User Details"
        static let appName = "Deloitte"
        static let ok = "OK"
        static let token = "token"
    }
    
    struct AlertMessages {
        static let internetNotAvailable = "Internet connection not available"
        static let enterEmailMessage = "Please enter an email"
        static let enterValidEmailMessage = "Please enter a valid email"
        static let enterPasswordMessage = "Please enter a password"
        static let enterNameMessage = "Please enter a name"
        static let enterAgeMessage = "Please enter an age"
        static let enterValidAge = "Age should be greater than 4"
        static let enterValidPassword = "Password should be minimum of 7 characters"
    }
    
    struct AppColor {
        static let lightGrayColor = UIColor(named: "ACACAC")
    }
    
}
